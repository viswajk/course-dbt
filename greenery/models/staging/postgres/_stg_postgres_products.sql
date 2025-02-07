{{
  config(
    materialized='table'
  )
}}

Select 
    PRODUCT_ID, 
    NAME, 
    PRICE, 
    INVENTORY 
from {{ source('postgres','PRODUCTS') }}