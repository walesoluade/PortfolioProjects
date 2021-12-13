-- (1) write a query that outputs the title, fullname (firstname & lastname), Modifielddate where firstname starts with D and last name starts with R or M ordering by businessEntityID
select
Title, FirstName + ' ' + LastName As FullName, ModifiedDate
FROM Person.person
WHERE FirstName LIKE 'd%' AND ( LastName LIKE 'r%' OR LastName LIKE 'm%')
ORDER BY BusinessEntityID
-- (2) Select all columns from Person.Person Where BusinessEntityId is between 120 and 350
select*
from Person.Person
WHERE BusinessEntityID BETWEEN 120 and 350
-- (3) Select all columns from Person.Person whose FirstName has a second letter of o
select*
from Person.Person
WHERE FirstName like '_o%'
-- (4) Select BusinessEntityId, FirstName, LastName from Person.Person for people who have no EmailPromotion(0) and have a ModifiedDate year of 2013
select
BusinessEntityID, FirstName, LastName 
FROM Person.person
WHERE EmailPromotion = 0 AND YEAR(ModifiedDate) = 2013
/*(5) From the Purchasing.PurchaseOrderDetail table, Write a query to filter out purchases where what was received was less than what was ordered
and the amount to be refunded. The query should have the following Columns: PurchaseOrderDetailId, OrderQty, UnitPrice, ReceivedQty, RefundAmount */
select
PurchaseOrderDetailID, OrderQty, UnitPrice, ReceivedQty, (OrderQty - ReceivedQty) * UnitPrice AS RefundAmount
from Purchasing.PurchaseOrderDetail
WHERE ReceivedQty < OrderQty