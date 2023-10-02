What is our user repeat rate?

    Solution: Our repeat user rate is almost 80% (0.798387)

    SQL: Select (Select count(user_id) "repeat_user_count" from (Select user_id from DEV_DB.DBT_VISWASIGMACOMPUTINGCOM._STG_POSTGRES_ORDERS group by user_id having count(order_id) > 1))/ (Select count(user_id) "all_user_count" from (Select user_id from DEV_DB.DBT_VISWASIGMACOMPUTINGCOM._STG_POSTGRES_ORDERS group by user_id having count(order_id) > 0)) as "repeat_user_rate" from dual

What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?

    Solution: 
        
        Users who have more number of add_to_cart event_types in the Events table and users who have active promos for their account are more susceptible to purchase again.
    
        I believe identifying the users who are repeat customers and observing their user events in comparison to single users might help find some more indicators.
        
        Users who do not have any recent orders (through created_at in orders) are likely to not purchase again.

        I'd like more data about the last_logged_in_time or how far a user progresses in their more recent session in trying to purchase a product before logging out to help discern this.


Explain the product mart models you added. Why did you organize the models in the way you did?

    Solution:

        I've created product mart to hold the staging, intermediate tables and the final tables. The _int_product_info is a base table created with a light transformation in order to retrieve the product_id info with the order table whereas the rest are simple staging tables created to retrieve data for each individual data source. 

        I've also created the _fact_event_count and _fact_order_count separately to signify the intermediate layer with the product table each getting joined with the events and orders table respectively.

        I then created the final _fact_product_info table that combines all these different sources.

![Alt text](<Screenshot 2023-10-02 at 2.23.35 AM.png>)

What assumptions are you making about each model? (i.e. why are you adding each test?)

    Solution: 
    
        I assumed that all primary keys are appropriately defined and referential integrity is enforced and columns like quantity in products or discount in promos would be positive. To enforce these, I added the not null and unique tests for all primary keys and the relationship tests to ensure referential integrity and positive values tests are enforced for discount and quantity and accepted values are defined for order status and promo status.

Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?

    Solution: All tests seemed to pass without any issues.

Your stakeholders at Greenery want to understand the state of the data each day. Explain how you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through.

    Solution: We can set up a schedule to execute the dbt tests every day and have a Slack integration to notify the team if the data fails any test so we can quickly look at the root cause and fix it asap.

Run the product snapshot model using dbt snapshot and query it in snowflake to see how the data has changed since last week. Which products had their inventory change from week 1 to week 2?

    Solution: Executing this as of Week 3 so these are the columns that I see where the values have changed over the weeks:

            - Bamboo
            - Monstera	
            - Philodendron
            - Pothos
            - String of pearls
            - ZZ Plant
            