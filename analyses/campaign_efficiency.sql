-- Which campaigns generate the highest return for every unit of spend?

select
    c.campaign_name,
    c.channel,
    sum(f.spend) as total_spend,
    sum(f.revenue) as total_revenue,
    sum(f.conversions) as total_conversions,

    case
        when sum(f.spend) > 0
            then sum(f.revenue) / sum(f.spend)
        else 0
    end as roas

from {{ ref('fct_campaign_performance') }} f

left join {{ ref('dim_campaigns') }} c
    on f.campaign_id = c.campaign_id

group by
    c.campaign_name,
    c.channel

order by roas desc