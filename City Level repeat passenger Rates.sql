SELECT 
    c.city_name,

    COUNT(CASE WHEN t.trip_count = '2-Trips' THEN t.repeat_passenger_count ELSE NULL END) / 
    SUM(CASE WHEN t.trip_count = '2-Trips' THEN t.repeat_passenger_count ELSE 0 END) * 100 AS trip_2,

    COUNT(CASE WHEN t.trip_count = '3-Trips' THEN t.repeat_passenger_count ELSE NULL END) / 
    SUM(CASE WHEN t.trip_count = '3-Trips' THEN t.repeat_passenger_count ELSE 0 END) * 100 AS trip_3,

    COUNT(CASE WHEN t.trip_count = '4-Trips' THEN t.repeat_passenger_count ELSE NULL END) / 
    SUM(CASE WHEN t.trip_count = '4-Trips' THEN t.repeat_passenger_count ELSE 0 END) * 100 AS trip_4,

    COUNT(CASE WHEN t.trip_count = '5-Trips' THEN t.repeat_passenger_count ELSE NULL END) / 
    SUM(CASE WHEN t.trip_count = '5-Trips' THEN t.repeat_passenger_count ELSE 0 END) * 100 AS trip_5,

    COUNT(CASE WHEN t.trip_count = '6-Trips' THEN t.repeat_passenger_count ELSE NULL END) / 
    SUM(CASE WHEN t.trip_count = '6-Trips' THEN t.repeat_passenger_count ELSE 0 END) * 100 AS trip_6,

    COUNT(CASE WHEN t.trip_count = '7-Trips' THEN t.repeat_passenger_count ELSE NULL END) / 
    SUM(CASE WHEN t.trip_count = '7-Trips' THEN t.repeat_passenger_count ELSE 0 END) * 100 AS trip_7,

    COUNT(CASE WHEN t.trip_count = '8-Trips' THEN t.repeat_passenger_count ELSE NULL END) / 
    SUM(CASE WHEN t.trip_count = '8-Trips' THEN t.repeat_passenger_count ELSE 0 END) * 100 AS trip_8,

    COUNT(CASE WHEN t.trip_count = '9-Trips' THEN t.repeat_passenger_count ELSE NULL END) / 
    SUM(CASE WHEN t.trip_count = '9-Trips' THEN t.repeat_passenger_count ELSE 0 END) * 100 AS trip_9,

    COUNT(CASE WHEN t.trip_count = '10-Trips' THEN t.repeat_passenger_count ELSE NULL END) / 
    SUM(CASE WHEN t.trip_count = '10-Trips' THEN t.repeat_passenger_count ELSE 0 END) * 100 AS trip_10

FROM 
    dim_repeat_trip_distribution t
JOIN 
    dim_city c
ON 
    t.city_id = c.city_id
GROUP BY 
    c.city_name;