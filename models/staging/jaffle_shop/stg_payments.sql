select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    -- added macro - to_dollars(column_name)
    {{ to_dollars('amount') }} as amount,
    -- or use new macro with round function called to_dollars_round(column_name,decimal_places)
    {{ to_dollars_round('amount',4) }} as amount_round,
    created as created_at
from {{ source("stripe", "payment") }}
