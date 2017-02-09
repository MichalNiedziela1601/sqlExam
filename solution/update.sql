--Write your update query below
--Mark the oldest car as used
UPDATE car SET secondhand = true
WHERE year_of_manufacture <= 1983;
