WITH set_month AS (
    SELECT 
        f.date,
        c.city_name,
        (f.fare_amount * f.distance_travelled_km) AS revenue 
    FROM 
        trips_db.fact_trips f
    JOIN 
        dim_city c ON f.city_id = c.city_id
    GROUP BY 
        f.date, c.city_name, f.fare_amount, f.distance_travelled_km
),
Percentage_contribution AS (
    SELECT 
        s.city_name,
        m.month_name,
        SUM(s.revenue) AS total_revenue
    FROM 
        set_month s
    JOIN 
        dim_date m ON s.date = m.date
    GROUP BY 
        s.city_name, m.month_name
)
SELECT 
    city_name, 
    month_name, 
    total_revenue,
    round((total_revenue / (SELECT SUM(total_revenue) FROM Percentage_contribution WHERE month_name = pc.month_name)) * 100,2) AS percentage_contribution 
FROM 
    Percentage_contribution pc
    order by percentage_contribution desc