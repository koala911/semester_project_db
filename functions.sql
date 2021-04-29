CREATE OR REPLACE FUNCTION SumOfOrder (id_ord int)
RETURNS BIGINT
AS $BODY$
  BEGIN
    IF (id_ord NOT IN (SELECT id_order FROM Orders))
    THEN RAISE EXCEPTION 'Несуществующий номер заказа %', id_ord
      USING HINT = 'Проверьте номер заказа';
    ELSE
    RETURN (SELECT SUM(price)
      FROM Orders
        INNER JOIN DishInOrder ON Orders.id_order = DishInOrder.id_order
        INNER JOIN Dishes on DishInOrder.id_dish = Dishes.id_dish
      WHERE Orders.id_order = id_ord);
    END IF;
  END;
  $BODY$
LANGUAGE plpgsql;

CREATE TYPE client_data AS (name VARCHAR(25), id_client INT, orders BIGINT);

CREATE OR REPLACE FUNCTION MostFrequentClient (date_ date)
RETURNS Table(name VARCHAR(25), id_client INT, orders BIGINT)
AS $BODY$
  BEGIN
    IF date_ > CURRENT_DATE THEN
      RAISE EXCEPTION 'Несуществующая дата %', date_
        USING HINT = 'Проверьте корректность даты';
    ELSE
      RETURN QUERY (
        WITH Last_orders AS (
          SELECT *
          FROM Orders
          WHERE date >= date_
          ),
          Count_orders AS (
            SELECT id_client, COUNT(id_order) AS c
            FROM Last_orders
            GROUP BY id_client
            ),
          Numbered_counts AS (
            SELECT id_client, row_number() OVER (ORDER BY c) AS number, c
            FROM Count_orders
            )
          SELECT Client.client_name, Client.id_client, Numbered_counts.c
          FROM Client
                 INNER JOIN Numbered_counts on Numbered_counts.id_client = Client.id_client
          WHERE number = 1
      );
      END IF;
  END;
  $BODY$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION TriggerInsertIntoEmployeesUpdate ()
RETURNS TRIGGER
AS $BODY$
  BEGIN
    INSERT INTO EmployeeUpdate (id_emp, update_date, new_salary, new_dep) VALUES (NEW.id_emp, CURRENT_DATE, NEW.salary, NEW.id_dep);
    RETURN NEW;
  END;
  $BODY$
LANGUAGE plpgsql;

CREATE TRIGGER EmployeeUpdateTrigger
  AFTER UPDATE OR INSERT ON Employees
  FOR EACH ROW
  EXECUTE PROCEDURE TriggerInsertIntoEmployeesUpdate();
