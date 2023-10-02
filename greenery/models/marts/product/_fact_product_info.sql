{{
  config(
    materialized='table'
  )
}}

Select oc.product_id, oc."Product Name", oc."Order Count", ec."Event Count" 
from {{ ref ('_fact_order_count') }} oc left join {{ ref ('_fact_event_count') }} ec 
on oc.product_id = ec.product_id