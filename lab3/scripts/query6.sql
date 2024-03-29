-- Получить список студентов, отчисленных до первого сентября 2012 года
-- с очной формы обучения (специальность: Программная инженерия). В результат включить:
-- номер группы;
-- номер, фамилию, имя и отчество студента;
-- номер пункта приказа;
-- Для реализации использовать соединение таблиц.

select
    НУ."ГРУППА",
    НЛ."ИД",
    НЛ."ФАМИЛИЯ",
    НЛ."ИМЯ",
    НЛ."ОТЧЕСТВО",
    НУ."П_ПРКОК_ИД",
    НУ."ПРИЗНАК"
from "Н_УЧЕНИКИ" НУ
join "Н_ПЛАНЫ" НП on НУ."ПЛАН_ИД" = НП."ИД"
join "Н_НАПРАВЛЕНИЯ_СПЕЦИАЛ" ННС1 on НП."НАПС_ИД" = ННС1."ИД"
join "Н_НАПР_СПЕЦ" ННС2 on ННС1."НС_ИД" = ННС2."ИД"
join "Н_ФОРМЫ_ОБУЧЕНИЯ" НФО on НП."ФО_ИД" = НФО."ИД"
join "Н_ЛЮДИ" НЛ on НУ."ЧЛВК_ИД" = НЛ."ИД"
where ННС2."НАИМЕНОВАНИЕ" = 'Программная инженерия' and
      НФО."НАИМЕНОВАНИЕ" = 'Очная' and
      НУ."КОНЕЦ" < '2012-09-01';
-- если отличлен это именно признак = 'отчисл', то нет таких студентов
--       НУ."ПРИЗНАК" = 'отчисл'