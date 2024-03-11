with prod_sale as
(
select ordernumber, t1.productcode, productline
from orderdetails t1
 join products t2
on t1.productCode = t2.productCode
)
 select t1.ordernumber, t1.productline as product1, t2.productline as product2
 from prod_sale t1
 left join prod_sale t2
 on t1.ordernumber = t2.ordernumber and t1.productline != t2.productline