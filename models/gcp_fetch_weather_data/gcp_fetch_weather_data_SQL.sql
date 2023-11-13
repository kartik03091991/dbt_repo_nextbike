with source_weather_data as (
    select * from {{ source('nextbike-404713', 'Weather_Data') }}
),

final as (
    select * from source_weather_data
)

select * from final