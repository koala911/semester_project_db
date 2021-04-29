INSERT INTO Restaurants (id_rest, address, tel, site) VALUES (1, 'Pervomayskaya, 32k2', '9851234567', 'www.rest1.ru');
INSERT INTO Restaurants (id_rest, address, tel, site) VALUES (2, 'Institutsky per., 9', '9876543210', 'www.rest2.ru');
INSERT INTO Restaurants (id_rest, address, tel, site) VALUES (3, 'Pervomayskaya, 42', '9857654321', 'www.rest3.ru');
INSERT INTO Restaurants (id_rest, address, tel, site) VALUES (4, 'Sovetskaya, 9', '9996547813', 'www.rest4.ru');
INSERT INTO Restaurants (id_rest, address, tel, site) VALUES (5, 'Pavlova, 6', '9884537653', 'www.rest5.ru');

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

INSERT INTO EmployeeUpdate (id_emp, update_date, new_salary, new_dep) VALUES (1, '2019-04-19', 70000, 1);
INSERT INTO EmployeeUpdate (id_emp, update_date, new_salary, new_dep) VALUES (2, '2019-04-19', 30000, 2);
INSERT INTO EmployeeUpdate (id_emp, update_date, new_salary, new_dep) VALUES (3, '2019-04-19', 15000, 5);
INSERT INTO EmployeeUpdate (id_emp, update_date, new_salary, new_dep) VALUES (4, '2019-04-19', 25000, 6);
INSERT INTO EmployeeUpdate (id_emp, update_date, new_salary, new_dep) VALUES (5, '2019-04-19', 100000, 7);
INSERT INTO EmployeeUpdate (id_emp, update_date, new_salary, new_dep) VALUES (6, '2019-04-19', 35000, 4);
INSERT INTO EmployeeUpdate (id_emp, update_date, new_salary, new_dep) VALUES (7, '2019-04-19', 150000, 3);
INSERT INTO EmployeeUpdate (id_emp, update_date, new_salary, new_dep) VALUES (8, '2019-04-19', 50000, 1);
INSERT INTO EmployeeUpdate (id_emp, update_date, new_salary, new_dep) VALUES (9, '2019-04-19', 15000, 5);
INSERT INTO EmployeeUpdate (id_emp, update_date, new_salary, new_dep) VALUES (10, '2019-04-19', 30000, 2);

INSERT INTO Orders (id_order, id_rest, id_client, id_emp, date, time) VALUES (1, 1, 2, 2, '2019-04-20', '19:34:04');
INSERT INTO Orders (id_order, id_rest, id_client, id_emp, date, time) VALUES (2, 5, 4, 10, '2019-04-20', '22:31:25');
INSERT INTO Orders (id_order, id_rest, id_client, id_emp, date, time) VALUES (3, 4, 1, 8, '2019-04-20', '22:31:25');

INSERT INTO DishInOrder (id_dish, id_order) VALUES (1, 1);
INSERT INTO DishInOrder (id_dish, id_order) VALUES (7, 1);
INSERT INTO DishInOrder (id_dish, id_order) VALUES (4, 1);
INSERT INTO DishInOrder (id_dish, id_order) VALUES (2, 2);
INSERT INTO DishInOrder (id_dish, id_order) VALUES (6, 2);
INSERT INTO DishInOrder (id_dish, id_order) VALUES (1, 1);
INSERT INTO DishInOrder (id_dish, id_order) VALUES (7, 1);
INSERT INTO DishInOrder (id_dish, id_order) VALUES (3, 3);
INSERT INTO DishInOrder (id_dish, id_order) VALUES (5, 3);
INSERT INTO DishInOrder (id_dish, id_order) VALUES (4, 3);

INSERT INTO Payment (id_order, id_client, payment_date, payment_time, type) VALUES (1, 2, '2019-04-20', '22:44:09', 'Card');
INSERT INTO Payment (id_order, id_client, payment_date, payment_time, type) VALUES (2, 4, '2019-04-21', '00:28:42', 'Card');
INSERT INTO Payment (id_order, id_client, payment_date, payment_time, type) VALUES (3, 1, '2019-04-21', '00:54:39', 'Card');
