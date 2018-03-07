﻿-- Fields: user_id, login, password_hash, name, surname, phone_number, ip_address, last_visited_date, status, role, registration_date, email, link

insert into users values(1, 'admin_user', '$2a$10$2ye26xEjQA9heyLYPTAkiOA1ZqMC0CuPPVOac0avLn4TCapxLv7u6', null, null, null, null, null, 'ACTIVE', 'ADMIN', null, null, null);
insert into users values(2, null, null, null, null, null, '0:0:0:0:0:0:0:1', null, 'ACTIVE', 'UNAUTHORIZED', null, null, null);
insert into users values(3, 'customer_user', '$2a$10$2ye26xEjQA9heyLYPTAkiOA1ZqMC0CuPPVOac0avLn4TCapxLv7u6', 'Name', 'Surname', null, null, null, 'ACTIVE', 'CUSTOMER', null, null, null);
insert into users values(4, 'moderator_user', '$2a$10$2ye26xEjQA9heyLYPTAkiOA1ZqMC0CuPPVOac0avLn4TCapxLv7u6', 'Name', 'Surname', null, null, null, 'ACTIVE', 'MODERATOR', null, null, null);

create sequence hibernate_sequence start with 5;
