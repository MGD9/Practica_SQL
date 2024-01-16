CREATE OR REPLACE TABLE keepcoding.ivr_summary AS
WITH previous_calls
    AS (SELECT phone_number
              ,start_date
              ,LAG(start_date) OVER(PARTITION BY phone_number ORDER BY start_date, phone_number) AS repeated_phone
              ,  IF(TIMESTAMP_DIFF(start_date, LAG(start_date) OVER (PARTITION BY phone_number ORDER BY start_date, phone_number), HOUR) <= 24,1,0) AS repeated_phone_24H
      FROM `keepcoding.ivr_calls`)
  , later_calls
    AS(SELECT phone_number
              ,start_date
              ,LEAD(start_date) OVER(PARTITION BY phone_number ORDER BY start_date, phone_number) AS cause_recall_phone
              ,  IF(TIMESTAMP_DIFF(start_date, LAG(start_date) OVER (PARTITION BY phone_number ORDER BY start_date, phone_number), HOUR) <= 24,1,0) AS cause_recall_phone_24H
              FROM `keepcoding.ivr_calls`)
SELECT detail.ivr_id
  , detail.phone_number
  , detail.ivr_result
  ,CASE
    WHEN vdn_label LIKE 'ATC%' THEN 'FRONT'
    WHEN vdn_label LIKE 'TECH%' THEN 'TECH'
    WHEN vdn_label = 'ABSORPTION' THEN 'ABSORPTION'
    ELSE 'RESTO'
    END AS vdn_aggregation
  , detail.start_date
  , detail.end_date
  , detail.total_duration
  , detail.customer_segment
  , detail.ivr_language
  , detail.steps_module
  , detail.module_aggregation
  , COALESCE(document_type, 'UNKNOWN') AS document_type
  , COALESCE(document_identification, 'UNKNOWN') AS document_identification
  , COALESCE(customer_phone, 'UNKNOWN') AS customer_phone
  , COALESCE(billing_account_id, 'UNKNOWN') AS billing_account_id
  , MAX(IF('AVERIA_MASIVA' IN UNNEST(SPLIT(module_aggregation, ',')), 1, 0)) AS masiva_lg
  , IF(detail.step_name = 'CUSTOMERINFOBYPHONE.TX' AND detail.step_description_error = 'UNKNOWN', 1, 0) AS info_by_phone_lg
  , IF(detail.step_name = 'CUSTOMERINFOBYDNI.TX' AND detail.step_description_error = 'UNKNOWN', 1, 0) AS info_by_dni_lg
  , previous_calls.repeated_phone_24H
  , later_calls.cause_recall_phone_24H
    FROM `keepcoding.ivr_detail` detail
    LEFT JOIN previous_calls
      ON previous_calls.phone_number = detail.phone_number
    LEFT JOIN later_calls
      ON later_calls.phone_number = detail.phone_number
  GROUP BY detail.ivr_id
  , detail.phone_number
  , ivr_result
  , vdn_aggregation
  , start_date
  , end_date
  , total_duration
  , customer_segment
  , ivr_language
  , steps_module
  , module_aggregation
  , document_type
  , document_identification
  , customer_phone
  , billing_account_id
  , info_by_phone_lg
  , info_by_dni_lg
  , repeated_phone_24H
  , cause_recall_phone_24H
