CREATE TABLE as_employees (
    employee_id NUMBER , -- Unique identifier for each employee
    first_name VARCHAR2(50),                            -- Employee's first name
    last_name VARCHAR2(50),                             -- Employee's last name
    phone VARCHAR2(15),                                 -- Employee's phone number
    email VARCHAR2(100),                                -- Employee's email address
    position VARCHAR2(50),                              -- Employee's position (e.g., mechanic, manager)
    hire_date DATE DEFAULT SYSDATE,                     -- Date when the employee was hired
    salary NUMBER,                                      -- Employee's salary
    PRIMARY KEY (employee_id)
);
