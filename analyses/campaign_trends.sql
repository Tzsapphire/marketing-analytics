How is overall marketing performance changing over time?

select
    date_trunc('month', performance_date) as performance_month,

    sum(spend) as spend,
    sum(revenue) as revenue,
    sum(clicks) as clicks,
    sum(conversions) as conversions,

    sum(revenue) / nullif(sum(spend), 0) as roas

from {{ ref('fct_campaign_performance') }}

group by 1
order by 1