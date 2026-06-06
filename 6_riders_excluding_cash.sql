WITH rider_ride_counts AS (
  SELECT r.rider_id, COUNT(*) AS total_rides
  FROM "Rides" r
  GROUP BY r.rider_id
  HAVING COUNT(*) > 10
)
SELECT rrc.rider_id
FROM rider_ride_counts rrc
WHERE NOT EXISTS (
  SELECT 1
  FROM "Payments" p
  JOIN "Rides" r ON p.ride_id = r.ride_id
  WHERE r.rider_id = rrc.rider_id
    AND LOWER(p.method) = 'cash'
);
