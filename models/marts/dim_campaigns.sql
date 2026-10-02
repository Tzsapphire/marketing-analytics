with campaigns as (

    select *
    from {{ ref('int_campaigns_enriched') }}

)

select
    campaign_id,
    campaign_name,
    channel_id,
    channel,
    channel_type,
    campaign_type,
    target_audience,
    start_date,
    end_date,
    budget,
    status

from campaigns