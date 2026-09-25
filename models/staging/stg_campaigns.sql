
select 
	campaign_id, --primary
	trim(campaign_name) as campaign_name,
	trim(channel) as channel,
	start_date,
	end_date,
	trim(campaign_type) as campaign_type,
	trim(target_audience) as target_audience,
	--coalesce(budget, 0) as budget,
	coalesce(cast(budget as decimal(18, 2)), 0) as budget,
	trim(status) as status
FROM {{ source('raw', 'campaigns') }}
WHERE CAMPAIGN_ID IS NOT NULL

