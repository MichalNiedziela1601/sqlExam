-- Write your schema below
--| car                        |
--|----------------------------|
--| id (PK)                    |
--| brand **STR**              |
--| year_of_manufacture **INT**|
--| color **STR**              |
--| weight **FLOAT**           |
--| secondhand **BOOL**        |
CREATE TABLE IF NOT EXISTS car (
id SERIAL PRIMARY KEY,
brand VARCHAR(40),
year_of_manufacture INT,
color VARCHAR(30),
weight FLOAT,
secondhand BOOL
)
