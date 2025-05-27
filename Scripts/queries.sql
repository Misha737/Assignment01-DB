use a01;

show tables;

-- CTEs
with
	-- поєдную через join всі таблиці
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
	
	-- фультрую продокти які є не "Cake"
	without_cake as (
		select *
		from
			purchase_select
		where
			product_name != 'Cake'
	),
	
	-- через агрегацію вибираю останню покупку покупця та вибираю тільки ті покупки, які були зроблені в 2023 рік
	purchases_2023 as (
		select
			customer_name,
			max(purchase_date) as last_date
		from
			without_cake w
		group by
			customer_name
		having last_date between '2023-01-01' and '2023-12-31'
	),
	
	-- вибираю тільки ті покупуи, які були зроблені в 2023 рік
	purchases_2024 as (
		select
				customer_name,
				max(purchase_date) as last_date
			from
				without_cake w
			group by
				customer_name
			having last_date between '2024-01-01' and '2024-12-31'
	),
	
	-- об`єдную 2023 та 2024 роки 
	unioned as (
		select *
		from 
			purchases_2023
		union all
			select *
			from purchases_2024
		order by last_date
	),
	
	-- так як через групування не всі колонки я можу вибрати мені потрібно вказати за яким критерієм я буду вибирати рядки із групи.
	all_columns as (
		select *
		from without_cake w
		where w.purchase_date = (
			select o.last_date from unioned o
			where w.customer_name = o.customer_name
		)
	)

	-- впорядковую за датою та обмежою до 10 рядків
	select *
		from
			all_columns
		order by purchase_date
		limit 10;