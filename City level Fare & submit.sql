SELECT 
    c.city_name, 
    COUNT(*) AS total_trips, ROUND(AVG(f.fare_amount / f.distance_travelled_km), 2) AS Average_fare_per_km,Round(Avg(f.fare_amount),2)as average_fare_per_trip,
    round((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM fact_trips)),2) AS percentage_contribution
FROM fact_trips f
join dim_city c
on f.city_id=c.city_id
GROUP BY  c.city_name;