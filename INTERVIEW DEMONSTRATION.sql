CREATE TABLE employee_salary (
    employee_id INT,
    employee_name VARCHAR(50),
    department_id INT,
    employee_salary INT
);
INSERT INTO employee_salary (employee_id, employee_name, department_id, employee_salary) VALUES
(1, 'Rowan Shepherd', 1, 1000),
(2, 'Rimsha Melendez', 1, 900),
(3, 'Tiah Sanford', 1, 900),
(4, 'Cayden Mcclure', 1, 700),
(5, 'Ellena Dyer', 2, 1200),
(6, 'Marcus Knox', 2, 800),
(7, 'Tashan Dalby', 2, 700),
(8, 'Arif Sutherland', 2, 500);
WITH RankedSalaries AS (
    SELECT
        employee_id,
        employee_name,
        department_id,
        employee_salary,
        ROW_NUMBER() OVER (
            PARTITION BY department_id
            ORDER BY employee_salary DESC
        ) AS rank
    FROM employee_salary
)
SELECT
    employee_id,
    employee_name,
    department_id,
    employee_salary
FROM RankedSalaries
WHERE rank <= 3;