{{
  config(
    materialized='view'
  )
}}

Select 
product_id, 
name, 
price, 
inventory
FROM {{ ref('_stg_postgres_products') }}