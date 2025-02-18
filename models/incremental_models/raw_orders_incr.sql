{{ 
    config(
        materialized='incremental',
        schema = 'INCR_LOAD',
        database = 'ANALYTICS',
        unique_key = 'orderid',
        strategy = 'merge'

    )
}}

select * from {{source('RAW','ORDERS')}}

{% if is_incremental() %}
    where orderdate > (SELECT COALESCE(MAX(order_date),'1900-01-01') from {{this}})
{% endif %}