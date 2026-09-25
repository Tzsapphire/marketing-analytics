select
  performance_id, --primary key
  date as performance_date,
  campaign_id, -- foreign key
  coalesce(cast(spend as decimal(18,2)), 0) as spend,
  coalesce(cast(revenue as decimal(18,2)), 0) as revenue,
  coalesce(impressions, 0) as impressions,
  coalesce(clicks, 0) as clicks,
  coalesce(conversions, 0) as conversions,
  coalesce(leads_generated, 0) as leads_generated,
  coalesce(cast(cost_per_click as decimal(18, 2)), 0) as cost_per_click,
  coalesce(cast(cost_per_conversion as decimal(18, 2)), 0) as cost_per_conversion
FROM {{ source('raw', 'campaign_performance') }}
WHERE PERFORMANCE_ID IS NOT NULL