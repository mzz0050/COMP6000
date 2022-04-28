
create database library_webatm;

create table account
(
    accountid int auto_increment
        primary key,
    password  varchar(50) not null,
    email     varchar(45) null,
    type      tinyint(1)  not null
);

create table history
(
    user_id      int                                not null,
    operation_id int auto_increment
        primary key,
    in_exp       float                              not null,
    exe_type     varchar(45)                        not null,
    date         datetime default CURRENT_TIMESTAMP not null
);

create table user
(
    user_id int auto_increment
        primary key,
    name    varchar(45) null,
    balance float       null
);

insert into library_webatm.history (user_id, operation_id, in_exp, exe_type, date) values (2, 1, -100, 'Withdraw', '2022-04-25 12:10:21');
insert into library_webatm.history (user_id, operation_id, in_exp, exe_type, date) values (1, 2, 200, 'Deposit', '2022-04-24 16:11:22');
insert into library_webatm.history (user_id, operation_id, in_exp, exe_type, date) values (1, 3, 100, 'Deposit', '2022-04-22 16:11:22');
insert into library_webatm.history (user_id, operation_id, in_exp, exe_type, date) values (2, 4, 1000, 'Deposit', '2022-04-25 16:11:22');
insert into library_webatm.history (user_id, operation_id, in_exp, exe_type, date) values (3, 5, 2000, 'Deposit', '2022-04-20 16:11:22');
insert into library_webatm.history (user_id, operation_id, in_exp, exe_type, date) values (4, 6, -540, 'Transfer', '2022-04-11 16:11:22');
insert into library_webatm.history (user_id, operation_id, in_exp, exe_type, date) values (2, 7, 540, 'Transfer', '2022-04-25 16:11:22');
insert into library_webatm.history (user_id, operation_id, in_exp, exe_type, date) values (3, 8, 50, 'Deposit', '2022-04-27 16:12:04');
insert into library_webatm.history (user_id, operation_id, in_exp, exe_type, date) values (1, 9, 123, 'Deposit', '2022-04-27 18:44:21');
insert into library_webatm.history (user_id, operation_id, in_exp, exe_type, date) values (1, 10, -123, 'Withdraw', '2022-04-27 19:04:30');
insert into library_webatm.history (user_id, operation_id, in_exp, exe_type, date) values (1, 11, 123, 'Deposit', '2022-04-27 19:19:04');
insert into library_webatm.history (user_id, operation_id, in_exp, exe_type, date) values (1, 12, -123, 'Withdraw', '2022-04-27 19:19:12');
insert into library_webatm.history (user_id, operation_id, in_exp, exe_type, date) values (1, 13, -123, 'Transfer', '2022-04-27 19:34:13');
insert into library_webatm.history (user_id, operation_id, in_exp, exe_type, date) values (2, 14, 123, 'Transfer', '2022-04-27 19:34:13');
insert into library_webatm.history (user_id, operation_id, in_exp, exe_type, date) values (2, 15, -123, 'Transfer', '2022-04-27 19:36:57');
insert into library_webatm.history (user_id, operation_id, in_exp, exe_type, date) values (1, 16, 123, 'Transfer', '2022-04-27 19:36:57');

insert into library_webatm.user (user_id, name, balance) values (1, 'zhao', 1615);
insert into library_webatm.user (user_id, name, balance) values (2, 'qian', 5000);
insert into library_webatm.user (user_id, name, balance) values (3, 'sun', 2000);
insert into library_webatm.user (user_id, name, balance) values (4, 'li', 500);

insert into library_webatm.account (accountid, password, email, type) values (1, '1', '1@2.com', 0);
insert into library_webatm.account (accountid, password, email, type) values (2, '2', '2@2.com', 0);
insert into library_webatm.account (accountid, password, email, type) values (3, '123456', 'test', 1);
insert into library_webatm.account (accountid, password, email, type) values (4, '1', 't1@1.com', 1);
insert into library_webatm.account (accountid, password, email, type) values (5, '1', 't2@1.com', 0);
