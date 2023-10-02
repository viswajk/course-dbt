{{
  config(
    materialized='view'
  )
}}

Select user_id, 
first_name, 
u.last_name, 
u.email, 
u.phone_number, 
u.created_at, 
u.updated_at,
a.address, 
a.zipcode, 
a.state, 
a.country 
from {{ ref('_stg_postgres_users') }} u left join {{ ref('_stg_postgres_addresses') }} a
ON u.address_id = a.address_id