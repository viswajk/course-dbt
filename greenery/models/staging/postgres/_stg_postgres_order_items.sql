{{
  config(
    materialized='table'
  )
}}

Select order_id ,
  product_id,
  quantity 
from {{ source('postgres','ORDER_ITEMS') }}