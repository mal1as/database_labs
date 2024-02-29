create table person
(
    id      serial primary key,
    name    varchar(32) not null,
    surname varchar(32) not null,
    age     smallint    not null check (age > 0)
);

create table spaceship_type
(
    id       serial primary key,
    name     varchar(32) not null,
    capacity integer default 1 check (capacity > 0)
);

create table spaceship
(
    id      serial primary key,
    name    varchar(32) not null,
    type_id integer references spaceship_type (id)
);

create table location
(
    id           serial primary key,
    name         varchar(64) not null,
    position     varchar(64) default 'Неизвестное расположение',
    spaceship_id integer references spaceship (id)
);

create table device
(
    id           serial primary key,
    name         varchar(64) not null,
    description  text,
    is_work      boolean default true,
    spaceship_id integer references spaceship (id)
);

create table action_type
(
    id   serial primary key,
    name varchar(32) not null
);

create table person_in_location
(
    id          serial primary key,
    time_start  timestamp default now(),
    person_id   integer references person (id),
    location_id integer references location (id)
);

create table action
(
    id         serial primary key,
    type_id    integer references action_type (id),
    time_start timestamp default now(),
    time_end   timestamp,
    device_id  integer references device (id),
    person_id  integer references person (id)
);
