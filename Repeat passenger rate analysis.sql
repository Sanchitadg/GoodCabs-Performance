SELECT c.city_name,monthname(p.month)as month,p.total_passengers,
p.repeat_passengers,Round((p.repeat_passengers*100/p.total_passengers),2) as monthly_repeat_passenger_rate,
ROUND(SUM(p.repeat_passengers) OVER (PARTITION BY c.city_name) * 100.0 
          / SUM(p.total_passengers) OVER (PARTITION BY c.city_name), 2) AS city_repeat_percentage_rate
FROM trips_db.fact_passenger_summary p
join  dim_city c
on p.city_id=c.city_id

