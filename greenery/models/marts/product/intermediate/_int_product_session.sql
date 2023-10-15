{{
  config(
    materialized='table'
  )
}}

Select e.session_id, e.user_id, oi.product_id from 
{{ ref('_stg_postgres_events')}} e left join {{ ref('_stg_postgres_order_items')}} oi
on e.order_id = oi.order_id
group by 1,2,3