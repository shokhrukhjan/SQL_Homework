--Basic-level tasks
create database Homework2
use Homework2
create table Employees(
EmpID int,
Name varchar(50),
Salary decimal(10,2)
)
insert into Employees(EmpID, Name, Salary)
values
(1, 'James Milner', 9000)
insert into Employees (EmpID, Name, Salary)
values
(2,'Harry Kane', 7500),
(3, 'Jeck Grealish', 5000)
update Employees
set Salary=7000
where EmpID=1
delete from Employees
where EmpID=2
-- delete - jadvaldan qatorlarni shart asosida birma bir yoki shartsiz barcha qatorlarni o'chiradi, jadval strukturasi va ustunlar o'zgarishsiz qoladi
-- TRUNCATE - jadvaldagi barcha qatorlarni o'chiradi faqat struktura saqlanib qoladi. Where sharti ishlatilmaydi.
-- DROP - jadvalni butunlay (strukturani ham) o'chirib yuboradi.
alter table Employees
alter column Name varchar(100)
alter table Employees
add Department varchar(50)
alter table Employees
alter column Salary float
create table Departments(
DepartmentID INT PRIMARY KEY,
DepartmentName varchar(50)
)
truncate table Employees
--Intermediate-Level Tasks
insert into Departments( DepartmentID , DepartmentName )
values
(1,'accountant'),
(2, 'HR'),
(3, 'Adminstration'),
(4, 'IT'),
(5, 'Machinery Service')
select*from Departments

insert into Employees(EmpID,Name,Salary,Department)
values
(1,'Lamine',5000,'IT'),
(2,'Raphinha',8000,'Adminstration'),
(3,'Pedri',9000,'HR'),
(4,'Gavi',2000,'Accountant'),
(5,'Arauxo',1500,'Security')
update Employees
set Department='Management'
where Salary>5000
truncate table Employees
alter table Employees
drop column Department
exec sp_rename 'Employees' , 'Staff_Members';
drop table Departments
select*from Staff_Members

--Advanced-Level Tasks
create table Products (
ProductID int primary key,
Product_name varchar(30),
Category varchar(30),
Price decimal(10,2)
)
alter table Products
add constraint chk_Price check (Price>0)
 insert into Products(ProductID,Product_name,Category,Price)
 values
 (1,'Coca-Cola', 'Cold Drink', 12000)
 alter table Products
 add StockQuantity int default 50
exec sp_rename 'Products.Category', 'ProductCategory', 'column'
insert into Products(
ProductID, Product_Name,ProductCategory,Price)
values
(2,'snickers','sweets',8000)
insert into Products(
ProductID, Product_Name,ProductCategory,Price)
values
(3,'chips','snacks',12000)
insert into Products(
ProductID, Product_Name,ProductCategory,Price)
values
(4,'oil','foods',20000)
insert into Products(
ProductID, Product_Name,ProductCategory,Price)
values
(5,'bread','food',4000)
select*into Products_Backup from Products
exec sp_rename 'Products','Inventory'
ALTER TABLE Inventory
DROP CONSTRAINT chk_Price;
alter table Inventory
alter column Price float

create table NewInventory(
ProductID int identity(1000,5),
Product_name varchar(50),
ProductCategory varchar (50),
Price FLOAT,
StockQuantity int
)
insert into NewInventory (Product_Name,ProductCategory,Price,StockQuantity)
select Product_Name,ProductCategory,Price,StockQuantity from Inventory
drop table Inventory
exec sp_rename 'NewInventory', 'Inventory'


select*from Products_Backup
Select*from Inventory
