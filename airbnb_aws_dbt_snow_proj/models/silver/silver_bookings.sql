{{
  config(
    materialized = 'incremental',
    keys = 'BOOKING_ID'
    )
}}

SELECT 
BOOKING_ID,
LISTING_ID,
BOOKING_DATE,
{{ multiply ('NIGHTS_BOOKED','BOOKING_AMOUNT',2)}} AS TOTAL_AMOUNT,
CLEANING_FEE,
SERVICE_FEE,
BOOKING_STATUS,
CREATED_AT
FROM
{{ref('bronze_bookings')}}

if {% if is_incremental() %}
   WHERE CREATED_AT > coalesce((select max(CREATED_AT) from {{ this }}), '1900-01-01')
{% endif %}


