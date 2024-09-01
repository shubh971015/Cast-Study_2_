select * from order_details;
select * from menu_items;


select * from order_details od
		 left join menu_items  mi
         on od.item_id = mi.menu_item_id;



select count(*) as no_of_items_order_morethan_12 from
			(select order_id ,count(item_id) as no_of_items
			from order_details
			group by order_id 
			having no_of_items >12 ) as no_of_order
			;
	
-- what were the least and most order items,what catergory they are in
select * from order_details;
select * from menu_items;
select item_name ,category,count(*) from order_details od
		left join menu_items mi
        on od.item_id = mi.menu_item_id
        group by item_id,category
        order by count(*) asc 
        limit 5
        ;
-- what were top 5 order that spent most money;
select item_name,category ,order_id, sum(price) as total_spend from order_details od
		left join menu_items mi
        on od.item_id = mi.menu_item_id
        group by order_id
        order by total_spend desc
        limit	5 
        ;
-- view details of most spend order_id; 
select item_name ,category, item_id, count(*) from order_details od
		left join menu_items mi
        on od.item_id = mi.menu_item_id
        where order_id = 440
    ;
-- view details of top 5 highest spend order, what insights you get
select order_id,category, item_id, count(*) from order_details od
		left join menu_items mi
        on od.item_id = mi.menu_item_id
        where order_id in (440,2075,330,1975,2675)
        group by order_id, category
        order by count(*) desc;
-- item_id 124 is most order item ,which is spaghetti 