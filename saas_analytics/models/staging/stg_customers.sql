with source as (
    select * from {{ source('raw_saas', 'raw_customers') }}
),

renamed as (
    select
        cast(customer_id as string) as customer_id,
        trim(company_name) as company_name,
        trim(industry) as industry,
        cast(created_at as date) as created_at
    from source
)

select * from renamed