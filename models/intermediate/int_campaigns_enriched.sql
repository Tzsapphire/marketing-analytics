with campaigns as (

    select *
    from {{ ref('stg_campaigns') }}

),

channels as (

    select *
    from {{ ref('stg_channels') }}

),

campaigns_enriched as (

    select
        c.campaign_id,
        c.campaign_name,

        ch.channel_id,
        c.channel_name,
        ch.channel_type,

        c.campaign_type,
        c.target_audience,

        c.start_date,
        c.end_date,

        c.budget,
        c.status

    from campaigns c

    left join channels ch
        on c.channel_name = ch.channel_name

)

select *
from campaigns_enriched