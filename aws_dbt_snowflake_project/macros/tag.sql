{% macro tag(col) %}

CASE
    WHEN {{ col }} < 100 THEN 'Low'
    WHEN {{ col }} > 200 THEN 'High'
    ELSE 'Medium'
END
    
{% endmacro %}