{{
    config(
        materialized='table'
    )
}}

select
o.orderid,
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
p.subcategory
from {{ ref('raw_orders') }} as o
LEFT JOIN {{ ref('raw_customer') }} as c
on o.customerid = c.customerid
LEFT JOIN {{ ref('raw_product') }} as p
on o.productid = p.productid