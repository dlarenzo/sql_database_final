------------------------------ CREATE DATABASE ------------------------------
-- CREATE DATA BASES
CREATE DATABASE test_final;
-- created database test_final need to create tables and insert data



------------------------------ CREATE TABLES ------------------------------
-- CREATE TABLES & INSERT DATA

CREATE TABLE university (
    student_id SERIAL PRIMARY KEY NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    major VARCHAR(255) NOT NULL,
    addresses VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

INSERT INTO university (first_name, last_name, major, address, city, country, email) 
VALUES 
('Whitney ', 'Hess', 'Music', '123 Fairylaine Dr', 'Lithuania', 'Germany','w.hess@email.com'),
('Alta  ', 'Kramer', 'Education', '712 Courtland Yard', 'Moreno Valley', 'USA', 'a.kramer@email.com'),
('Angelia ', 'Randolph', 'Business', '765 W 600 S', 'Prague', 'Italy', 'a.randolph@email.com'),
('Ida ', 'Carey', 'Construction', '92 Tooele Blvd', 'Tooele', 'USA'),
('Terrance ', 'Wilcox', 'Nursing Assistant', '203 Stanley Cup Lane', 'British Colombia', 'Canada'),
('Jerome ', 'Knapp', 'Practical Nursing', '408 Fairfax Rd', 'Prague', 'Italy'),
('Charlotte ', 'Anthony', 'Medical Assistant', '365 N 922 E', 'Bratvia', 'Finland'),
('Duane ', 'Galloway', 'Welding Technology', '143 Sapphire Lane', 'Tooele', 'USA'),
('Alvaro ', 'Griffith', 'Cosmetology', '634 Elm Street', 'Bratvia', 'Finland'),
('Cesar ', 'Roberts', 'Commercial Driving', '122 S Lamar Street', 'British Colombia', 'Canada'),
('Wenceslao ', 'Ornelas', 'Commercial Driving', '653 Storybrook St', 'Bletva', 'Denmark'),
('LaRenzo ', 'DeGraffenreidt', 'Software Development', '712 Hidden River Trail', 'Tooele', 'USA'),
('Jacqueline ', 'Pelaez', 'Music', '711 Privet Dr', 'Bletva', 'Denmark'),
('Xochitl ', 'Olguin', 'Business', '490 Weasley Way', 'Bletva', 'Denmark'),,
('Kasumi ', 'Kasumi', 'Construction', '789 Jedi Drive', 'British Colombia', 'Canada'),
('Katsuzo ', 'Yuki', 'Music', '328 S 520 W', 'Prague', 'Italy'),
('Chiharu ', 'Mitsui', 'Nursing Assistant', '234 Broadway ', 'British Colombia', 'Canada'),
('Endzhe ', 'Bykova', 'Practical Nursing', '930 N Broadway', 'Prague', 'Italy'),
('Bykova ', 'Fokin', 'Medical Assistant', '982 Royalty Rd', 'Bletva', 'Denmark', ''),
('Oleg ', 'Oleglov', 'Welding Technology', '75 Mobile Lane', 'Moreno Valley', 'USA', ''),
('Stacey ', 'Dunlop', 'Cosmetology', '559 Lincoln Street', 'Venice', 'Greece', ''),
('Dunlop ', 'Lacasse', 'Commercial Driver', '1024 Bleeker Street', 'Tooele', 'USA', ''),
('LaMasse ', 'Dagenais', 'Commercial Driver', '733 LaGasse ', 'Venice', 'Greece', ''),
('Marlene ', 'Pratt', 'Software Development', '998 DeGrassi', 'Prague', 'Italy', ''),
('Karla ', 'Alexander', 'Software Development', '55 High School Rd', 'Venice', 'Greece', ''),
('Jean-Paul ', 'Gosselin', 'Software Development', '987 Takashi Trail', 'British Colombia', 'Canada', 'jp.gosselin@email.com');

CREATE TABLE cool_wear_shop (
    product_id SERIAL PRIMARY KEY NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    product_description VARCHAR(255) NOT NULL,
    product_price DECIMAL(10, 2) NOT NULL,
    product_quantity INT NOT NULL
);

INSERT INTO cool_wear_shop (product_name, product_description, product_price, product_quantity)
VALUES
('hat', 'a cool hat to wear sporting the college logo', '7.99', 10000),
('shirt', 'a nice shirt sporting the college logo', '10.99', 10000),
('pants', 'a great pair of paints sporting the college logo', '17.99', 10000),
('sweater', 'a cool sweater sporting the college logo', '20.99', 10000),
('shorts', 'a nice comfy pair of shorts sporting the college logo', '13.99', 10000),
('polo', 'a dressy polo sporting the college logo', '15.99', 10000);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY NOT NULL,
    ordered_items TEXT NOT NULL,
    num_items INTEGER NOT NULL,
    order_cost DECIMAL(10, 2) NOT NULL,
    student_id INTEGER REFERENCES university(student_id)
);

