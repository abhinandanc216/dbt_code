{% snapshot product_snapshot %}

{{config(
    strategy = 'check',
    unique_key = 'PRODUCTID',
    check_cols = ['CATEGORY', 'PRODUCTNAME', 'SUBCATEGORY'],
)
}}

select * from {{ ref('raw_product') }}

{% endsnapshot %}