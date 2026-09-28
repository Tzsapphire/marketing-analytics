-- /*
{{ config(
		materialized = 'table',
		tags=['static', 'never_refresh']
) }} 


-- using dbt-utils package
-- /* for postgres

with date_spine as (

    {{ dbt_utils.date_spine(
        "day",
        start_date="cast('2024-01-01' as date)",
        end_date="cast('2027-01-01' as date)"
    ) }}

)

select
    date_day,
    -- date_day::date as date_day,

    -- extract(day from date_day) as day_of_month,

    extract(year from date_day) as year,
    extract (quarter from date_day) as quarter,
    extract (month from date_day) as month_number,
    -- extract (monthname from date_day) as month_name,
    trim(to_char(date_day, 'Month')) as month_name,
    extract (day from date_day) as day_of_month,
    -- extract (dayofweek from date_day) as day_of_week_number,
    -- extract (dayname from date_day) as day_name,
    extract(isodow from date_day) as day_of_week,
    trim(to_char(date_day, 'Day')) as day_name,

    date_trunc('month', date_day) as month_start_date,
    date_trunc('quarter', date_day) as quarter_start_date,
    date_trunc('year', date_day) as year_start_date,

    to_char(date_day, 'YYYY-MM') as year_month

from date_spine

-- */




/*  for duckdb, databricks, snowflake: this should work, not tested yet

with date_spine as (

    {{ dbt_utils.date_spine(
        "day",
        "cast('2024-01-01' as date)",
        "cast('2027-01-01' as date)"
    ) }}

)

select
    date_day,

    year(date_day) as year,
    quarter(date_day) as quarter,
    month(date_day) as month_number,
    monthname(date_day) as month_name,
    day(date_day) as day_of_month,
    dayofweek(date_day) as day_of_week_number,
    dayname(date_day) as day_name,

    date_trunc('month', date_day) as month_start_date,
    date_trunc('quarter', date_day) as quarter_start_date,
    date_trunc('year', date_day) as year_start_date,

    to_char(date_day, 'YYYY-MM') as year_month

from date_spine

*/


-- 
-- 
-- /*

/*
with date_spine as (

    {{
        dbt_utils.date_spine(
            "day",

            "cast('2024-01-01' as date)",
            "cast('2030-12-31' as date)"
        )
    }}

)

select
    date_day::date as date_day,

    extract(day from date_day) as day_of_month,
    extract(isodow from date_day) as day_of_week,
    trim(to_char(date_day, 'Day')) as day_name,

    extract(week from date_day) as week_of_year,

    extract(month from date_day) as month_number,
    trim(to_char(date_day, 'Month')) as month_name,

    extract(quarter from date_day) as quarter,
    extract(year from date_day) as year,

    case
        when extract(isodow from date_day) in (6, 7) then true
        else false
    end as is_weekend

from date_spine 

*/

-- 
-- 
-- 

-- no dbt-utils package needed here
/*
with date_spine as (

select 
        value::date as date_day
        from generate_series(
        '2025-01-01'::date,
        '2030-12-31'::date,
        interval '1 day'
    ) as value

)

select
    date_day,
    extract(day from date_day) as day_of_month,
    extract(isodow from date_day) as day_of_week,
    trim(to_char(date_day, 'Day')) as day_name,
    extract(week from date_day) as week_of_year,
    extract(month from date_day) as month_number,
    trim(to_char(date_day, 'Month')) as month_name,
    extract(quarter from date_day) as quarter,
    extract(year from date_day) as year,
    case
        when extract(isodow from date_day) in (6, 7) then true
        else false
    end as is_weekend

from date_spine 
*/
