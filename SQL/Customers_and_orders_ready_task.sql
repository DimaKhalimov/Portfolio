По данным таблиц необходимо написать запросы, которые будут выводить всю необходимую информацию.
Необходимо написать запросы, которые будут выводить следующую информацию:
1.	Вывести названия всех компаний, которые не выполнили заказ с 15.11.1996 – 18.02.1997 
2.	Вывести названия компаний поставщиков, которые находятся в México D.F.;
3.	Вывести только те заказы, которые были оформлены с 12.12.1996 по 18.02.1997;
4.	Вывести только тех заказчиков,  название компании которых начинаются с ‘An’;
5.	Вывести названия компаний и заказы, которые они оформили, с суммой заказа более 17000. Использовать соединение таблиц.
6.	Вывести следующие колонки: имя поставщика, сумма заказа. Результаты отсортировать по поставщикам в порядке убывания
7.	Вывести следующие колонки: имя поставщика, дата заказа. Вывести  таким образом, чтобы все заказчики из таблицы 1 были показаны в таблице результатов.

Создание таблицы Customers

CREATE TABLE Customers (
CustomerID VARCHAR(10),
CompanyName VARCHAR(50),
Address VARCHAR(50),
City VARCHAR(40),
Country VARCHAR(30))

Заполнение таблицы Customers

insert into Customers(Customerid, CompanyName, Address, City, Country)
values ('ALFKI', 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin', 'Germany')
insert into Customers(Customerid, CompanyName, Address, City, Country)
values ('ANATR', 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', 'Mexico')
insert into Customers(Customerid, CompanyName, Address, City, Country)
values ('ANTON', 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', 'Mexico')
insert into Customers(Customerid, CompanyName, Address, City, Country)
values ('AROUT', 'Around the Horn', '120 Hanover Sq.', 'London', 'UK')
insert into Customers(Customerid, CompanyName, Address, City, Country)
values ('BERGS', 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', 'Sweden')
insert into Customers(Customerid, CompanyName, Address, City, Country)
values ('BLAUS', 'Blauer See Delikatessen', 'Forsterstr. 57', 'MannheimCity', 'Germany')
insert into Customers(Customerid, CompanyName, Address, City, Country)
values ('BLONP', 'Blondesddsl père et fils', '24, place Kléber', 'StrasbourgCity', 'France')
insert into Customers(Customerid, CompanyName, Address, City, Country)values ('BOLID', 'Bólido Comidas preparadas', 'C/ Araquil, 67', 'MadridCity', 'Spain')

Создание таблицы Orders

CREATE TABLE Orders (
OrderID int,
CustomerID VARCHAR(10),
OrderDate date,
OrderSum int)

Заполнение таблицы Orders

insert into Orders(OrderID, CustomerID, OrderDate, OrderSum)
values (10355, 'AROUT', '15.11.1996', 10000)
insert into Orders(OrderID, CustomerID, OrderDate, OrderSum)
values (10365, 'ANTON', '27.11.1996', 15000)
insert into Orders(OrderID, CustomerID, OrderDate, OrderSum)
values (10381, 'LILAS', '12.12.1996', 20000)
insert into Orders(OrderID, CustomerID, OrderDate, OrderSum)
values (10436, 'BLONP', '05.02.1997', 17500)
insert into Orders(OrderID, CustomerID, OrderDate, OrderSum)
values (10442, 'ERNSH', '11.02.1997', 20000)
insert into Orders(OrderID, CustomerID, OrderDate, OrderSum)
values (10449, 'BLONP', '18.02.1997', 10000)
insert into Orders(OrderID, CustomerID, OrderDate, OrderSum)values (10453, 'AROUT', '21.02.1997', 15000)
Необходимо написать запросы, которые будут выводить следующую информацию:

1.	Вывести названия всех компаний, которые не выполнили заказ с 15.11.1996 – 18.02.1997
       select CompanyName
       from Customers JOIN Orders
       on 'CustomerID' = 'CustomerID'
       where OrderDate between '15.11.1996' and '18.02.1997'
       Select Customers.CompanyName
       from Customers
       join Orders on Customers.CustomerID=Orders.CustomerID
       where Orders.OrderDate>'15.11.1996' and
Orders.OrderDate<'18.02.1997'


2.	Вывести названия компаний поставщиков, которые находятся в México D.F.;
SELECT Customers.CompanyName,City
FROM Customers
WHERE City='México D.F.'

3.	Вывести только те заказы, которые были оформлены с 12.12.1996 по 18.02.1997;
       Select Customers.CompanyName, Orders.OrderDate
from Customers join Orders on Customers.CustomerID=Orders.CustomerID
where Orders.OrderDate>'12.12.1996 ' and Orders.OrderDate<'18.02.1997'
4.	Вывести только тех заказчиков,  название компании которых начинаются с ‘An’;
Select Customers.CompanyName
from Customers
where CompanyName like 'An%'
5.	Вывести названия компаний и заказы, которые они оформили, с суммой заказа более 17000. Использовать соединение таблиц.
select Customers.CompanyName,Address,City,Country,Orders.OrderSum
from Customers JOIN Orders
on Customers.CustomerID=Orders.CustomerID
where OrderSum > 17000
6.	Вывести следующие колонки: имя поставщика, сумма заказа. Результаты отсортировать по поставщикам в порядке убывания
select Customers.CompanyName,Orders.OrderSum
from Customers JOIN Orders
on Customers.CustomerID=Orders.CustomerID
Order By CompanyName desc
7.	Вывести следующие колонки: имя поставщика, дата заказа. Вывести  таким образом, чтобы все заказчики из таблицы 1 были показаны в таблице результатов.

select Customers.CompanyName,Orders.OrderDate
from Customers JOIN Orders
on Customers.CustomerID=Orders.CustomerID

