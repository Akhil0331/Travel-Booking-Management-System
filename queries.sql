SELECT f.flight_id, f.flight_number, o.city AS origin, d.city AS destination,
       f.depart_time, f.arrive_time, f.price, f.seats_available
FROM flights f
JOIN destinations o ON f.origin_id = o.destination_id
JOIN destinations d ON f.destination_id = d.destination_id
WHERE o.city LIKE '%' || :origin_city || '%'
  AND d.city LIKE '%' || :destination_city || '%'
  AND f.depart_time LIKE :date_prefix || '%'
  AND f.seats_available > 0
ORDER BY f.depart_time;
UPDATE bookings SET status = 'CANCELLED' WHERE booking_id = :booking_id;
UPDATE flights SET seats_available = seats_available + :seat_count
WHERE flight_id = (SELECT flight_id FROM bookings WHERE booking_id = :booking_id);

-- 4) Reports
-- a) Upcoming flights with low availability
SELECT flight_id, flight_number, depart_time, seats_available
FROM flights
WHERE depart_time > datetime('now')
ORDER BY seats_available ASC
LIMIT 10;

-- b) Bookings per customer
SELECT c.customer_id, c.first_name || ' ' || c.last_name AS name,
       COUNT(b.booking_id) AS bookings, SUM(b.total_price) AS spent
FROM customers c
LEFT JOIN bookings b ON c.customer_id = b.customer_id
GROUP BY c.customer_id;
