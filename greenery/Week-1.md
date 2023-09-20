-> How many users do we have?

    Solution: We have 130 distinct users

    SQL: Select distinct count(*) from DEV_DB.DBT_VISWASIGMACOMPUTINGCOM._STG_POSTGRES_USERS

-> On average, how many orders do we receive per hour?

    Solution: We receive an average of almost 8 orders (7.520833) every hour.

    SQL: Select avg(order_count) from (Select count(*) order_count from DEV_DB.DBT_VISWASIGMACOMPUTINGCOM._STG_POSTGRES_ORDERS group by date_trunc('hour', CREATED_AT))

-> On average, how long does an order take from being placed to being delivered?

    Solution: It takes an average of almost 4 days (3.891803) for an order to get delivered.
    
    SQL: Select avg(delivery_time) from (Select datediff('day',created_at,delivered_at) delivery_time from DEV_DB.DBT_VISWASIGMACOMPUTINGCOM._STG_POSTGRES_ORDERS)

-> How many users have only made one purchase? Two purchases? Three+ purchases?

    Solution: The number of users who have made one purchase is 25, two purchases is 28 and three purchases is 34.

    SQL: Select count(*) from (Select count(order_id) total_order_per_user from DEV_DB.DBT_VISWASIGMACOMPUTINGCOM._STG_POSTGRES_ORDERS group by user_id) where total_order_per_user in (1,2,3) group by total_order_per_user order by total_order_per_user asc

-> On average, how many unique sessions do we have per hour?

    Solution: We have an average of 16 sessions (16.327586) per hour.

    SQL: Select avg(unique_sessions_per_hour) from (Select count(distinct session_id) unique_sessions_per_hour from DEV_DB.DBT_VISWASIGMACOMPUTINGCOM._STG_POSTGRES_EVENTS group by date_trunc('hour', created_at))