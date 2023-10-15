{{
  config(
    materialized='table'
  )
}}

Select product_id, name from {{ ref ('_stg_postgres_products') }}