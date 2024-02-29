insert into person values (1, 'Фрэнк', 'Пул', 30);
insert into person values (2, 'Дейв', 'Боумен', 35);

insert into spaceship_type values (1, 'капсула', 1);
insert into spaceship_type values (2, 'звездолет', 10);
insert into spaceship_type values (3, 'межзвездный ковчег', 300);

insert into spaceship values (1, 'Бетти', 1);
insert into spaceship values (2, 'Дискавери', 2);

insert into location values (1, 'салон корабля', null, 1);
insert into location values (2, 'космос около кораблей', 'открытый космос', null);
insert into location values (3, 'место для ремонта', 'около каркаса антенны', null);

insert into action_type values (1, 'чинить');
insert into action_type values (2, 'управлять');

insert into device values (1, 'антенна', 'антенна с паутинным каркасом и зеркалом из тончайшего металла', false, 2);
insert into device values (2, 'рули капсулы', null, true, 1);
insert into device values (3, 'дистанционные манипуляторы', null, true, 1);


-- Сначала Фрэнк находится в салоне капсулы Бетти
insert into person_in_location values (1, now() - interval '20 min', 1, 1);
-- Затем Фрэнк выходит в открытый космос, чтобы добраться до сломанной антенны
insert into person_in_location values (2, now() - interval '10 min', 1, 2);
-- Затем Фрэнк находится у антенны
insert into person_in_location values (3, now(), 1, 3);

-- Фрэнк управляет рулями капсулы
insert into action values (1, 2, now() - interval '30 min', now() - interval '20 min', 2, 1);
-- Фрэнк чинит сломанную антенну
insert into action values (2, 1, now(), null, 1, 1);