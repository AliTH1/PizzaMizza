CREATE DATABASE PizzaMizza
USE PizzaMizza



CREATE TABLE Categories(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(50)
)

CREATE TABLE Pizzas(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(50) UNIQUE,
Description NVARCHAR(MAX),
CategorieId INT FOREIGN KEY REFERENCES Categories(Id)
)

CREATE TABLE Images(
ID INT PRIMARY KEY IDENTITY,
Name NVARCHAR(20) UNIQUE,
PizzaId INT FOREIGN KEY REFERENCES Pizzas(Id)
)

CREATE TABLE Types(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(30),
Icon NVARCHAR(MAX)
)

CREATE TABLE PizzaTypes(
Id INT PRIMARY KEY IDENTITY,
PizzaId INT FOREIGN KEY REFERENCES Pizzas(Id),
TypeId INT FOREIGN KEY REFERENCES Types(Id)
)



CREATE TABLE Sizes(
Id INT PRIMARY KEY IDENTITY,
Size VARCHAR(20)UNIQUE,
SizeValue INT UNIQUE
)

CREATE TABLE Currencies(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(MAX)
)

CREATE TABLE Prices(
Id INT PRIMARY KEY IDENTITY,
Price INT,
PizzaId INT FOREIGN KEY REFERENCES Pizzas(Id),
SizeId INT FOREIGN KEY REFERENCES Sizes(Id),
CurrencyId INT FOREIGN KEY REFERENCES Currencies(Id)
)



CREATE TABLE Innergredients(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(50) UNIQUE
)

CREATE TABLE PizzaInnergredient(
Id INT PRIMARY KEY IDENTITY,
PizzaId INT FOREIGN KEY REFERENCES Pizzas(Id),
InnergredientId INT FOREIGN KEY REFERENCES Innergredients(Id)
)



INSERT INTO Categories
VALUES ('Neapolitan Pizza'),
('Chicago Pizza'),
('Sicilian Pizza')



INSERT INTO Pizzas(Name, Description, CategorieId)
VALUES('Margarita', 'Pizza Margherita tipik Neapolitan pizzasıdır', 1),
('Vegetarian', 'Pizza for vegetarian', 1),

('Salami', 'Salami Pizza, adından da göründüyü kimi, üstü ilə doldurulur
dünyada bir neçə vegetarian olmayanlar tərəfindən sevilən bir neçə salam dilimləri', 2),
('Texas', 'Barbekü sousu, brisket və pepperoncini bunu TEXAS üslubunda pizza edir', 2),

('Mexican','Mexican Pizza 1980-ci illərdə yaradılmışdır. Doldurulmuş iki tortilladan ibarətdir
mal əti və qızardılmış lobya və üzərinə pomidor sousu, pendir və doğranmış pomidor', 3),
('Deluxe', 'Ət və tərəvəzin ətirli qarışığı, bu klassik piroq olacaq
pizza gecəsi üçün getdiyiniz yer', 3)


INSERT INTO Types
VALUES ('Quick Tomato Pizzas'), ('Four Cheese Pizza'),
('Tandoori Paneer Pizza')


INSERT INTO PizzaTypes(PizzaId, TypeId)
VALUES(1, 3), (2, 1), (3, 2), (4, 1), (5, 3), (6, 2)




INSERT INTO Sizes
VALUES ('Kiçik', 25), ('Orta', 30), ('Böyük', 35)

INSERT INTO Currencies
VALUES ('USD'), ('AZN')

INSERT INTO Prices(Price, PizzaId)
VALUES(8, 1), (12, 2), (5, 3)


INSERT INTO Innergredients
VALUES('Ispanaq'), ('Salyami kolbasası'), ('Halapenyo bibəri'),
('Gouda pendiri'), ('Göbələk')

INSERT INTO PizzaInnergredient(PizzaId, InnergredientId)
VALUES(1, 1), (2, 2), (3, 3), (1, 4), (2, 5), (3, 1)

SELECT p.Id, p.Name, pt.TypeId, ps.Price
FROM Pizzas AS p
INNER JOIN PizzaTypes AS pt
ON p.Id = pt.PizzaId
INNER JOIN Prices AS ps
ON ps.PizzaId = p.Id

SELECT p.Id, p.Name, pt.TypeId, ps.Price
FROM Pizzas AS p
INNER JOIN PizzaTypes AS pt
ON p.Id = pt.PizzaId
INNER JOIN Prices AS ps
ON ps.PizzaId = p.Id





INNER JOIN Prices AS ps
