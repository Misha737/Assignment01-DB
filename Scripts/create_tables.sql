create database a01;

use a01;

create table customers (
	id int primary key auto_increment,
	name varchar(50) not null,
	birthday date not null,
	good_id int not null,
	purchase_id int not null
);

create table employees (
	id int primary key auto_increment,
	name varchar(50) not null,
	birthday date not null
);

create table goods (
	id int primary key auto_increment,
	name varchar(50) not null
);

create table purchases (
	id int primary key auto_increment,
	date_of_purchase date not null,
	good_id int null,
	customer_id int not null
);

create table premises (
	id int primary key auto_increment,
	location varchar(50) not null
);