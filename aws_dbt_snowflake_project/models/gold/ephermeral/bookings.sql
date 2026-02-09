 {{
  config(
    materialized = 'ephemeral',
    )
}}

{# only context #} 

with bookings as 
(
    select  booking_id,
    booking_date,
    booking_status,
    CREATED_AT
    from {{ ref('obt') }}
)
select * from bookings