with performance as (

    select *
    from {{ ref('stg_campaign_performance') }}

),

final as (

    select
        performance_id,
        campaign_id,
        performance_date,

        spend,
        revenue,
        impressions,
        clicks,
        conversions,
        leads_generated,

        cost_per_click,
        cost_per_conversion,

        case
            when impressions > 0
                then clicks * 1.0 / impressions
            else 0
        end as click_through_rate,

        case
            when clicks > 0
                then conversions * 1.0 / clicks
            else 0
        end as conversion_rate,

        case
            when spend > 0
                then revenue * 1.0 / spend
            else 0
        end as return_on_ad_spend,

        case
            when leads_generated > 0
                then spend * 1.0 / leads_generated
            else 0
        end as cost_per_lead

    from performance

)

select *
from final