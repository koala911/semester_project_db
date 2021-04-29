-- Table: Client
CREATE TABLE Client (
    id_client int NOT NULL,
    client_name varchar(25) NOT NULL,
    tel varchar(10) NOT NULL,
    CONSTRAINT Client_PK PRIMARY KEY (id_client),
    CONSTRAINT CHK_Client CHECK (id_client > 0 and tel not like '%[^0-9]%')
);

-- Table: Departments
CREATE TABLE Departments (
    id_dep int NOT NULL,
    dep_name varchar(25) NOT NULL,
    CONSTRAINT Departments_PK PRIMARY KEY (id_dep),
    CONSTRAINT CHK_Department CHECK (id_dep > 0)
);

-- Table: Dishes
CREATE TABLE Dishes (
    id_dish int NOT NULL,
    dish_name varchar(20) NOT NULL,
    price int NOT NULL,
    type varchar(15) NOT NULL,
    CONSTRAINT Dishes_PK PRIMARY KEY (id_dish),
    CONSTRAINT CHK_Dishes CHECK (id_dish > 0 and price > 0)
);

-- Table: Restaurants
CREATE TABLE Restaurants (
    id_rest int NOT NULL,
    address varchar(80) NOT NULL,
    tel varchar(10) NOT NULL,
    site varchar(25) NOT NULL,
    CONSTRAINT Restaurants_PK PRIMARY KEY (id_rest),
    CONSTRAINT CHK_Restaurants CHECK (id_rest > 0 and tel not like '%[^0-9]%')
);

-- Table: Employees
CREATE TABLE Employees (
    id_emp int NOT NULL,
    id_rest int NOT NULL,
    id_dep int NOT NULL,
    emp_name varchar(25) NOT NULL,
    salary int NOT NULL,
    tel varchar(10) NOT NULL,
    experience int NOT NULL,
    CONSTRAINT Employees_PK PRIMARY KEY (id_emp),
    CONSTRAINT Restaurants_employees FOREIGN KEY (id_rest)
    REFERENCES Restaurants (id_rest),
    CONSTRAINT Employees_Departments FOREIGN KEY (id_dep)
    REFERENCES Departments (id_dep),
    CONSTRAINT CHK_employees CHECK (id_emp > 0 and salary > 10000 and tel not like '%[^0-9]%'
                                      and experience >= 0)
);

-- Table: Orders
CREATE TABLE Orders (
    id_order int NOT NULL,
    id_rest int NOT NULL,
    id_client int NOT NULL,
    id_emp int NOT NULL,
    date date NOT NULL,
    time time NOT NULL,
    CONSTRAINT id_order_PK PRIMARY KEY (id_order),
    CONSTRAINT Order_Client FOREIGN KEY (id_client)
    REFERENCES Client (id_client),
    CONSTRAINT Order_Restaurants FOREIGN KEY (id_rest)
    REFERENCES Restaurants (id_rest),
    CONSTRAINT Order_employees FOREIGN KEY (id_emp)
    REFERENCES employees (id_emp),
    CONSTRAINT CHK_Orders CHECK (id_order > 0)
);

-- Table: DishInOrder
CREATE TABLE DishInOrder (
    id_dish int NOT NULL,
    id_order int NOT NULL,
    CONSTRAINT DishInOrder_Dishes FOREIGN KEY (id_dish)
    REFERENCES Dishes (id_dish),
    CONSTRAINT DishInOrder_Order FOREIGN KEY (id_order)
    REFERENCES Orders (id_order)
);

-- Table: Payment
CREATE TABLE Payment (
    id_order int NOT NULL,
    id_client int NOT NULL,
    payment_date date NOT NULL,
    payment_time time NOT NULL,
    type varchar(10) NOT NULL,
    CONSTRAINT Payment_PK PRIMARY KEY (id_order, id_client),
    CONSTRAINT Payment_Client FOREIGN KEY (id_client)
    REFERENCES Client (id_client),
    CONSTRAINT Payment_Orderser FOREIGN KEY (id_order)
    REFERENCES Orders (id_order)
);

-- Table: EmployeeUpdate
CREATE TABLE EmployeeUpdate (
    id_emp int NOT NULL,
    update_date date NOT NULL,
    new_salary int NOT NULL,
    new_dep int NOT NULL,
    CONSTRAINT EmployeeUpdate_PK PRIMARY KEY (id_emp, update_date),
    CONSTRAINT EmployeeUpdate_Departments FOREIGN KEY (new_dep)
    REFERENCES Departments (id_dep),
    CONSTRAINT EmployeeUpdate_employees FOREIGN KEY (id_emp)
    REFERENCES employees (id_emp),
    CONSTRAINT CHK_EmployeeUpdate CHECK (new_salary > 10000)
);
