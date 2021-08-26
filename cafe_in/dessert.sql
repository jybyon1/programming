/*

create sequence seq_dessert_d_idx

create table dessert
(
   d_idx          int,
   d_name        varchar(100)
)

alter table dessert
   add constraint pk_dessert_d_idx primary key(d_idx);

insert into dessert values (seq_dessert_d_idx.nextVal, 'macarong');
insert into dessert values (seq_dessert_d_idx.nextVal, 'bread');
insert into dessert values (seq_dessert_d_idx.nextVal, 'bingsoo');
insert into dessert values (seq_dessert_d_idx.nextVal, 'cake');
insert into dessert values (seq_dessert_d_idx.nextVal, 'waffle');

*/