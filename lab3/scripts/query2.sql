-- Сделать запрос для получения атрибутов из указанных таблиц, применив фильтры по указанным условиям:
-- Таблицы: Н_ЛЮДИ, Н_ВЕДОМОСТИ, Н_СЕССИЯ.
-- Вывести атрибуты: Н_ЛЮДИ.ИД, Н_ВЕДОМОСТИ.ЧЛВК_ИД, Н_СЕССИЯ.ДАТА.
-- Фильтры (AND):
-- a) Н_ЛЮДИ.ФАМИЛИЯ = Афанасьев.
-- b) Н_ВЕДОМОСТИ.ИД < 39921.
-- c) Н_СЕССИЯ.ЧЛВК_ИД < 100622.
-- Вид соединения: RIGHT JOIN.

select
    НЛ."ИД",
    НВ."ЧЛВК_ИД",
    НС."ДАТА"
from "Н_ЛЮДИ" НЛ
right join "Н_ВЕДОМОСТИ" НВ on НЛ."ИД" = НВ."ЧЛВК_ИД"
right join "Н_СЕССИЯ" НС on НЛ."ИД" = НС."ЧЛВК_ИД"
where НЛ."ФАМИЛИЯ" = 'Афанасьев' and
      НВ."ИД" < 39921 and
      НС."ЧЛВК_ИД" < 100622;