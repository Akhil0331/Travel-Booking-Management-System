PRAGMA foreign_keys = ON;

-- Customers table
CREATE TABLE IF NOT EXISTS customers (
    customer_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name    TEXT NOT NULL,
    last_name     TEXT NOT NULL,
    email         TEXT UNIQUE NOT NULL,
    phone         TEXT,
    created_at    TEXT DEFAULT (datetime('now'))
);

-- Destinations (cities / airports)
CREATE TABLE IF NOT EXISTS destinations (
    destination_id INTEGER PRIMARY KEY AUTOINCREMENT,
    city            TEXT NOT NULL,
    country         TEXT NOT NULL,
    airport_code    TEXT
);

-- Flights table
CREATE TABLE IF NOT EXISTS flights (
    flight_id      INTEGER PRIMARY KEY AUTOINCREMENT,
    flight_number  TEXT NOT NULL,
    origin_id      INTEGER NOT NULL, -- FK to destinations
    destination_id INTEGER NOT NULL, -- FK to destinations
    depart_time    TEXT NOT NULL,    -- ISO datetime string
    arrive_time    TEXT NOT NULL,
    price          REAL NOT NULL,
    seats_total    INTEGER NOT NULL,
    seats_available INTEGER NOT NULL,
    created_at     TEXT DEFAULT (datetime('now')),
    FOREIGN KEY(origin_id) REFERENCES destinations(destination_id) ON DELETE RESTRICT,
    FOREIGN KEY(destination_id) REFERENCES destinations(destination_id) ON DELETE RESTRICT
);

-- Bookings table
CREATE TABLE IF NOT EXISTS bookings (
    booking_id    INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id   INTEGER NOT NULL,
    flight_id     INTEGER NOT NULL,
    booking_time  TEXT DEFAULT (datetime('now')),
    status        TEXT NOT NULL CHECK (status IN ('CONFIRMED','CANCELLED')),
    seat_count    INTEGER NOT NULL DEFAULT 1,
    total_price   REAL NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY(flight_id) REFERENCES flights(flight_id) ON DELETE CASCADE
);

-- Payments (optional simple record)
CREATE TABLE IF NOT EXISTS payments (
    payment_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    booking_id   INTEGER NOT NULL,
    amount       REAL NOT NULL,
    paid_at      TEXT DEFAULT (datetime('now')),
    method       TEXT,
    FOREIGN KEY(booking_id) REFERENCES bookings(booking_id) ON DELETE CASCADE
);
