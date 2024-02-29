-- Выведите таблицу со средним возрастом студентов во всех группах (Группа, Средний возраст),
-- где средний возраст равен среднему возрасту в группе 1101.

select
    НУ."ГРУППА",
    round(avg(extract(year from age(now(), НЛ."ДАТА_РОЖДЕНИЯ")))) avg_age
from "Н_УЧЕНИКИ" НУ
         join "Н_ЛЮДИ" НЛ on НУ."ЧЛВК_ИД" = НЛ."ИД"
group by НУ."ГРУППА"
having НУ."ГРУППА" <> '1101' and round(avg(extract(year from age(now(), НЛ."ДАТА_РОЖДЕНИЯ")))) =
       (
           select
               round(avg(extract(year from age(now(), НЛ."ДАТА_РОЖДЕНИЯ"))))
           from "Н_УЧЕНИКИ" НУ
                    join "Н_ЛЮДИ" НЛ on НУ."ЧЛВК_ИД" = НЛ."ИД"
           where НУ."ГРУППА" = '1101'
           group by "ГРУППА"
       );

-- second version
-- with group_avg as (
--     select
--         НУ."ГРУППА" group_num,
--         round(avg(extract(year from age(now(), НЛ."ДАТА_РОЖДЕНИЯ")))) avg_age
--     from "Н_УЧЕНИКИ" НУ
--              join "Н_ЛЮДИ" НЛ on НУ."ЧЛВК_ИД" = НЛ."ИД"
--     group by "ГРУППА"
-- )
-- select *
-- from group_avg ga
-- where ga.avg_age = (select avg_age from group_avg where group_num = '1101') and ga.group_num <> '1101';