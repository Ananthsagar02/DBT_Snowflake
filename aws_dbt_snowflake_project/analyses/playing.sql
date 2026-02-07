
{% set cols = ['BOOKING_DATE', 'BOOKING_AMOUNT', 'CLEANING_FEE'] %}

select 
 {% for col in cols %}
    {{ col }}
         {% if not loop.last %}, {% endif %}
 {% endfor %} 
from {{ ref('bronze_bookings') }}  