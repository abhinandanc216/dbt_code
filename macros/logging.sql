{% macro learn_logging() %}
    {{ log("Hi, I am learning DBT!", info=True) }}
{% endmacro %}