select t1.orderDate,
	t1.orderNumber,
		quantityOrdered,
        priceEach,
        productName,
        productLine,
        buyPrice,
        city,
        country,
        priceEach * quantityOrdered as Sales_Value,
		quantityOrdered * buyPrice as Cost_of_Sales
        
from orders t1
join orderdetails t2
on t1.orderNumber = t2.orderNumber
join products t3
on t2.productCode = t3.productCode
join customers t4
on t1.customerNumber = t4.customerNumber
where year(orderdate) = 2004