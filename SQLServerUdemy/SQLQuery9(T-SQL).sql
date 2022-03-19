use Northwind
--NORTHWIND VERÝ TABANI
--Northwind veeri tabaný sorgu ornekleri

select *from Products--urun

select *from Products where CategoryID=(select CategoryID from Categories where CategoryName='SeaFood')
and UnitsInStock>20 and SupplierID=(select SupplierID from Suppliers where city='Osaka')

create procedure TEST1
as
select *from Orders where EmployeeID in(select EmployeeID from Employees where City='London') and ShipVia=3
and ShipCountry='France'

exec TEST1

--NortWind Veri Tabani Birleþtrime Ýþlemleri
create view VIEW1
as
select OrderID,CompanyName,FirstName+' '+LastName as'Employee',OrderDate,ShipName,ShipCity,ShipCountry from Orders 
inner join  Employees on Orders.EmployeeID=Employees.EmployeeID
inner join Customers on Customers.CustomerID=Orders.CustomerID

select *from VIEW1

--T-SQL
--T-sql deðiþkenler
--degiþkenleri kullanmak icin declare kullanýlýr
Declare @sayi int--Declare @isim veri tipi
select @sayi

Declare @sayi int
set @sayi=24
select @sayi as 'sayi'

Declare @kisi1 varchar(20)
set @kisi1 ='Dilara'
select @kisi1 as 'Kisi'


Declare @sayi1 int ,@sayi2 int,@toplam int
set @sayi1=5 
set @sayi2=7
set @toplam=@sayi1+@sayi2
select @toplam as 'Toplam'



