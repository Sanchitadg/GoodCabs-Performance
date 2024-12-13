WITH cte1 AS (
    SELECT 
        c.city_name,
        c.city_id,
        d.month_name,
        COUNT(*) AS actual_total_trips
    FROM 
        trips_db.fact_trips f
    JOIN 
        dim_city c ON f.city_id = c.city_id
    JOIN 
        dim_date d ON f.date = d.date
    GROUP BY  
        c.city_name, c.city_id, d.month_name
), 
cte2 AS (
    SELECT 
        e.city_name,
        e.month_name,
        e.actual_total_trips,
        m.total_target_trips
    FROM 
        cte1 e
    JOIN 
        targets_db.monthly_target_trips m ON e.city_id = m.city_id 
)
SELECT 
    h.city_name,
    h.month_name,
    h.actual_total_trips,
    h.total_target_trips,
    CASE 
        WHEN h.actual_total_trips > h.total_target_trips THEN 'Above Target'
        WHEN h.actual_total_trips < h.total_target_trips THEN 'Below Target'
        ELSE 'On Target'
    END AS performance_status,
    Round(((h.actual_total_trips - h.total_target_trips) / NULLIF(h.total_target_trips, 0)) * 100,2) AS percentage_difference
FROM 
    cte2 h;
 
