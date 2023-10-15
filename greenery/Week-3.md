
What is our overall conversion rate?

    Solution: Built the models for _fact_purchase_sessions but was unable to structure it appropriately so used the SQL directly. The conversion rate come out to 62.45%.
    
    SQL: Select 
    (Select count(distinct session_id) from {{ ref('stg_postgres__events')}} where event_type='checkout') /
    (Select count(distinct session_id) from {{ ref('stg_postgres__events')}}) 
    as Conversion_Rate from dual

What is our conversion rate by product?

    Solution: Wasn't able to find this using the SQL I had. Need to work more on this one.

    SQL: with dist_session as
    (Select p.name, count(distinct e.session_id) as dist_count from dev_db.dbt_viswasigmacomputingcom._stg_postgres_products p left join dev_db.dbt_viswasigmacomputingcom._stg_postgres_events e on p.product_id=e.product_id where e.event_type='checkout' group by 1),
    
    sessions as
    (Select p.name, count(distinct e.session_id) as all_count from dev_db.dbt_viswasigmacomputingcom._stg_postgres_products p left join dev_db.dbt_viswasigmacomputingcom._stg_postgres_events e on p.product_id=e.product_id where e.event_type='page_view' group by 1)
    
    Select p.product_id , dse.dist_count / se.all_count from dev_db.dbt_viswasigmacomputingcom._stg_postgres_products p left join dist_session dse on p.product_id=dse.product_id left join sessions se on p.product_id=se.product_id group by 1

Show (using dbt docs and the model DAGs) how you have simplified or improved a DAG using macros and/or dbt packages.

![Alt text](<Screenshot 2023-10-15 at 10.31.22 AM-1.png>)

Which products had their inventory change from week 2 to week 3? 

    Pothos, Bamboo, Philodendron, Monstera, String of pearls, ZZ Plant