{{
  config(
    materialized='table'
  )
}}

Select distinct se.product_id, p.name, p.price, count(distinct se.session_id) as Session_Count, 
sum(case when se.checkouts >= 1 then 1 else 0 end) as total_count from 
{{ ref('_fact_product_info_2')}} se left join {{ ref('_stg_postgres_products')}} p 
on se.product_id = p.product_id group by 1,2,3
