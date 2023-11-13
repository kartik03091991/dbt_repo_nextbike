with source_Live as (
    select * from {{ source('nextbike-404713', 'Live3') }}
),

final as (
    select * from source_Live
)

select * from final