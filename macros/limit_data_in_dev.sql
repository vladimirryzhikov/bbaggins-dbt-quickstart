{%- macro limit_data_in_dev(column_name,dev_days_of_data=3)-%}
{% if target.name == 'default' %}
where {{ column_name }} >= date_sub(date(current_datetime()),interval {{dev_days_of_data}} day )
{% endif %}
{%- endmacro -%}