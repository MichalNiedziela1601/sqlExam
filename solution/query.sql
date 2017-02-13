-- Write your solution here
-- For tests assertion purpose please cast breeds json field into text data type.
select origin, count(origin) as count, (
    json_agg(json_build_object( 'name',(SELECT r.name FROM (SELECT name) r), 'family', (SELECT r.family FROM (SELECT family) r) ) )
  )::TEXT AS breeds from breed  group by origin order by origin ;
