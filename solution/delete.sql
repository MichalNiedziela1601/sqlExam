--Write your delete query below
--Remove all used cars, which in 2000 had more than 10 years
DELETE FROM car WHERE 2000 - year_of_manufacture > 10 AND secondhand = true;
