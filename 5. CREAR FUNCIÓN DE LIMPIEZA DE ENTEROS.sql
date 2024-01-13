CREATE OR REPLACE FUNCTION keepcoding.clean_integer(input_integer INT64) AS (
  IFNULL(input_integer, -999999)
);
