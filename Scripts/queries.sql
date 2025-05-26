use a01;

show tables;

with
	purchase_select as (
		select
			c.name as customer_name,
			g.name as product_name,
			pur.date_of_purchase as purchase_date,
			pre.location as locatation,
			e.name as employee_name
		from purchases pur
		left join goods g
			on g.id = pur.good_id
		left join customers c
			on c.id = pur.customer_id
		left join premises pre
			on pre.id = pur.premises_id
		left join employees e
			on e.id = pur.employee_id
	),
	without_cake as (
		select *
		from
			purchase_select
		where
			product_name != 'Cake'
	),
	
	purchases_2023 as (
		select
			customer_name,
			max(purchase_date) as last_date
		from
			without_cake w
		group by
			customer_name
		having last_date > '2023-01-01' and last_date < '24-01-01'
	),
	
	purchases_2024 as (
		select
				customer_name,
				max(purchase_date) as last_date
			from
				without_cake w
			group by
				customer_name
			having last_date > '2024-01-01' and last_date < '2025-01-01'
	),
	
	unioned as (
		select *
		from 
			purchases_2023
		union all
			select *
			from purchases_2024
		order by last_date
	),
	
	all_columns as (
		select *
		from without_cake w
		where w.purchase_date = (
			select o.last_date from unioned o
			where w.customer_name = o.customer_name
		)
	)

	select *
	from
		all_columns
	order by purchase_date
	limit 10;