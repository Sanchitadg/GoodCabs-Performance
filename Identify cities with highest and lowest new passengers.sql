with rank_order as(SELECT c.city_name, sum(p.new_passengers) as total_new_passengers ,
rank () over (order by sum(p.new_passengers)Desc) as rank_desc,
rank () over (order by sum(p.new_passengers)asc) as rank_asc
FROM trips_db.fact_passenger_summary p
join dim_city c
on p.city_id=c.city_id
group by c.city_name )
Select city_name,total_new_passengers , Case 
when rank_desc<= 3 then "Top 3" 
when rank_asc<= 3 then " Bottom 3"

end as city_category

from rank_order
WHERE rank_desc <= 3 OR rank_asc <= 3
ORDER BY 
    CASE 
        WHEN rank_desc <= 3 THEN rank_desc
        ELSE rank_asc + 3 -- Offset to keep Bottom 3 cities after Top 3
    END;