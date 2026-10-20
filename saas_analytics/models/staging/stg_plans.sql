with source as (
    select * from {{ source('raw_saas', 'raw_plans') }}
),

renamed as (
    select
        cast(plan_id as string) as plan_id,
        trim(plan_name) as plan_name,
        cast(monthly_price as numeric) as monthly_price
    from source
)

select * from renamed