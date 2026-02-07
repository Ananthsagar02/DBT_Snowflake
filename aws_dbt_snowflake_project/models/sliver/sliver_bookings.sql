{{ config(materialized = 'incremental',
            unique_key='booking_id'
            ) }}


SELECT
    booking_id,
    listing_id,
    BOOKING_DATE,
    {{ multiply('NIGHTS_BOOKED', 'BOOKING_AMOUNT', 2) }} AS total__amount,
    CLEANING_FEE,
    SERVICE_FEE,
    BOOKING_STATUS,
    CREATED_AT
FROM 
    {{ ref('bronze_bookings') }}

    
