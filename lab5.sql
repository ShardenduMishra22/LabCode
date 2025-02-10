-- 1. List of all project numbers for projects involving an employee named ‘Smith’, either as a worker or as a department manager.
SELECT DISTINCT
    P.Pnumber
FROM
    PROJECT P
    JOIN DEPARTMENT D ON P.Dnum = D.Dnumber
    LEFT JOIN EMPLOYEE E ON D.Mgr_ssn = E.Ssn
    LEFT JOIN WORKS_ON W ON P.Pnumber = W.Pno
    LEFT JOIN EMPLOYEE E2 ON W.Essn = E2.Ssn
WHERE
    E.Lname = 'Smith'
    OR E2.Lname = 'Smith';

-- 2. Retrieve all employees whose address is in Houston, Texas.
SELECT * FROM EMPLOYEE WHERE Address LIKE '%Houston, TX%';

-- 3. Find all employees who were born during the 1950s.
SELECT *
FROM EMPLOYEE
WHERE
    Bdate BETWEEN '1950-01-01' AND '1959-12-31';

-- 4. Raise 10% salary of employees working on ‘ProductX’ and list the resulting salary along with their names.
SELECT E.Fname, E.Lname, E.Salary * 1.10 AS NewSalary
FROM
    EMPLOYEE E
    JOIN WORKS_ON W ON E.Ssn = W.Essn
    JOIN PROJECT P ON W.Pno = P.Pnumber
WHERE
    P.Pname = 'ProductX';

-- 5. Retrieve all employees in department 5 whose salary is between $30,000 and $40,000.
SELECT *
FROM EMPLOYEE
WHERE
    Dno = 5
    AND Salary BETWEEN 30000 AND 40000;

-- 6. Find the names of all employees who are directly supervised by ‘Franklin Wong’.
SELECT E.Fname, E.Lname
FROM EMPLOYEE E
    JOIN EMPLOYEE M ON E.Super_ssn = M.Ssn
WHERE
    M.Fname = 'Franklin'
    AND M.Lname = 'Wong';

-- 7. Retrieve the names of all employees in department 5 who work more than 10 hours per week on the ProductX project.
SELECT DISTINCT
    E.Fname,
    E.Lname
FROM
    EMPLOYEE E
    JOIN WORKS_ON W ON E.Ssn = W.Essn
    JOIN PROJECT P ON W.Pno = P.Pnumber
WHERE
    E.Dno = 5
    AND P.Pname = 'ProductX'
    AND W.Hours > 10;

-- 8. List the names of all employees who have a dependent with the same first name as themselves.
SELECT DISTINCT
    E.Fname,
    E.Lname
FROM EMPLOYEE E
    JOIN DEPENDENT D ON E.Ssn = D.Essn
WHERE
    E.Fname = D.Dependent_name;