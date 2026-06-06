WITH ranked AS (
  SELECT
    pickup_city AS city,
    driver_id,
    SUM(fare::double precision) AS total_revenue,
    ROW_NUMBER() OVER (
      PARTITION BY pickup_city
      ORDER BY SUM(fare::double precision) DESC
    ) AS rn
  FROM "Rides"
  WHERE request_time::timestamp >= '2021-06-01'::timestamp
    AND request_time::timestamp < '2024-01-01'::timestamp
  GROUP BY pickup_city, driver_id
)
SELECT city, driver_id, total_revenue
FROM ranked
WHERE rn <= 3
ORDER BY city, total_revenue DESC;
