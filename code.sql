-- Table: Client
CREATE TABLE Client (
    id_client int NOT NULL,
    client_name varchar(25) NOT NULL,
    tel varchar(10) NOT NULL,
    CONSTRAINT Client_pk PRIMARY KEY (id_client),
    CONSTRAINT CHK_Client CHECK (id_client > 0 and tel not like '%[^0-9]%')
);

-- Table: Departments
CREATE TABLE Departments (
    id_dep int NOT NULL,
    dep_name varchar(25) NOT NULL,
    CONSTRAINT Departments_pk PRIMARY KEY (id_dep),
    CONSTRAINT CHK_Department CHECK (id_dep > 0)
);

-- Table: Dishes
CREATE TABLE Dishes (
    id_dish int NOT NULL,
    dish_name varchar(20) NOT NULL,
    price int NOT NULL,
    type varchar(15) NOT NULL,
    CONSTRAINT Dishes_pk PRIMARY KEY (id_dish),
    CONSTRAINT CHK_Dishes CHECK (id_dish > 0 and price > 0)
);

-- Table: Restaraunts
CREATE TABLE Restaraunts (
    id_rest int NOT NULL,
    adress varchar(80) NOT NULL,
    tel varchar(10) NOT NULL,
    site varchar(25) NOT NULL,
    CONSTRAINT Restaraunts_pk PRIMARY KEY (id_rest),
    CONSTRAINT CHK_Restaraunts CHECK (id_rest > 0 and tel not like '%[^0-9]%')
);

-- Table: employees
CREATE TABLE employees (
    id_emp int NOT NULL,
    id_rest int NOT NULL,
    id_dep int NOT NULL,
    emp_name varchar(25) NOT NULL,
    salary int NOT NULL,
    tel varchar(10) NOT NULL,
    experience int NOT NULL,
    CONSTRAINT employees_pk PRIMARY KEY (id_emp),
    CONSTRAINT Restaraunts_employees FOREIGN KEY (id_rest)
    REFERENCES Restaraunts (id_rest),
    CONSTRAINT employees_Departments FOREIGN KEY (id_dep)
    REFERENCES Departments (id_dep),
    CONSTRAINT CHK_employees CHECK (id_emp > 0 and salary > 10000 and tel not like '%[^0-9]%'
                                      and experience >= 0)
);

-- Table: Ord
CREATE TABLE Ord (
    id_order int NOT NULL,
    id_rest int NOT NULL,
    id_client int NOT NULL,
    id_emp int NOT NULL,
    date date NOT NULL,
    time time NOT NULL,
    CONSTRAINT id_order PRIMARY KEY (id_order),
    CONSTRAINT Order_Client FOREIGN KEY (id_client)
    REFERENCES Client (id_client),
    CONSTRAINT Order_Restaraunts FOREIGN KEY (id_rest)
    REFERENCES Restaraunts (id_rest),
    CONSTRAINT Order_employees FOREIGN KEY (id_emp)
    REFERENCES employees (id_emp),
    CONSTRAINT CHK_Ord CHECK (id_order > 0)
);

-- Table: Dish_in_order
CREATE TABLE Dish_in_order (
    id_dish int NOT NULL,
    id_order int NOT NULL,
    CONSTRAINT Dish_in_order_Dishes FOREIGN KEY (id_dish)
    REFERENCES Dishes (id_dish),
    CONSTRAINT Dish_in_order_Order FOREIGN KEY (id_order)
    REFERENCES Ord (id_order)
);

-- Table: Payment
CREATE TABLE Payment (
    id_order int NOT NULL,
    id_client int NOT NULL,
    payment_date date NOT NULL,
    payment_time time NOT NULL,
    type varchar(10) NOT NULL,
    CONSTRAINT Payment_pk PRIMARY KEY (id_order, id_client),
    CONSTRAINT Payment_Client FOREIGN KEY (id_client)
    REFERENCES Client (id_client),
    CONSTRAINT Payment_Order FOREIGN KEY (id_order)
    REFERENCES Ord (id_order)
);

-- Table: employee_update
CREATE TABLE employee_update (
    id_emp int NOT NULL,
    update_date date NOT NULL,
    new_salary int NOT NULL,
    new_dep int NOT NULL,
    CONSTRAINT employee_update_pk PRIMARY KEY (id_emp, update_date),
    CONSTRAINT employee_update_Departments FOREIGN KEY (new_dep)
    REFERENCES Departments (id_dep),
    CONSTRAINT employee_update_employees FOREIGN KEY (id_emp)
    REFERENCES employees (id_emp),
    CONSTRAINT CHK_employee_update CHECK (new_salary > 10000)
);

