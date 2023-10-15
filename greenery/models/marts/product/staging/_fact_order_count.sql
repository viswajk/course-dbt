{{
  config(
    materialized='table'
  )
}}

Select p.product_id, p.name as "Product Name", count(o.order_id) as "Order Count" 
from {{ ref ('_int_product_info') }} p left join {{ ref ('_int_product_orders') }} o on 
p.product_id = o.product_id group by 1,2