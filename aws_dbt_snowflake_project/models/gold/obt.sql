{% set configs = [
    {
        "table": "AIRBNB.SLIVER.SLIVER_BOOKINGS",
        "columns" : "SLIVER_bookings.*",
        "alias" : "SLIVER_bookings"
    },
    { 
      "table" : "AIRBNB.SLIVER.SLIVER_listings",
      "columns" : "SLIVER_listings.HOST_ID, SLIVER_listings.PROPERTY_TYPE, SLIVER_listings.ROOM_TYPE, SLIVER_listings.CITY, SLIVER_listings.COUNTRY, SLIVER_listings.ACCOMMODATES, SLIVER_listings.PRICE_PER_NIGHT, SLIVER_listings.PRICE_PER_NIGHT_TAG, SLIVER_listings.BEDROOMS, SLIVER_listings.BATHROOMS, SLIVER_listings.CREATED_AT as LISTING_CREATED_AT",
        "alias" : "SLIVER_listings",
        "join_condition" : "SLIVER_bookings.listing_id = SLIVER_listings.listing_id"
    },
    {
        "table" : "AIRBNB.SLIVER.SLIVER_HOSTS",
        "columns" : "SLIVER_hosts.HOST_NAME, SLIVER_hosts.HOST_SINCE, SLIVER_hosts.IS_SUPERHOST, SLIVER_hosts.RESPONSE_RATE, SLIVER_hosts.RESPONSE_RATE_QUALITY, SLIVER_hosts.CREATED_AT as HOST_CREATED_AT",
        "alias" : "SLIVER_hosts",
        "join_condition" : "SLIVER_listings.host_id = SLIVER_hosts.host_id"
    }
] %}

SELECT 
    {% for config in configs %}
        {{ config['columns'] }}{% if not loop.last %},{% endif %} 
    {% endfor %}
FROM
    {% for config in configs %}
        {% if loop.first %}
            {{ config['table'] }} AS {{ config['alias'] }}
        {% else %}
            LEFT JOIN {{ config['table'] }} AS {{ config['alias'] }}
            ON {{ config['join_condition'] }}
        {% endif %}
    {% endfor %}
