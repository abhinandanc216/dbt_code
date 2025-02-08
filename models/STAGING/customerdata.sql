{{config(materialized = 'view')}}

select 
id,
first_name,
last_name
from {{source('datafeed_shared_schema','STG_CUSTOMERDATA')}}
