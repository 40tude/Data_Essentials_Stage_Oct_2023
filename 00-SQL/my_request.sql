-- Checking
SELECT
  1;

-- CREATE TABLE
CREATE TABLE
  drivers (
    id INTEGER,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    age INTEGER,
    address VARCHAR(100),
    driving_licence_date DATETIME,
    accidents INTEGER,
    average_rating REAL
  );

CREATE TABLE
  users (
    id INTEGER,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    age INTEGER,
    average_rating REAL
  );

CREATE TABLE
  employee (
    id INTEGER,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    experience INTEGER,
    miles_with_chauffeurs REAL
  );

CREATE TABLE
  city (
    id INTEGER,
    name VARCHAR(100),
    size REAL,
    inhabitants INTEGER
  );

-- INSERT INTO
INSERT INTO
  drivers
VALUES
  (
    1,
    "Michael",
    "Jefferson",
    26,
    "740 Leavenworth Street",
    "2006-01-10",
    0,
    4.9
  ),
  (
    2,
    "John",
    "Smith",
    46,
    "740 1st Street",
    "2006-01-10",
    1,
    4.7
  ),
  (
    3,
    "Brad",
    "Torp",
    37,
    "70 2nd Street",
    "2006-01-10",
    0,
    4.8
  ),
  (
    4,
    "Sam",
    "Friday",
    28,
    "641 4th Street",
    "2006-01-10",
    1,
    4.8
  ),
  (
    5,
    "John",
    "Merk",
    55,
    "987 3rd Street",
    "2006-01-10",
    2,
    4.1
  );

INSERT INTO
  users
VALUES
  (1, "Juan", "Carlos", 26, 4.9),
  (2, "Fernando", "Carlos", 29, 4.8),
  (3, "Alice", "Smith", 36, 4.7),
  (4, "Rachel", "Koik", 25, 4.9),
  (5, "Jane", "Juy", 18, 4.9);

INSERT INTO
  employee
VALUES
  (1, "Sang", "Bui", 26, 4.9),
  (2, "Patrick", "Miller", 29, 4.8),
  (3, "Nick", "Schmidt", 36, 4.7),
  (4, "Jessica", "Day", 25, 4.9),
  (5, "Winston", "Churchill", 18, 4.9);

INSERT INTO
  city
VALUES
  (1, "San Francisco", 50, 4.9),
  (2, "Los Angeles", 88, 4.8),
  (3, "New York", 36, 4.7),
  (4, "Santa Monica", 25, 4.9),
  (5, "Orange County", 18, 4.9);

-- SELECT
SELECT
  *
FROM
  drivers;

SELECT
  *
FROM
  users;

SELECT
  *
FROM
  employee;

SELECT
  *
FROM
  city;

SELECT
  accidents
FROM
  drivers;

SELECT
  driving_licence_date
FROM
  drivers;

SELECT
  average_rating
FROM
  users;

SELECT
  miles_with_chauffeurs
FROM
  employee;

SELECT
  size
FROM
  city;

-- UPDATE
UPDATE drivers
SET
  age=28
WHERE
  id=1;

UPDATE users
SET
  first_name="John"
WHERE
  id=1;

UPDATE employee
SET
  experience=6
WHERE
  id=1;

UPDATE city
SET
  name="Paris"
WHERE
  id=1;

-- ALTER TABLE
ALTER TABLE city
ADD COLUMN cars INTEGER;

-- DELETE
DELETE FROM employee
WHERE
  ID=5;