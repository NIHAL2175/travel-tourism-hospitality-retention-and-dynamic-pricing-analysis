-- CREATE DATABASE
CREATE DATABASE IF NOT EXISTS tourism_analytics; 
USE tourism_analytics; 
 
-- SHOW TABLES 
SHOW TABLES;

-- TOTAL ROWS
SELECT COUNT(*) AS total_rows     
FROM hotel_data; 

-- VIEW SAMPLE DATA
SELECT *
FROM hotel_data
LIMIT 10;

-- DESCRIBE TABLE
DESCRIBE hotel_data;

-- TOTAL BOOKINGS
SELECT COUNT(*) AS total_bookings
FROM hotel_data;

-- TOTAL CANCELLATIONS
SELECT COUNT(*) AS total_cancellations
FROM hotel_data
WHERE is_canceled = 1;

-- CANCELLATION RATE
SELECT 
ROUND(
    (SUM(is_canceled) / COUNT(*)) * 100,
    2
) AS cancellation_rate
FROM hotel_data;

-- AVERAGE LEAD TIME
SELECT 
ROUND(AVG(lead_time), 2) AS avg_lead_time
FROM hotel_data;

-- BOOKINGS BY MONTH
SELECT arrival_date_month,
COUNT(*) AS total_bookings
FROM hotel_data
GROUP BY arrival_date_month
ORDER BY total_bookings DESC;

-- BOOKINGS BY YEAR
SELECT arrival_date_year,
COUNT(*) AS total_bookings
FROM hotel_data
GROUP BY arrival_date_year
ORDER BY arrival_date_year;

-- TOP COUNTRIES BY BOOKINGS
SELECT country,
COUNT(*) AS total_bookings
FROM hotel_data
GROUP BY country
ORDER BY total_bookings DESC
LIMIT 10;

-- MARKET SEGMENT ANALYSIS
SELECT market_segment,
COUNT(*) AS total_bookings
FROM hotel_data
GROUP BY market_segment
ORDER BY total_bookings DESC;

-- CUSTOMER TYPE ANALYSIS
SELECT customer_type,
COUNT(*) AS total_customers
FROM hotel_data
GROUP BY customer_type
ORDER BY total_customers DESC;

-- AVERAGE ADR (AVERAGE DAILY RATE)
SELECT 
ROUND(AVG(adr), 2) AS avg_adr
FROM hotel_data;

-- BOOKINGS BY ROOM TYPE
SELECT reserved_room_type,
COUNT(*) AS total_bookings
FROM hotel_data
GROUP BY reserved_room_type
ORDER BY total_bookings DESC;

-- SPECIAL REQUEST ANALYSIS
SELECT total_of_special_requests,
COUNT(*) AS total_bookings
FROM hotel_data
GROUP BY total_of_special_requests
ORDER BY total_of_special_requests;

-- AVERAGE STAY DURATION
SELECT 
ROUND(
AVG(stays_in_weekend_nights + stays_in_week_nights),
2
) AS avg_stay_duration
FROM hotel_data;

-- DEPOSIT TYPE ANALYSIS
SELECT deposit_type,
COUNT(*) AS total_bookings
FROM hotel_data
GROUP BY deposit_type
ORDER BY total_bookings DESC;

-- REPEATED GUEST ANALYSIS
SELECT is_repeated_guest,
COUNT(*) AS total_guests
FROM hotel_data
GROUP BY is_repeated_guest;

-- TOP 10 AGENTS BY BOOKINGS
SELECT agent,
COUNT(*) AS total_bookings
FROM hotel_data
GROUP BY agent
ORDER BY total_bookings DESC
LIMIT 10;

-- BOOKING CHANGES ANALYSIS
SELECT booking_changes,
COUNT(*) AS total_bookings
FROM hotel_data
GROUP BY booking_changes
ORDER BY booking_changes DESC;

-- REQUIRED CAR PARKING SPACES
SELECT required_car_parking_spaces,
COUNT(*) AS total_bookings
FROM hotel_data
GROUP BY required_car_parking_spaces;

-- FAMILY VS NON-FAMILY BOOKINGS
SELECT 
CASE
    WHEN children > 0 OR babies > 0
    THEN 'Family'
    ELSE 'Non-Family'
END AS booking_type,
COUNT(*) AS total_bookings
FROM hotel_data
GROUP BY booking_type;

-- ADR BY MARKET SEGMENT
SELECT market_segment,
ROUND(AVG(adr), 2) AS avg_adr
FROM hotel_data
GROUP BY market_segment
ORDER BY avg_adr DESC;

-- CANCELLATION BY MARKET SEGMENT
SELECT market_segment,
ROUND(
    (SUM(is_canceled) / COUNT(*)) * 100,
    2
) AS cancellation_rate
FROM hotel_data
GROUP BY market_segment
ORDER BY cancellation_rate DESC;
