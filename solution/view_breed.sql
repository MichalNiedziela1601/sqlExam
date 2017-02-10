-- Put view creation query here
-- Multiple inch height by 2.54 to get centimeters height
-- Multiple pound weight by 0.4536 to get kilograms weight
CREATE VIEW view_breed AS
SELECT id, name, origin,
round(((nullif(male_height_min,0) + nullif(male_height_max,0) + nullif(female_height_min,0) + nullif(female_height_max,0))/
  4)*2.54)::integer AS height
,
  round(((nullif(male_weight_min,0) + nullif(male_weight_max,0) + nullif(female_weight_min,0) + nullif(female_weight_max,0))/
  4)*0.4536 )::integer AS weight
  FROM breed ORDER BY weight DESC, height DESC
 ;



