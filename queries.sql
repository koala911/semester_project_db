--Average salary in 1, 4 and 5 restaurants
SELECT AVG(salary)
FROM employees
WHERE id_rest in (1, 4, 5);

--Clients with orders over 3000
SELECT client_name, all_price
FROM Client INNER JOIN Payment on Client.id_client = Payment.id_client
INNER JOIN (
    SELECT Orders.id_order, SUM(Dishes.price) as all_price
    FROM Orders
        INNER JOIN DishInOrder on Orders.id_order = DishInOrder.id_order
        INNER JOIN Dishes on DishInOrder.id_dish = Dishes.id_dish
    GROUP BY Orders.id_order
    HAVING SUM(Dishes.price) > 3000
) AS OrdersWithBigSum ON OrdersWithBigSum.id_order = Payment.id_order;

--Max salary
SELECT emp_name, salary
FROM employees
WHERE employees.salary in (
    SELECT MAX(salary)
    FROM employees
);