INSERT INTO Restaraunts (id_rest, adress, tel, site) VALUES (1, 'Pervomayskaya, 32k2', '9851234567', 'www.rest1.ru');
INSERT INTO Restaraunts (id_rest, adress, tel, site) VALUES (2, 'Institutsky per., 9', '9876543210', 'www.rest2.ru');
INSERT INTO Restaraunts (id_rest, adress, tel, site) VALUES (3, 'Pervomayskaya, 42', '9857654321', 'www.rest3.ru');
INSERT INTO Restaraunts (id_rest, adress, tel, site) VALUES (4, 'Sovetskaya, 9', '9996547813', 'www.rest4.ru');
INSERT INTO Restaraunts (id_rest, adress, tel, site) VALUES (5, 'Pavlova, 6', '9884537653', 'www.rest5.ru');

INSERT INTO Departments (id_dep, dep_name) VALUES (1, 'Manager');
INSERT INTO Departments (id_dep, dep_name) VALUES (2, 'Waiter');
INSERT INTO Departments (id_dep, dep_name) VALUES (3, 'Director');
INSERT INTO Departments (id_dep, dep_name) VALUES (4, 'Security');
INSERT INTO Departments (id_dep, dep_name) VALUES (5, 'Cleaner');
INSERT INTO Departments (id_dep, dep_name) VALUES (6, 'Cook');
INSERT INTO Departments (id_dep, dep_name) VALUES (7, 'Chef');

INSERT INTO Dishes (id_dish, dish_name, price, type) VALUES (1, 'Steak', '1000', 'Usual');
INSERT INTO Dishes (id_dish, dish_name, price, type) VALUES (2, 'Pizza', '500', 'Spicy');
INSERT INTO Dishes (id_dish, dish_name, price, type) VALUES (3, 'Soup', '300', 'Vegetarian');
INSERT INTO Dishes (id_dish, dish_name, price, type) VALUES (4, 'Fish steak', '800', 'Usual');
INSERT INTO Dishes (id_dish, dish_name, price, type) VALUES (5, 'Lobster', '1500', 'Usual');
INSERT INTO Dishes (id_dish, dish_name, price, type) VALUES (6, 'Barbecue', '500', 'Spicy');
INSERT INTO Dishes (id_dish, dish_name, price, type) VALUES (7, 'Wine', '1000', 'Alcohol');

INSERT INTO Client (id_client, client_name, tel) VALUES (1, 'Ivan Petrov', '9991111134');
INSERT INTO Client (id_client, client_name, tel) VALUES (2, 'Nikita Ivanov', '9791756344');
INSERT INTO Client (id_client, client_name, tel) VALUES (3, 'Alexey Zakharenkov', '9951119432');
INSERT INTO Client (id_client, client_name, tel) VALUES (4, 'Danil Romanov', '9871876544');
INSERT INTO Client (id_client, client_name, tel) VALUES (5, 'Inna Putilova', '9561671184');

INSERT INTO employees (id_emp, id_rest, id_dep, emp_name, salary, tel, experience) VALUES (1, 1, 1, 'Danil Garkin', 70000, '9768765434', 3);
INSERT INTO employees (id_emp, id_rest, id_dep, emp_name, salary, tel, experience) VALUES (2, 1, 2, 'Mikhail Katkov', 30000, '9768098434', 0);
INSERT INTO employees (id_emp, id_rest, id_dep, emp_name, salary, tel, experience) VALUES (3, 2, 5, 'Anton Kulyamin', 15000, '9723454734', 0);
INSERT INTO employees (id_emp, id_rest, id_dep, emp_name, salary, tel, experience) VALUES (4, 3, 6, 'Sergey Bogdanov', 25000, '9768724111', 0);
INSERT INTO employees (id_emp, id_rest, id_dep, emp_name, salary, tel, experience) VALUES (5, 2, 7, 'Danil Pismensky', 100000, '9118098434', 8);
INSERT INTO employees (id_emp, id_rest, id_dep, emp_name, salary, tel, experience) VALUES (6, 3, 4, 'Evgeny Nepryahin', 35000, '9674800934', 1);
INSERT INTO employees (id_emp, id_rest, id_dep, emp_name, salary, tel, experience) VALUES (7, 4, 3, 'Eduard Nikolaenko', 150000, '9671488228', 5);
INSERT INTO employees (id_emp, id_rest, id_dep, emp_name, salary, tel, experience) VALUES (8, 4, 1, 'Darya Mitskaya', 50000, '9677878258', 3);
INSERT INTO employees (id_emp, id_rest, id_dep, emp_name, salary, tel, experience) VALUES (9, 5, 5, 'Sofiya Samohina', 15000, '9622768168', 5);
INSERT INTO employees (id_emp, id_rest, id_dep, emp_name, salary, tel, experience) VALUES (10, 5, 2, 'Alexandr Kulinich', 30000, '9683569978', 0);

