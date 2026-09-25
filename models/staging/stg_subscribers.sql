select
  subscriber_id,
  list_id,
  lower(trim(email)) as email,
  trim(first_name) as first_name,
  trim(last_name) as last_name,
  case
	  when upper(trim(gender))= 'M' then 'Male'
	  when upper(trim(gender)) = 'F' then 'Female' 
	  else 'Other' 
  end as gender,
  trim(status) as status,
  trim(country) as country,
  trim(age_group) as age_group,
  trim(preferences) as preferences,
  subscription_date,
  trim(subscription_source) as subscription_source
FROM {{ source('raw', 'subscribers') }}
WHERE SUBSCRIBER_ID IS NOT NULL