--EASY
1.In SQL Server, BULK INSERT is a Transact-SQL (T-SQL) command used to quickly load large amounts of data from a text file (like .txt or .csv) into a SQL Server table.
It’s much faster than inserting rows one by one with INSERT INTO, because it uses optimized bulk operations.
2.CSV -(Comma-Separated Values). Most common format for bulk data transfer.
TXT (Plain Text / Delimited Text). Fields separated by tabs, pipes (|), or other custom delimiters.
XML (Extensible Markup Language). Semi-structured data format, can be imported using OPENXML or BULK INSERT with XML.
JSON (JavaScript Object Notation). Widely used for APIs and modern applications. SQL Server 2016+ has built-in support with OPENJSON.
create database Hometask3
use Hometask3
create table Products(
ProductID int primary key,
ProductName Varchar(50),
Price decimal(10,2)
)
insert into Products(
ProductID, ProductName, Price)
values (1,'Laptop', 2000), (2,'Mouse',80),(3,'Monitor',150)
--NULL means no value / unknown / missing data. It is not equal to 0, not equal to an empty string (‘ ’), and not equal to false.
--NOT NULL means a value must always be provided for that column. You cannot insert a row without giving a value for it.
alter table Products
add constraint UQ_ProductName unique (ProductName)
--Unique Constraint qo'shish bizga ProductName ustunidagi qiymatlar takrorlanmasligini ta'minlab beradi
alter table Products
add CategoryID int 
select*from Products
create table Categories(
CategoryID int identity(1,1) primary key,
CategoryName varchar(50) unique );
-- identity avtomatik ravishda qatorlarga sonlardan iborat qiymat beradi(masalan 1,2,3), Yangi ma’lumot qo‘shilganda dasturchi ID qiymatini qo‘lda kiritishi shart emas.
Bulk insert Products
from 'C:\Users\WINDOWS 10\Downloads\products.csv'
with(
firstrow=2,
fieldterminator=',',
rowterminator='\n')
--primary key va unique ning asosiy farqlaridan biri bu primary key bitta jadvalda faqat bir marta ishlatiladi, unique esa bir necha marta ishlatilishi mumkin, yana bir farqi shundaki uniqu faqat 1 marta NULL qiymati qabul qilishi mumkin, Primary Key esa NULL qiymat qabul qilolmaydi
alter table Products
add constraint CheckPrice CHECK (Price>0)
alter table Products
add Stock int NOT NULL default 0
select ISNULL (Price, 0) as Price from Products
--foreign key constraint jadvallarni bir-biriga bog'lashni ta'minlaydi. U bir jadvaldagi ustun qiymatlarini boshqa jadvaldagi ustun qiymatlariga mos bo'lishini ta'minlaydi.
create table Employees(
EmpID int primary key,
EmpName varchar (50),
Email varchar (50) unique
)
-- Create parent table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
-- Create child table with FOREIGN KEY
CREATE TABLE Staff (
    Staff INT PRIMARY KEY,
    Name VARCHAR(50),
    DepartmentID INT,
    CONSTRAINT FK_Employees_Departments
        FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
