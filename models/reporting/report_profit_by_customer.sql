select
    customerid,
    segment,
    country,
    sum(orderprofit) as profit
from {{ ref('stg_orders') }}
{{group_by(3)}}     --used group_by macro