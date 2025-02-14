{{
    config(
        materialized='table'
    )
}}

select
{{ dbt_utils.generate_surrogate_key(['o.orderid', 'c.customerid','p.productid']) }} as sk_orders,
o.orderid,
c.customerid,
p.productid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice,
o.ordercostprice,
o.ordersellingprice - o.ordercostprice as orderprofit,
c.customername,
c.segment,
c.country,
p.category,
p.productname,
p.subcategory,
{{ markup('ordersellingprice', 'ordercostprice') }} as markup,
d.delivery_team
from {{ ref('raw_orders') }} as o
LEFT JOIN {{ ref('raw_customer') }} as c
on o.customerid = c.customerid
LEFT JOIN {{ ref('raw_product') }} as p
on o.productid = p.productid
LEFT JOIN {{ ref('delivery_team') }} as d
ON o.shipmode = d.shipmode