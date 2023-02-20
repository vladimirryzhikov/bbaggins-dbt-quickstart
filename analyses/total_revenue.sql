with
    payments as (select * from {{ ref("stg_payments") }}),

    aggregated as (
        select sum(amount) as success_payment_total
        from payments
        where status = 'success'
    )

select *
from aggregated
