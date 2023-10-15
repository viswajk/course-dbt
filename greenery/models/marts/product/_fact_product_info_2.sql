{{
  config(
    materialized='table'
  )
}}

{% set event_types= dbt_utils.get_column_values(table=ref('_stg_postgres_events'), column='event_type') %}

with session_timing as
( 
Select session_id, min(created_at) as session_started_at, max(created_at) as session_ended_at
from {{ref ('_stg_postgres_events')}} group by 1
)
Select 
e.session_id, 
e.user_id, 
coalesce(e.product_id,oi.product_id) as product_id, 
session_started_at,
session_ended_at,

{% for event_type in event_types %}
{{ sum_of('e.event_type', event_type) }} as {{ event_type }}s,
{% endfor %}

DATEDIFF('minute',session_started_at,session_ended_at) as session_duration
from {{ref ('_stg_postgres_events')}} e left join {{ref ('_stg_postgres_order_items')}} oi
on e.order_id=oi.order_id
left join session_timing st on e.session_id=st.session_id
group by 1,2,3,4,5