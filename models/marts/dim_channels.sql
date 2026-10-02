select
    channel_id,
    channel_name,
    channel_type,
    cost_per_channel

from {{ ref('stg_channels') }}