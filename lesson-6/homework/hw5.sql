CREATE TABLE InputTbl (
    col1 VARCHAR(10),
    col2 VARCHAR(10)
);
    INSERT INTO InputTbl (col1, col2) VALUES 
('a', 'b'),
('a', 'b'),
('b', 'a'),
('c', 'd'),
('c', 'd'),
('m', 'n'),
('n', 'm');
--1-usul
SELECT distinct --Yakuniy natijada takroriy satrlar olib tashlanadi.
    CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS col1, --Bu ustunda kichik qiymat (alfavit bo‘yicha yoki son bo‘lsa son bo‘yicha) chap tomonga chiqadi.
    CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS col2 --Bu ustunda esa katta qiymat o‘ng tomonga chiqadi.
FROM InputTbl;
--2-usul
Select distinct
IIF(col1<col2, col1,col2)  as col1,
IIF(col1<col2, col2,col1)  as col2 from InputTbl
CREATE TABLE TestMultipleZero (
    A INT NULL,
    B INT NULL,
    C INT NULL,
    D INT NULL
);

INSERT INTO TestMultipleZero(A,B,C,D)
VALUES 
    (0,0,0,1),
    (0,0,1,0),
    (0,1,0,0),
    (1,0,0,0),
    (0,0,0,0),
    (1,1,1,0);
	--1-usul
	select*from TestMultipleZero
	where A+B+C+D<>0
	--2-usul
	Select*from TestMultipleZero
	where A<>0 or B<>0 or C<>0 or D<>0
	--3usul
	Select*from TestMultipleZero
	where not (A=0 and b=0 and c=0 and d=0)
	create table section1(id int, name varchar(20))
insert into section1 values (1, 'Been'),
       (2, 'Roma'),
       (3, 'Steven'),
       (4, 'Paulo'),
       (5, 'Genryh'),
       (6, 'Bruno'),
       (7, 'Fred'),
       (8, 'Andro')
	   select*from section1
	   where (id%2=1)
	   select top 1 *from section1
	   order by id
	    select top 1 *from section1
	   order by id desc
	   select*from section1
	   where name like 'b%'
	   CREATE TABLE ProductCodes (
    Code VARCHAR(20)
);

INSERT INTO ProductCodes (Code) VALUES
('X-123'),
('X_456'),
('X#789'),
('X-001'),
('X%202'),
('X_ABC'),
('X#DEF'),
('X-999');
Select*from ProductCodes
where Code like '%\_%' escape '\' --Oddiy _ belgisini qidirish uchun ESCAPE ishlatiladi
