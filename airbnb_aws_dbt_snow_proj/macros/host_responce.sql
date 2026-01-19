{% macro host_responce (column)%}
    CASE
        WHEN {{column}} > 90 THEN 'very good'
        WHEN {{column}} > 70 THEN 'good'
        WHEN {{column}} > 50 THEN 'average'
        ELSE 'poor'
    END
{% endmacro%}