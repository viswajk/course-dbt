{{
  config(
    materialized='table'
  )
}}

Select o.order_id, o.user_id, oi.product_id, o.created_at from 
{{ ref ('_stg_postgres_orders') }} o left join {{ ref ('_stg_postgres_order_items') }} oi
on o.order_id=oi.order_id