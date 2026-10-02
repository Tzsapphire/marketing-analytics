select
    list_id,
    list_name,
    list_type,
    description,
    created_date,
    subscriber_count

from {{ ref('stg_email_lists') }}