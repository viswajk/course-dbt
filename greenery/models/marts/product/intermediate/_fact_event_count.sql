{{
  config(
    materialized='table'
  )
}}

Select p.product_id, p.name as "Product Name", count(e.event_id) as "Event Count" 
from {{ ref ('_int_product_info') }} p left join {{ ref ('_int_product_events') }} e on 
p.product_id = e.product_id group by 1,2