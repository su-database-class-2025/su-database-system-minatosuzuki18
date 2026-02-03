SELECT c.name AS category_name,
       AVG(
         DATE_PART('day', r.return_date - r.rental_date)
       ) AS avg_rental_days
FROM category      c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN inventory     i  ON fc.film_id    = i.film_id
JOIN rental        r  ON i.inventory_id = r.inventory_id
WHERE r.return_date IS NOT NULL
GROUP BY c.name
ORDER BY avg_rental_days DESC;
