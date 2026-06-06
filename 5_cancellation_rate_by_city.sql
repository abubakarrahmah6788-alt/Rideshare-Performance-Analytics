WITH ride_stats AS (
  SELECT
    pickup_city,
    COUNT(*) AS total_rides,
    COUNT(*) FILTER (WHERE status = 'cancelled') AS cancelled_rides
  FROM "Rides"
  GROUP BY pickup_city
),
cancellation_rates AS (
  SELECT *,
    ROUND((cancelled_rides::NUMERIC / NULLIF(total_rides, 0)) * 100, 2)
      AS cancellation_rate
  FROM ride_stats
)
SELECT *
FROM cancellation_rates
ORDER BY cancellation_rate DESC
LIMIT 2;
