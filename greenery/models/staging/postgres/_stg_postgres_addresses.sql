Select address_id,
  address,
  zipcode,
  state,
  country 
from {{ source('postgres','ADDRESSES') }}