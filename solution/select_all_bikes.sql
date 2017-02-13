with recursive rel_tree as (
   select id, name, parent_category_id, 1 as level, array[id] as path_info
   from category
   where parent_category_id is null
   union all
   select c.id, c.name, c.parent_category_id, p.level + 1, p.path_info||c.id
   from category c
     join rel_tree p on c.parent_category_id = p.id

)
select p.id, p.name, p.category_id
from product p
join rel_tree r on p.category_id = r.id
where r.parent_category_id = 2 order by p.id;
