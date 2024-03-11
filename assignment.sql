select orderdate,
	ordernumber,
    t2.salesrepemployeenumber,
 row_number() over (partition by salesrepemployeenumber order by orderdate) as repordernumber
 
 
from orders t1 
join customers t2
on t1.customernumber = t2.customernumber
join employees t3
 on t2.salesrepemployeenumber = t3.employeeNumber