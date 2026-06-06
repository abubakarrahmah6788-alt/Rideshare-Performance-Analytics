SELECT
  driver_id,
  completed_rides,
  avg_rating,
  cancellation_rate
FROM (
  SELECT
    driver_id,
    COUNT(*) FILTER (WHERE status = 'completed') AS completed_rides,
    COUNT(*) AS total_rides,
    ROUND(AVG(avg_rating), 2) AS avg_rating,
    ROUND((cancelled_rides::NUMERIC / NULLIF(total_rides, 0)) * 100, 2)
      AS cancellation_rate
  FROM "Drivers"
  WHERE completed_rides >= 30
    AND avg_rating >= 4.5
    AND cancellation_rate < 5
) drivers
ORDER BY avg_rating DESC;
