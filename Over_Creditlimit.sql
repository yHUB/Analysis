-- Create a cte 

with sales as
(
select orderDate,
t1.customerNumber,
customerName, 
productCode,
creditLimit,
quantityOrdered * priceEach as sales_value,
t1.ordernumber
from orders t1

-- join orders and  orderdetail from ordernumber table 
join orderdetails t2
on t1.orderNumber = t2.orderNumber

-- join orders and customer from customernumber table
join customers t3
on t1.customerNumber = t3.customerNumber
),

-- create another cte
 running_total_sales as
 (

select 
 orderDate,orderNumber,
customerNumber,
customername,
creditLimit,
sum(sales_value) as sales_value
from sales
group by 
 orderDate,orderNumber,
 customerNumber,
 customername,
creditLimit)

select *,
sum(sales_value) over(partition by customernumber order by orderdate) as running_total  
from running_total_sales 