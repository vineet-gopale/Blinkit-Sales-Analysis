create database blinkit_db;
use blinkit_db;
-- import table

select * from blinkit_data;

select count(*) from blinkit_data;  -- 8523

-- Data cleaning

-- item fat content
select distinct item_fat_content from blinkit_data;

update blinkit_data
set item_fat_content =
case 
when item_fat_content in ('low fat', 'LF') then 'Low Fat'
when item_fat_content = 'reg' then 'Regular'
else item_fat_content
end;

-- KPI's requirement

-- total sales
select round(sum(sales),2) as total_sales from blinkit_data;

-- average sales
select round(avg(sales),2) as avg_sales from blinkit_data;

-- number of items
select count(distinct item_identifier) as no_of_items from blinkit_data;

-- average rating of items
select round(avg(rating),2) as avg_rating from blinkit_data;

-- KPI metrics sliced by dimensions

-- how KPIs vary with fat content
select item_fat_content, 
	round(sum(sales),2) as total_sales,
    round(avg(sales),2) as avg_sales,
    count(distinct item_identifier) as no_of_items,
    round(avg(rating),2) as avg_rating
from blinkit_data
group by item_fat_content
order by total_sales desc;

-- top 5 item types by sales
select item_type, 
	round(sum(sales),2) as total_sales,
    round(avg(sales),2) as avg_sales,
    count(distinct item_identifier) as no_of_items,
    round(avg(rating),2) as avg_rating
from blinkit_data
group by item_type
order by total_sales desc
limit 5;

-- sales by outlet location and fat content
SELECT outlet_location_type,
	ROUND(SUM(CASE WHEN item_fat_content = 'Low Fat' THEN sales ELSE 0 END),2) AS Low_Fat_Sales,
	ROUND(SUM(CASE WHEN item_fat_content = 'Regular' THEN sales ELSE 0 END),2) AS Regular_Sales
FROM blinkit_data
GROUP BY outlet_location_type
ORDER BY outlet_location_type;

-- sales by outlet establishment year
select outlet_establishment_year,
	round(sum(sales),2) as total_sales,
    round(avg(sales),2) as avg_sales,
    count(distinct item_identifier) as no_of_items,
    round(avg(rating),2) as avg_rating
from blinkit_data
group by outlet_establishment_year
order by total_sales desc;  

-- queries for charts

-- percentage sales by outlet size
SELECT 
    Outlet_Size, 
    Round(SUM(sales),2) AS Sales,
    Round((SUM(sales) * 100.0 / SUM(SUM(sales)) OVER()),2) AS Sales_Percentage
FROM blinkit_data
GROUP BY Outlet_Size
ORDER BY Sales DESC;

-- metrics by outlet location
select outlet_location_type,
	round(sum(sales),2) as total_sales,
    round((SUM(sales) * 100.0 / SUM(SUM(sales)) OVER()),2) AS sales_percentage,
    round(avg(sales),2) as avg_sales,
    count(distinct item_identifier) as no_of_items,
    round(avg(rating),2) as avg_rating
from blinkit_data
group by outlet_location_type
order by total_sales desc; 

-- metrics by outlet type
select outlet_type,
	round(sum(sales),2) as total_sales,
    round((SUM(sales) * 100.0 / SUM(SUM(sales)) OVER()),2) AS sales_percentage,
    round(avg(sales),2) as avg_sales,
    count(distinct item_identifier) as no_of_items,
    round(avg(rating),2) as avg_rating
from blinkit_data
group by outlet_type
order by total_sales desc; 



