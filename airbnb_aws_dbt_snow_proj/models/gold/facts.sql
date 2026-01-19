{% set configs = [
    {
        "table" : "AIRBNB.GOLD.OBT",
        "columns" : "gold_obt.BOOKING_ID, gold_obt.LISTING_ID, gold_obt.HOST_ID, gold_obt.TOTAL_AMOUNT,gold_obt.CLEANING_FEE, gold_obt.SERVICE_FEE, gold_obt.PRICE_PER_NIGHT, gold_obt.RESPONSE_RATE  ",
        "alias" : "gold_obt"
    },
    {
        "table" : "AIRBNB.GOLD.DIM_LISTINGS",
        "columns" : "",
        "alias" : "dim_listings",
        "join_condition" : "gold_obt.LISTING_ID = dim_listings.LISTING_ID"
    },
    {
        "table" : "AIRBNB.GOLD.DIM_HOSTS",
        "columns" : "",
        "alias" : "dim_hosts",
        "join_condition" : "gold_obt.HOST_ID = dim_hosts.HOST_ID"
    }
]%}

SELECT
        {{configs[0]['columns']}}
FROM 
    {% for config in configs%}
        {% if loop.first%} 
            {{config['table']}} AS {{config['alias']}}
        {% else %}
            LEFT JOIN {{config['table']}} AS {{config['alias']}}
            ON {{config['join_condition']}} 
        {% endif %}
    {% endfor %}