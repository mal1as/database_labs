-- Фрэнк починил антенну
update device set is_work = true where id = 1;
update action set time_end = now() where id = 2;

-- Где находиться в данный момент person?
select
    l.name,
    l.position,
    pil.time_start
from location l
    join person_in_location pil on
        l.id = pil.location_id
    join person p on
        pil.person_id = p.id and p.name = :person_name
order by pil.time_start desc limit 1;

-- Более понятный person_in_location
select pil.time_start,
       concat(p.name, ' ', p.surname) full_name,
       l.name
from person_in_location pil
    join location l on l.id = pil.location_id
    join person p on p.id = pil.person_id
order by pil.time_start;

-- Подробный вывод location
select
    concat(l.name, ' в ', coalesce(l.position, concat(st.name, ' ', s.name))) location_description
from location l
        left join spaceship s on l.spaceship_id = s.id
        left join spaceship_type st on st.id = s.type_id;