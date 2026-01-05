-- Business Question 3:
-- How does value differ across segments?
-- Dimension: pickup borough
-- Metrics: trips, total revenue, average revenue per trip
-- Grain: one row per borough

SELECT
  z.borough AS pickup_borough,
  COUNT(*) AS trips,
  SUM(t.total_amount) AS total_revenue,
  AVG(t.total_amount) AS avg_revenue_per_trip
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2018` t
LEFT JOIN `bigquery-public-data.new_york_taxi_trips.taxi_zone_geom` z
  ON CAST(t.pickup_location_id AS STRING) = z.zone_id
GROUP BY pickup_borough
ORDER BY avg_revenue_per_trip DESC;