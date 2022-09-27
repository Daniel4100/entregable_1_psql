CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" varchar NOT NULL,
  "rol_id" uuid NOT NULL
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" varchar NOT NULL,
  "users_id" uuid NOT NULL,
  "level_id" uuid NOT NULL,
  "category_id" uuid NOT NULL
);

CREATE TABLE "levels" (
  "id" uuid PRIMARY KEY,
  "level" varchar NOT NULL
);

CREATE TABLE "curses_video" (
  "id" uuid PRIMARY KEY,
  "curses_id" uuid NOT NULL,
  "title" varchar NOT NULL,
  "url" varchar NOT NULL
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "roles" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "courses_in_process" (
  "id" uuid PRIMARY KEY,
  "users_id" uuid NOT NULL,
  "curses_id" uuid NOT NULL,
  "percentage" varchar NOT NULL
);

CREATE TABLE "completed" (
  "id" uuid PRIMARY KEY,
  "users_id" uuid NOT NULL,
  "curses_id" uuid NOT NULL
);

ALTER TABLE "courses" ADD FOREIGN KEY ("users_id") REFERENCES "users" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("level_id") REFERENCES "levels" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("rol_id") REFERENCES "roles" ("id");

ALTER TABLE "completed" ADD FOREIGN KEY ("users_id") REFERENCES "users" ("id");

ALTER TABLE "completed" ADD FOREIGN KEY ("curses_id") REFERENCES "courses" ("id");

ALTER TABLE "curses_video" ADD FOREIGN KEY ("curses_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "courses_in_process" ADD FOREIGN KEY ("curses_id") REFERENCES "courses" ("id");

ALTER TABLE "courses_in_process" ADD FOREIGN KEY ("users_id") REFERENCES "users" ("id");

insert into users (
id,
name,
email,
password,
age,
rol_id

) values(
'973f7274-2f1c-4862-9ab9-8004d128e5b1',
'jhener',
'jhener9@gmail.com',
'123root',
'23',
'd54ab3c9-5d3d-45c1-8d2c-1b805c15a550'
),
(
'3246f385-4ba5-4379-abd8-efc84cb4db6c',
'daniel',
'dani@gmail.com',
'45pass',
'22',
'a5f88a6b-79a3-424c-a8ce-b2ddf1e6ca21'
),
(
'ff1f6230-f8ee-4cee-a51b-2e0593cc2062',
'abril',
'abrilis@gmail.com',
'abrilis12',
'19',
'af2a648a-1e65-4def-adfa-acc492908f9a'
),
(
'a760873f-a0d7-4bb1-9833-05fd45858f1d',
'mario',
'mario10@gmail.com',
'mario23',
'50',
'a5f88a6b-79a3-424c-a8ce-b2ddf1e6ca21'
),
(
'c2d3ab9b-283d-43f7-bef5-521b6c781fe2',
'ana',
'ana55@gmail.com',
'anita99',
'45',
'd54ab3c9-5d3d-45c1-8d2c-1b805c15a550'
);

insert into roles (
id,
name
)
values(
'd54ab3c9-5d3d-45c1-8d2c-1b805c15a550',
'student'
),(
'a5f88a6b-79a3-424c-a8ce-b2ddf1e6ca21',
'teacher'
),
(
'af2a648a-1e65-4def-adfa-acc492908f9a',
'admin'
);

insert into levels (
id,
level
)
values(
'9302a0c8-19d4-4ba3-82cd-e53242927474',
'Beginners'
),
(
'd321b108-3c47-4a9d-97a6-6d5ff239fd45',
'intermedio'
),
(
'fd72855b-e776-49b6-a8c2-1a1460e054b1',
'advanced'
);

update levels set level = 'intermediate' where id = 'd321b108-3c47-4a9d-97a6-6d5ff239fd45';

insert into categories  (
id,
name
)
values(
'd1792ad2-382c-4896-9f2c-9245a28ef0a4',
'Weave'
),
(
'21ebb9ab-877d-43d6-95de-9eae95b16218',
'programming'
),
(
'1ebabe82-769a-49e2-bc3f-720d7c0c3821',
'dance'
);

insert into courses (
id,
title,
description,
users_id,
level_id,
category_id
)
values(
'31f95642-582c-44e3-babc-d1872a49405c',
'tejer es un arte',
'aprende a tejer',
'3246f385-4ba5-4379-abd8-efc84cb4db6c',
'9302a0c8-19d4-4ba3-82cd-e53242927474',
'd1792ad2-382c-4896-9f2c-9245a28ef0a4'
),
(
'45496e9d-2c9d-477d-811e-58fba01dad71',
'fundamentos de la programacion',
'aprende a programar',
'a760873f-a0d7-4bb1-9833-05fd45858f1d',
'fd72855b-e776-49b6-a8c2-1a1460e054b1',
'21ebb9ab-877d-43d6-95de-9eae95b16218'
),
(
'57001464-0534-46ce-9155-1e7aa6452fd2',
'bailar primeros paos',
'aprende a bailar',
'3246f385-4ba5-4379-abd8-efc84cb4db6c',
'd321b108-3c47-4a9d-97a6-6d5ff239fd45',
'1ebabe82-769a-49e2-bc3f-720d7c0c3821'
),
(
'cbee599d-eeae-4839-b139-88c35a393567',
'estilos de tejido',
'3 tejidos populares',
'3246f385-4ba5-4379-abd8-efc84cb4db6c',
'd321b108-3c47-4a9d-97a6-6d5ff239fd45',
'd1792ad2-382c-4896-9f2c-9245a28ef0a4'
);

insert into curses_video (
id,
curses_id,
title,
url
)
values(
'05f611f4-9bed-46b0-8aa7-48e6d982edc3',
'31f95642-582c-44e3-babc-d1872a49405c',
'compra hilo',
'www.ejemplo1.com'
),
(
'd248be30-6aaa-4f12-9adf-79335660506a',
'45496e9d-2c9d-477d-811e-58fba01dad71',
'html',
'www.ejemplo2.com'
),
(
'4beaea31-ff2d-464a-9979-9a4e1c22d013',
'57001464-0534-46ce-9155-1e7aa6452fd2',
'zapatos de baile',
'www.ejemplo3.com'
),
(
'cca754ec-263f-415d-bdf1-3084687e500d',
'31f95642-582c-44e3-babc-d1872a49405c',
'pasos a seguir',
'www.ejemplo4.com'
),
(
'e335fac8-9421-434c-bdda-5f4ee0d2f8ec',
'45496e9d-2c9d-477d-811e-58fba01dad71',
'css',
'www.ejemplo5.com'
);

insert into courses_in_process (
id,
users_id,
curses_id,
percentage
)
values(
'aa209ad0-d333-461c-b6ba-c45c0dd4ecfb',
'973f7274-2f1c-4862-9ab9-8004d128e5b1',
'45496e9d-2c9d-477d-811e-58fba01dad71',
'30%'
),
(
'32272a3f-e592-4697-8be2-e4cfe3bd8dc1',
'c2d3ab9b-283d-43f7-bef5-521b6c781fe2',
'31f95642-582c-44e3-babc-d1872a49405c',
'10%'
),
(
'e32ffbd8-8d6b-4818-8a4e-597f65d56090',
'c2d3ab9b-283d-43f7-bef5-521b6c781fe2',
'57001464-0534-46ce-9155-1e7aa6452fd2',
'80%'
),
(
'18e8e981-571d-492e-a8a7-79f95301a030',
'973f7274-2f1c-4862-9ab9-8004d128e5b1',
'cbee599d-eeae-4839-b139-88c35a393567',
'50%'
);

insert into completed (
  id,
  users_id,
  curses_id
)
values(
'75d1ba02-1cbf-4047-ba8b-abce17eb53e6',
'973f7274-2f1c-4862-9ab9-8004d128e5b1',
'31f95642-582c-44e3-babc-d1872a49405c'
),
(
'62043956-d62b-4dd5-ab74-e4fc9bd76017',
'973f7274-2f1c-4862-9ab9-8004d128e5b1',
'57001464-0534-46ce-9155-1e7aa6452fd2'
),
(
'72ce5b81-cbed-4227-b404-36ef34b30f5d',
'c2d3ab9b-283d-43f7-bef5-521b6c781fe2',
'45496e9d-2c9d-477d-811e-58fba01dad71'
),
(
'1acc1e06-b0c9-4828-a039-c7626d601035',
'c2d3ab9b-283d-43f7-bef5-521b6c781fe2',
'cbee599d-eeae-4839-b139-88c35a393567'
);

select
users.name,
roles.name,
courses.title,
courses_in_process.percentage,
levels.level 
from 
users 
inner join 
courses_in_process on users.id = courses_in_process.users_id 
inner join 
courses on courses_in_process.curses_id = courses.id 
inner join 
levels on courses.level_id = levels.id
inner join 
roles on users.rol_id = roles.id ; 