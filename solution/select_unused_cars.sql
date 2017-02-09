--Write your select query below
--Choose the brand, year of production and color of all unused cars, produced in 2000 (or below), which color is a variation of the red, sorted by the earliest year of production
SELECT brand, year_of_manufacture, color FROM car WHERE year_of_manufacture <= 2000 AND color LIKE 'red%' ORDER BY year_of_manufacture;
