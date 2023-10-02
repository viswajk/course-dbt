{{
  config(
    materialized='table'
  )
}}

Select 
o.order_id, 
o.user_id, 
o.created_at, 
o.order_cost, 
o.shipping_cost, 
o.order_total, 
o.tracking_id, 
o.shipping_service, 
o.estimated_delivery_at, 
o.delivered_at, 
o.status "Order Status", 
pr.discount,
pr.status "Promo Status", 
a.address, 
a.zipcode, 
a.state, 
a.country
from {{ ref ('_stg_postgres_orders') }} o left join {{ ref ('_stg_postgres_promos') }} pr on o.promo_id = pr.promo_id
left join {{ ref ('_stg_postgres_addresses') }} a on o.address_id = a.address_id