INSERT INTO employee_update (id_emp, update_date, new_salary, new_dep) VALUES (1, '2019-04-19', 70000, 1);
INSERT INTO employee_update (id_emp, update_date, new_salary, new_dep) VALUES (2, '2019-04-19', 30000, 2);
INSERT INTO employee_update (id_emp, update_date, new_salary, new_dep) VALUES (3, '2019-04-19', 15000, 5);
INSERT INTO employee_update (id_emp, update_date, new_salary, new_dep) VALUES (4, '2019-04-19', 25000, 6);
INSERT INTO employee_update (id_emp, update_date, new_salary, new_dep) VALUES (5, '2019-04-19', 100000, 7);
INSERT INTO employee_update (id_emp, update_date, new_salary, new_dep) VALUES (6, '2019-04-19', 35000, 4);
INSERT INTO employee_update (id_emp, update_date, new_salary, new_dep) VALUES (7, '2019-04-19', 150000, 3);
INSERT INTO employee_update (id_emp, update_date, new_salary, new_dep) VALUES (8, '2019-04-19', 50000, 1);
INSERT INTO employee_update (id_emp, update_date, new_salary, new_dep) VALUES (9, '2019-04-19', 15000, 5);
INSERT INTO employee_update (id_emp, update_date, new_salary, new_dep) VALUES (10, '2019-04-19', 30000, 2);

INSERT INTO Ord (id_order, id_rest, id_client, id_emp, date, time) VALUES (1, 1, 2, 2, '2019-04-20', '19:34:04');
INSERT INTO Ord (id_order, id_rest, id_client, id_emp, date, time) VALUES (2, 5, 4, 10, '2019-04-20', '22:31:25');
INSERT INTO Ord (id_order, id_rest, id_client, id_emp, date, time) VALUES (3, 4, 1, 8, '2019-04-20', '22:31:25');

INSERT INTO Dish_in_order (id_dish, id_order) VALUES (1, 1);
INSERT INTO Dish_in_order (id_dish, id_order) VALUES (7, 1);
INSERT INTO Dish_in_order (id_dish, id_order) VALUES (4, 1);
INSERT INTO Dish_in_order (id_dish, id_order) VALUES (2, 2);
INSERT INTO Dish_in_order (id_dish, id_order) VALUES (6, 2);
INSERT INTO Dish_in_order (id_dish, id_order) VALUES (1, 1);
INSERT INTO Dish_in_order (id_dish, id_order) VALUES (7, 1);
INSERT INTO Dish_in_order (id_dish, id_order) VALUES (3, 3);
INSERT INTO Dish_in_order (id_dish, id_order) VALUES (5, 3);
INSERT INTO Dish_in_order (id_dish, id_order) VALUES (4, 3);

INSERT INTO Payment (id_order, id_client, payment_date, payment_time, type) VALUES (1, 2, '2019-04-20', '22:44:09', 'Card');
INSERT INTO Payment (id_order, id_client, payment_date, payment_time, type) VALUES (2, 4, '2019-04-21', '00:28:42', 'Card');
INSERT INTO Payment (id_order, id_client, payment_date, payment_time, type) VALUES (3, 1, '2019-04-21', '00:54:39', 'Card');

--Average salary in 1, 4 and 5 restaurants
SELECT AVG(salary)
FROM employees
WHERE id_rest in (1, 4, 5);

--Clients with orders over 3000
SELECT client_name, all_price
FROM Client INNER JOIN Payment on Client.id_client = Payment.id_client
INNER JOIN (
    SELECT Ord.id_order, SUM(Dishes.price) as all_price
    FROM Ord
        INNER JOIN Dish_in_order on Ord.id_order = Dish_in_order.id_order
        INNER JOIN Dishes on Dish_in_order.id_dish = Dishes.id_dish
    GROUP BY Ord.id_order
    HAVING SUM(Dishes.price) > 3000
) AS Orders on Orders.id_order = Payment.id_order;

