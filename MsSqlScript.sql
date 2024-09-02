/*
пример текста в скрипте:
SELECT <ТаблицаПродуктов>.Name, <ТаблицаКатегорий>.Name FROM <ТаблицаПродуктов>
LEFT JOIN <ТаблицаСоответствийПродуктовКатегориям> ON <ТаблицаПродуктов>.Id = <ТаблицаСоответствийПродуктовКатегориям>.ProductId
LEFT JOIN <ТаблицаКатегорий> on  <ТаблицаСоответствийПродуктовКатегориям>.CategoryId =<ТаблицаКатегорий>.Id;
*/

/*
Создаём таблицы
*/

CREATE TABLE Products (
	Id INT PRIMARY KEY,
	"Name" TEXT
);

CREATE TABLE Categories (
	Id INT PRIMARY KEY,
	"Name" TEXT
);

CREATE TABLE ProductCategories (
	ProductId INT FOREIGN KEY REFERENCES Products(Id),
	CategoryId INT FOREIGN KEY REFERENCES Categories(Id),
	PRIMARY KEY (ProductId, CategoryId)
);

/*
Заполняем таблицы тестовыми данными
*/

INSERT INTO Products
VALUES
	(1, 'Product 1 from category 1 and 3'),
	(2, 'Product 2 from category 2'),
	(3, 'Product 3 from category 3 and 2'),
	(4, 'Product 4 from category none'),
	(5, 'Product 5 from category 3'),
	(6, 'Product 6 from category none');

INSERT INTO Categories
VALUES
	(1, 'Category 1'),
	(2, 'Category 2'),
	(3, 'Category 3');

INSERT INTO ProductCategories
VALUES
	(1, 1),
	(1, 3),
	(2, 2),
	(3, 3),
	(3, 2),
	(5, 3);


/*
Сам скрипт для применения на готовых таблицах
*/

select Products.Name, Categories.Name from Products
left join ProductCategories on Products.Id = ProductCategories.ProductId
left join Categories on ProductCategories.CategoryId = Categories.Id;
