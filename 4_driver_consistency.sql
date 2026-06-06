WITH ride_counts AS (
  SELECT
    d.driver_id,
    COUNT(*) AS total_rides,
    MIN(TO_TIMESTAMP(r.request_time, 'MM/DD/YYYY HH24:MI')) AS first_ride,
    MAX(TO_TIMESTAMP(r.request_time, 'MM/DD/YYYY HH24:MI')) AS last_ride
  FROM "Drivers" d
  JOIN "Rides" r ON d.driver_id = r.driver_id
  WHERE r.status = 'completed'
    AND TO_TIMESTAMP(r.request_time, 'MM/DD/YYYY HH24:MI')
      BETWEEN TO_TIMESTAMP('06/01/2021 00:00', 'MM/DD/YYYY HH24:MI')
      AND TO_TIMESTAMP('12/31/2024 23:59', 'MM/DD/YYYY HH24:MI')
  GROUP BY d.driver_id
),
driver_consistency AS (
  SELECT *,
    total_rides / NULLIF(
      EXTRACT(MONTH FROM age(last_ride, first_ride)), 0
    ) AS avg_monthly_rides
  FROM ride_counts
  WHERE total_rides > 10
)
SELECT driver_id, total_rides, avg_monthly_rides
FROM driver_consistency
ORDER BY avg_monthly_rides DESC;
