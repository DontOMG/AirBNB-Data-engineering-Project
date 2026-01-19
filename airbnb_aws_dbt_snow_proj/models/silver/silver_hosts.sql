{{config(materialized = 'incremental', unique_key = 'HOST_ID')}}

SELECT
HOST_ID,
HOST_NAME,
HOST_SINCE,
IS_SUPERHOST,
RESPONSE_RATE,
{{ host_responce("RESPONSE_RATE")}} AS RESPONSE_PROBABILITY,
CREATED_AT
FROM 
{{ref('bronze_hosts')}}