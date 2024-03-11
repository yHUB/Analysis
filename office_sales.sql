
with office_sales as(
select t1.ordernumber, t2.productCode,
 t2.quantityordered,
 t2.priceEach, 
 quantityOrdered * priceEach as sales_value,
 t3.city as customer_city, 
 t3.country as customer_country,
 t4.productline,
 t6.city as office_city,
 t6.country as office_country
from orders t1

-- join orfdernumber from orders and orderdetails table
join orderdetails t2
on t1.ordernumber = t2.orderNumber
--  join customernumber from customers and orders table
join customers t3
-- join orfdernumber from orders and orderdetails table
on t1.customerNumber = t3.customerNumber
-- join productcode from products and  orderdetails table
join products t4
on t2.productCode = t4.productCode
-- join salesrepemployee from employees and customers table
 join employees t5
 on t3.salesRepEmployeeNumber = t5.employeeNumber
 -- join officode from offices and employees table
 join offices t6
 on t5.officeCode = t6.officeCode
 )
 
 select 
 ordernumber,
 customer_city,
 customer_country,
 productline,
 office_city,
 office_country,
sum(sales_value) as sales_value
 from office_sales
 group by  ordernumber,
 customer_city, 
 customer_country,
 productline,
 office_city,
 office_country