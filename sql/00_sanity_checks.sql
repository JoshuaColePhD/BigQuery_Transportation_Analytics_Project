-- Purpose: Sanity checks for NYC Yellow Taxi Trips (2018)
-- Verifies grain, time coverage, and basic data integrity
-- Expected grain: one row per taxi trip

-- 1) Confirm time coverage and total volume
SELECT
  COUNT(*) AS total_trips,
  MIN(DATE(pickup_datetime)) AS start_date,
  MAX(DATE(pickup_datetime)) AS end_date
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2018`;

-- 2) Check for missing critical fields
SELECT
  COUNTIF(pickup_datetime IS NULL) AS missing_pickup_time,
  COUNTIF(total_amount IS NULL) AS missing_total_amount,
  COUNTIF(pickup_location_id IS NULL) AS missing_pickup_location_id
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2018`;

-- 3) Quick spot check of raw rows
SELECT
  pickup_datetime,
  pickup_location_id,
  total_amount
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2018`
LIMIT 10;