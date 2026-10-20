with days as (
    select
        cast(day as date) as date_day
    from
        unnest(generate_date_array('2020-01-01', '2030-12-31', interval 1 day)) as day
)

select
    date_day
from days