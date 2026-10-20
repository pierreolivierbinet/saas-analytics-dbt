with source as (
    select * from {{ source('raw_saas', 'raw_subscriptions') }}
),

renamed as (
    select
        cast(subscription_id as string) as subscription_id,
        cast(customer_id as string) as customer_id,
        cast(plan_id as string) as plan_id,
        cast(start_date as date) as start_date,
        cast(end_date as date) as end_date,
        trim(status) as status
    from source
)

select * from renamed