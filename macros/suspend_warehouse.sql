{% macro suspend(warehuse_name) %}

    {% set sql %}
        alter warehouse {{warehouuse_name}} suspend
    {% endset%}

    {% set table = run_query(sql) %}
    {% do table.print_table() %}

{% endmacro%}