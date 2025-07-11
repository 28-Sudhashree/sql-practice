--data exploration

--count of rows
select count(*) from zepto;

--sample data
select * from zepto
limit 10;
--null values
select * from zepto
where name IS NULL
OR
 category is null
OR
 mrp is null
OR
 discout_percent is null
OR
 available_quantity is null
OR
 discounted_selling_price is null
OR
 weight_in_grams is null
OR
 out_of_stock is null
OR
 quantity is null;

 --PRODUCT CATEGORY
 select distinct category
 from zepto
 order by category;

--product of stock
select out_of_stock,count(sku_id)
from zepto
group by out_of_stock;
--produts name present multiple times
select name,count(sku_id) as "no.of sku's"
from zepto
group by name 
having count(sku_id)>1
order by count(sku_id)desc;

--data cleaning

--product with price 0
select * from zepto
where mrp=0 or discounted_selling_price =0;

delete from zepto
where mrp =0;

--converting price in proper decimal
update zepto
set mrp=mrp/100.0,
discounted_selling_price=discounted_selling_price/100.0;

select mrp,discounted_selling_price from zepto;
update zepto 
set constrain discounted_selling_price as numeric(5,2);

--Q1. find the top 10 best-value products based on discount percentage.(product having max discount)
select name,mrp,discout_percent from zepto 
order by discout_percent desc
limit 10;

--Q2. what are the products with high mrp but out of stock(which is affecting sales)
select distinct name,mrp
from zepto
where out_of_stock= 'true'
order by mrp desc;

--Q3. CALCULATE  ESTIMATED REVENUE FOR EACH CATEGORY
SELECT category,sum(discounted_selling_price*quantity) AS cost
from zepto
group by category
order by cost;

--Q4.find all product where Mrp is greater and discount is less
select distinct name ,mrp ,discout_percent from zepto
where discout_percent <10
order by mrp desc;

--Q5 identify the top 5 category offering the highest average discount percentage
select distinct category, round(avg(discout_percent),2) as avg_discount_price from zepto
group by category 
order by avg_discount_price desc
limit 5;
--find the price per gram for product above 100 gm and sort the best value
select name, quantity from zepto;
select * from zepto;
select name,weight_in_grams,discounted_selling_price,(discounted_selling_price/10) as weight_per_100gm
from zepto
where weight_in_grams >100
order by weight_per_100gm asc;

--grouping proudct category in low medium bulk
select distinct name,quantity,
case
when quantity <150 then' low'
when quantity <800 then 'medium'
else  'bulk'
end as quantity_check from zepto;

--what is the total inventory weight per category
select category,sum(weight_in_grams*available_quantity)/1000 as kg
from zepto
group by category
order by kg;