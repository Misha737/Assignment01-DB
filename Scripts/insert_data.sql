use a01;

insert
	into employees (name, birthday)
	values
		("Misha", '2006-11-20'),
		("Roma", '2006-12-19'),
		("Valera", '2005-06-16'),
		("Andrii", '2006-09-02'),
		("Tania", '2007-07-24'),
		("Natalia", '2004-10-01');

insert
	into goods (name)
	values
		("Apple"),
		("Cake"),
		("Meat"),
		("Spaghetti"),
		("Croissants"),
		("Milk"),
		("Egg")

insert
	into customers (name, birthday)
	values
		("Olena", '2004-05-12'),
		("Dmytro", '2007-11-23'),
		("Sofiia", '2010-03-08'),
		("Artem", '2002-09-30'),
		("Maksym", '2006-12-17'),
		("Kateryna", '2001-06-04'),
		("Yaroslav", '2008-08-19'),
		("Anastasiia", '2003-01-27'),
		("Ivan", '2005-07-14'),
		("Veronika", '2009-10-06');


insert
	into purchases (date_of_purchase, good_id, customer_id)
	values
		('2025-05-26', 1),
		('2007-03-14', 2),
		('2012-11-09', 7),
		('2021-06-25', 2),
		('2003-08-03', 1),
		('2016-02-28', 6),
		('2010-12-17', 4),
		('2005-07-21', 5),
		('2023-04-06', 7),
		('2001-10-30', 2),
		('2018-09-12', 3);

insert
	into premises (location)
	values
		('Kyiv'),
		('Lviv'),
		('Kharkiv'),
		('Odesa'),
		('Dnipro'),
		('Vinnytsia'),
		('Poltava'),
		('Chernihiv'),
		('Ivano-Frankivsk'),
		('Zaporizhzhia');