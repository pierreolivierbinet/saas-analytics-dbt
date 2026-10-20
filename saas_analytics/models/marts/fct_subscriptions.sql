with subscriptions as (
    select * from {{ ref('stg_subscriptions') }}
),

plans as (
    select * from {{ ref('stg_plans') }}
)

select
    s.subscription_id,
    s.customer_id,
    s.plan_id,
    p.plan_name,
    p.monthly_price,
    s.start_date,
    s.end_date,
    s.status,
    -- Calcul du MRR (Monthly Recurring Revenue) actuel
    case 
        when s.status = 'active' then p.monthly_price
        else 0
    end as mrr
from subscriptions s
left join plans p 
    on s.plan_id = p.plan_id