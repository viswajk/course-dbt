{{
  config(
    materialized='table'
  )
}}

Select product_id, event_id, event_type, user_id, session_id, created_at from {{ ref ('_stg_postgres_events') }} 
group by all having product_id IS NOT NULL