INSERT INTO orders (ordered_items, num_items, order_cost, student_id)
VALUES
('1,5,6,', 3, '39.88', 1),
('6,4', 2, '37.25', 2),
('6,', 1, '6.99', 3),
('1', 1, '7.99', 4),
('4', 1, '20.99', 5),
('6,3,3', 3, '82.35', 6),
('5', 1, '13.99', 7),
('5,5,5', 3, '97.25', 8),
('1,3,5', 3, '45.50', 9),
('4,1,6', 3, '60.50', 10),
('2,2,5', 3, '55.99', 12),
('1,2,4', 3, '48.99', 13),
('4,4,2', 3, '75.33', 14),
('6,6,1,2,2,2', 6, '145.99', 15),
('1,1,1,1,1,1', 6, '45.68', 16),
('3,3,6,6,1', 5, '89.99', 17),
('3,3,3', 3, '60.50', 18),
('5,5,3,3,2', 5, '36.50', 19),
('1,3,4', 3, '55.99', 20),
('6,4,3', 3, '48.99', 21),
('6,4,4,5,3,2', 6, '285.67', 22),
('4,4,2', 3, '45.68', 24),
('6,4', 2, '89.99', 25),
('3,3,6,6,4,1,1,2', 8, '255.89',26);





------------------------------ AGGREGATES ------------------------------
-- SUM OF ORDER NUM_ITEMS
CREATE VIEW total_items AS
SELECT SUM(num_items) FROM orders

SELECT * FROM total_items;

-- AVERAGE ORDER COST
CREATE VIEW avg_order_cost AS
SELECT AVG(order_cost) FROM orders;

SELECT * FROM avg_order_cost

-- ORDER BY HIGHEST COSTING ORDER TO LOWEST COSTING ORDER
CREATE VIEW order_cost AS
SELECT order_id, order_cost FROM orders 
ORDER BY order_cost DESC;

SELECT * FROM order_cost;

------------------------------ JOINS ------------------------------
-- ALL ORDERS GOING TO USA STUDENTS
CREATE VIEW usa_orders AS
SELECT university.student_id, university.first_name, university.last_name, university.country, orders.order_id 
FROM orders
INNER JOIN university ON orders.student_id = university.student_id
WHERE university.country = 'United States';

SELECT * FROM usa_orders;

------------------------------ INSERT UPDATE AND DELETE ------------------------------
-- INSERT INTO UNIVERSITY TABLE

INSERT INTO university (student_id, first_name, last_name, major, addresses, city, country, email)
VALUES
('Whitney', 'Spears', 'Software Development', '1515 Willowbrook Trail', 'Tooele', 'United States', 's.spears@email.com');

SELECT * FROM university
WHERE first_name = 'Whitney'
AND last_name = 'Spears';


-- INSERT INTO ORDERS TABLE

INSERT INTO orders (ordered_items, num_items, order_cost, student_id)
VALUES
('1,5,6,2,2', 3, '39.88', 27);

SELECT * FROM orders
WHERE student_id = 27;

-- UPDATE UNIVERSITY TABLE

UPDATE university
SET major = 'Dance'
WHERE student_id = 27;

SELECT * FROM university
WHERE student_id = 27;

-- DELETE FROM UNIVERSITY TABLE 

DELETE FROM university
WHERE student_id = 27;

SELECT * FROM university
WHERE student_id = 27;


DELETE FROM orders
WHERE order_id = 25;

SELECT * FROM orders
WHERE order_id = 25;

