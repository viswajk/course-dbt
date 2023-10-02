{{
  config(
    materialized='table'
  )
}}

Select EVENT_ID, 
  SESSION_ID, 
  USER_ID, 
  PAGE_URL, 
  CREATED_AT, 
  EVENT_TYPE, 
  ORDER_ID, 
  PRODUCT_ID 
from {{ source('postgres', 'EVENTS') }}