{{config(materialized = 'table')}}

select 
id,
firdt_name,
last_name
from {{source('datafeed_shared_schema','stg_customerdata')}};
