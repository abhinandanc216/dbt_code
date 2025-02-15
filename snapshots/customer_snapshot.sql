{% snapshot customer_snapshot %}

{{config(
    unique_key = 'customerid',
    strategy = 'timestamp',
    updated_at = 'updated_at',
    invalidate_hard_deletes= True
)
}}

select * from {{ ref('raw_customer') }}

{% endsnapshot %}