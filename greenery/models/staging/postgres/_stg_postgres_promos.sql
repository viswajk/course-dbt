Select 
    PROMO_ID, 
    DISCOUNT, 
    STATUS 
from {{ source('postgres','PROMOS') }}