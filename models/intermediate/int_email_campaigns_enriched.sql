with email_campaigns as (

    select *
    from {{ ref('stg_email_campaigns') }}

),

campaigns as (

    select *
    from {{ ref('int_campaigns_enriched') }}

),

email_lists as (

    select *
    from {{ ref('stg_email_lists') }}

),

email_campaigns_enriched as (

    select
        e.email_campaign_id,
        e.campaign_id,
        e.list_id,

        c.campaign_name,
        c.channel_id,
        c.channel_name,
        c.campaign_type,

        l.list_name,
        l.list_type,

        e.send_date,
        e.subject_line,

        e.sent_count,
        e.delivered_count,
        e.open_count,
        e.click_count,
        e.conversion_count,
        e.bounce_count,
        e.unsubscribe_count,

        e.revenue_generated

    from email_campaigns e

    left join campaigns c
        on e.campaign_id = c.campaign_id

    left join email_lists l
        on e.list_id = l.list_id

)

select *
from email_campaigns_enriched