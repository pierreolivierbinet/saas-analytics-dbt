with customers as (
    select * from {{ ref('stg_customers') }}
)

select
    customer_id,
    company_name,
    industry,
    created_at
from customers