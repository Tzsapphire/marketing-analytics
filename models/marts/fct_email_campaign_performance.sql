with email_campaigns as (

    select *
    from {{ ref('int_email_campaigns_enriched') }}

),

final as (

    select
        email_campaign_id,
        campaign_id,
        list_id,

        send_date,
        subject_line,

        sent_count,
        delivered_count,
        open_count,
        click_count,
        conversion_count,
        bounce_count,
        unsubscribe_count,
        revenue_generated,

        case
            when sent_count > 0
                then delivered_count * 1.0 / sent_count
            else 0
        end as delivery_rate,

        case
            when delivered_count > 0
                then open_count * 1.0 / delivered_count
            else 0
        end as open_rate,

        case
            when delivered_count > 0
                then click_count * 1.0 / delivered_count
            else 0
        end as click_through_rate,

        case
            when open_count > 0
                then click_count * 1.0 / open_count
            else 0
        end as click_to_open_rate,

        case
            when delivered_count > 0
                then conversion_count * 1.0 / delivered_count
            else 0
        end as conversion_rate,

        case
            when sent_count > 0
                then bounce_count * 1.0 / sent_count
            else 0
        end as bounce_rate,

        case
            when delivered_count > 0
                then unsubscribe_count * 1.0 / delivered_count
            else 0
        end as unsubscribe_rate,

        case
            when delivered_count > 0
                then revenue_generated * 1.0 / delivered_count
            else 0
        end as revenue_per_delivered_email

    from email_campaigns

)

select *
from final