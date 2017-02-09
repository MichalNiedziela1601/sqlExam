--Write your select query below
--Choose name and weight the heaviest car of all vehicles
SELECT brand, weight FROM car WHERE weight = (SELECT max(weight) FROM car);
