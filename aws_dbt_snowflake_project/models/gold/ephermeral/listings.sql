 {{
  config(
    materialized = 'ephemeral',
    )
}}

{# only context #} 

with listings as 
(
    select  listing_id,
    property_type,
    room_type,
    city,
    country,
    price_per_night_tag,
    LISTING_CREATED_AT

    from {{ ref('obt') }}
)
select * from listings