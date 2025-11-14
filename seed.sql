PRAGMA foreign_keys = ON;

-- Destinations
INSERT INTO destinations (city, country, airport_code) VALUES
  ('New Delhi','India','DEL'),
  ('Mumbai','India','BOM'),
  ('Bengaluru','India','BLR'),
  ('Hyderabad','India','HYD'),
  ('Chennai','India','MAA');

-- Customers
INSERT INTO customers (first_name, last_name, email, phone) VALUES
  ('Akhil','Kumar','akhil@example.com','+91-9000000001'),
  ('Priya','Sharma','priya@example.com','+91-9000000002');

-- Flights
-- flight_number, origin_id, destination_id, depart_time, arrive_time, price, seats_total, seats_available
INSERT INTO flights (flight_number, origin_id, destination_id, depart_time, arrive_time, price, seats_total, seats_available) VALUES
  ('AI101', 1, 2, '2025-12-01 06:30:00', '2025-12-01 07:50:00', 4500.0, 120, 120),
  ('AI202', 2, 3, '2025-12-02 09:00:00', '2025-12-02 10:15:00', 3200.0, 100, 100),
  ('SG303', 3, 1, '2025-12-03 14:00:00', '2025-12-03 15:30:00', 4100.0, 90, 90),
  ('IN404', 4, 5, '2025-12-05 20:00:00', '2025-12-05 21:20:00', 2800.0, 150, 150);

-- Example bookings (none confirmed yet) - you can create via app.py