--Max salary
SELECT emp_name, salary
FROM employees
WHERE employees.salary in (
  SELECT MAX(salary)
  FROM employees
    );


CREATE VIEW Sum_of_clients_order AS (
    WITH Sum_of_order AS (
        SELECT Ord.id_order as id_ord, SUM(Dishes.price) as s
        FROM Ord
                 INNER JOIN Dish_in_order on Ord.id_order = Dish_in_order.id_order
                 INNER JOIN Dishes on Dish_in_order.id_dish = Dishes.id_dish
        GROUP BY Ord.id_order
        )
        SELECT Client.client_name, Sum_of_order.s
        FROM Client
            INNER JOIN Ord ON Client.id_client = Ord.id_client
            INNER JOIN Sum_of_order ON Sum_of_order.id_ord = Ord.id_order
);

CREATE VIEW Average_salary_by_departments AS (
  SELECT emp_name AS Name, salary, round((AVG(salary) OVER (PARTITION BY id_dep)), 2) as Average_salary, round((salary / AVG(salary) OVER (PARTITION BY id_dep)) * 100, 2) as Regarding_other
  FROM employees
);

CREATE OR REPLACE FUNCTION Sum_of_order (id_ord int)
RETURNS BIGINT
AS $BODY$
  BEGIN
    IF (id_ord NOT IN (SELECT id_order FROM Ord))
    THEN RAISE EXCEPTION 'Несуществующий номер заказа %', id_ord
      USING HINT = 'Проверьте номер заказа';
    ELSE
    RETURN (SELECT SUM(price)
      FROM Ord
        INNER JOIN Dish_in_order ON Ord.id_order = Dish_in_order.id_order
        INNER JOIN Dishes on Dish_in_order.id_dish = Dishes.id_dish
      WHERE Ord.id_order = id_ord);
    END IF;
  END;
  $BODY$
LANGUAGE plpgsql;

CREATE TYPE client_data AS (name VARCHAR(25), id_cl INT, orders BIGINT);

CREATE OR REPLACE FUNCTION Most_frequent_client (d date)
RETURNS Table(name VARCHAR(25), id_cl INT, orders BIGINT)
AS $BODY$
  BEGIN
    IF d > CURRENT_DATE THEN
      RAISE EXCEPTION 'Несуществующая дата %', d
        USING HINT = 'Проверьте корректность даты';
    ELSE
      RETURN QUERY (
        WITH Last_orders AS (
          SELECT *
          FROM Ord
          WHERE date >= d
          ),
          Count_orders AS (
            SELECT id_client, COUNT(id_order) AS c
            FROM Last_orders
            GROUP BY id_client
            ),
          Numbered_counts AS (
            SELECT id_client, row_number() OVER (ORDER BY c) AS r, c
            FROM Count_orders
            )
          SELECT Client.client_name, Client.id_client, Numbered_counts.c
          FROM Client
                 INNER JOIN Numbered_counts on Numbered_counts.id_client = Client.id_client
          WHERE r = 1
      );
      END IF;
  END;
  $BODY$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION trigger_insert_into_employees_update ()
RETURNS TRIGGER
AS $BODY$
  BEGIN
    INSERT INTO employee_update (id_emp, update_date, new_salary, new_dep) VALUES (NEW.id_emp, CURRENT_DATE, NEW.salary, NEW.id_dep);
    RETURN NEW;
  END;
  $BODY$
LANGUAGE plpgsql;

CREATE TRIGGER Emp_update
  AFTER UPDATE OR INSERT ON employees
  FOR EACH ROW
  EXECUTE PROCEDURE trigger_insert_into_employees_update();

CREATE ROLE Director;

CREATE ROLE Manager;

CREATE ROLE Chef;

GRANT SELECT
ON Restaraunts
TO Director;

GRANT SELECT, INSERT, UPDATE
ON employees
TO Director;

GRANT SELECT
ON employees
TO Manager;

GRANT SELECT, INSERT, UPDATE
ON Ord
TO Manager;

GRANT SELECT, INSERT, UPDATE
ON Dish_in_order
TO Manager;

GRANT SELECT, UPDATE, INSERT
ON Dishes
TO Chef;

