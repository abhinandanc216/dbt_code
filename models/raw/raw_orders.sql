{{ 
    config(materialized='table')
}}

select * from {{source('RAW','ORDERS')}}