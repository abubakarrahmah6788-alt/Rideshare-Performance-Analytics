SELECT
  pay.method AS payment_method,
  r.ride_id,
  TO_TIMESTAMP(r.dropoff_time, 'MM/DD/YYYY HH24:MI'),
  TO_TIMESTAMP(r.request_time, 'MM/DD/YYYY HH24:MI'),
  11 / 60 AS duration_minutes
FROM "Rides" r
JOIN "Drivers" rd ON r.driver_id = rd.driver_id
JOIN "Riders" rt ON r.rider_id = rt.rider_id
JOIN "Payments" pay ON r.rider_id = pay.ride_id
WHERE r.dropoff_time IS NOT NULL 
  AND r.request_time IS NOT NULL
  AND CAST(pay.amount AS NUMERIC) > 0
ORDER BY duration_minutes DESC
LIMIT 10;
