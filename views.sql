CREATE VIEW SumOfClientsOrder AS (
    WITH SumOfOrder AS (
        SELECT Orders.id_order as id_ord, SUM(Dishes.price) as s
        FROM Orders
                 INNER JOIN DishInOrder on Orders.id_order = DishInOrder.id_order
                 INNER JOIN Dishes on DishInOrder.id_dish = Dishes.id_dish
        GROUP BY Orders.id_order
    )
    SELECT Client.client_name, SumOfOrder.s
    FROM Client
        INNER JOIN Orders ON Client.id_client = Orders.id_client
        INNER JOIN SumOfOrder ON SumOfOrder.id_ord = Orders.id_order
);

CREATE VIEW AverageSalaryByDepartments AS (
  SELECT emp_name AS Name, salary, round((AVG(salary) OVER (PARTITION BY id_dep)), 2) as Average_salary, round((salary / AVG(salary) OVER (PARTITION BY id_dep)) * 100, 2) as Regarding_other
  FROM employees
);
