-- Create Database
CREATE DATABASE COMPANY;

USE COMPANY;

-- Create Tables
CREATE TABLE EMPLOYEE (
    Fname VARCHAR(30),
    Minit CHAR(1),
    Lname VARCHAR(30),
    Ssn CHAR(9) PRIMARY KEY,
    Bdate DATE,
    Address VARCHAR(100),
    Sex CHAR(1),
    Salary DECIMAL(10, 2),
    Super_ssn CHAR(9),
    Dno INT
);

CREATE TABLE DEPARTMENT (
    Dname VARCHAR(30) UNIQUE,
    Dnumber INT PRIMARY KEY,
    Mgr_ssn CHAR(9) UNIQUE,
    Mgr_start_date DATE
);

CREATE TABLE DEPT_LOCATIONS (
    Dnumber INT,
    Dlocation VARCHAR(50),
    PRIMARY KEY (Dnumber, Dlocation)
);

CREATE TABLE PROJECT (
    Pname VARCHAR(30),
    Pnumber INT PRIMARY KEY,
    Plocation VARCHAR(50),
    Dnum INT
);

CREATE TABLE WORKS_ON (
    Essn CHAR(9),
    Pno INT,
    Hours DECIMAL(4, 2),
    PRIMARY KEY (Essn, Pno)
);

CREATE TABLE DEPENDENT (
    Essn CHAR(9),
    Dependent_name VARCHAR(30),
    Sex CHAR(1),
    Bdate DATE,
    Relationship VARCHAR(20),
    PRIMARY KEY (Essn, Dependent_name)
);

-- Insert Managers First (So they exist before being referenced)
INSERT INTO
    EMPLOYEE (
        Fname,
        Minit,
        Lname,
        Ssn,
        Bdate,
        Address,
        Sex,
        Salary,
        Super_ssn,
        Dno
    )
VALUES (
        'James',
        'E',
        'Borg',
        '888665555',
        '1937-11-10',
        '450 Stone, Houston, TX',
        'M',
        55000,
        NULL,
        1
    ),
    (
        'Jennifer',
        'S',
        'Wallace',
        '987654321',
        '1941-06-20',
        '291 Berry, Bellaire, TX',
        'F',
        43000,
        '888665555',
        4
    ),
    (
        'Franklin',
        'T',
        'Wong',
        '333445555',
        '1955-12-08',
        '638 Voss, Houston, TX',
        'M',
        40000,
        '888665555',
        5
    );

-- Insert Departments (Managers must already exist in EMPLOYEE)
INSERT INTO
    DEPARTMENT (
        Dname,
        Dnumber,
        Mgr_ssn,
        Mgr_start_date
    )
VALUES (
        'Headquarters',
        1,
        '888665555',
        '1981-06-19'
    ),
    (
        'Research',
        5,
        '333445555',
        '1988-05-22'
    ),
    (
        'Administration',
        4,
        '987654321',
        '1995-01-01'
    );

-- Insert Remaining Employees
INSERT INTO
    EMPLOYEE (
        Fname,
        Minit,
        Lname,
        Ssn,
        Bdate,
        Address,
        Sex,
        Salary,
        Super_ssn,
        Dno
    )
VALUES (
        'John',
        'B',
        'Smith',
        '123456789',
        '1965-01-09',
        '731 Fondren, Houston, TX',
        'M',
        30000,
        '333445555',
        5
    ),
    (
        'Ramesh',
        'K',
        'Narayan',
        '666884444',
        '1962-09-15',
        '975 Fire Oak, Humble, TX',
        'M',
        38000,
        '333445555',
        5
    ),
    (
        'Joyce',
        'A',
        'English',
        '453453453',
        '1972-07-31',
        '5631 Rice, Houston, TX',
        'F',
        25000,
        '333445555',
        5
    ),
    (
        'Alicia',
        'J',
        'Zelaya',
        '999887777',
        '1968-01-19',
        '3321 Castle, Spring, TX',
        'F',
        25000,
        '987654321',
        4
    ),
    (
        'Ahmad',
        'V',
        'Jabbar',
        '987987987',
        '1969-03-29',
        '980 Dallas, Houston, TX',
        'M',
        25000,
        '987654321',
        4
    );

-- Add Foreign Key Constraints
ALTER TABLE EMPLOYEE
ADD CONSTRAINT FK_EMPLOYEE_SUPERSSN FOREIGN KEY (Super_ssn) REFERENCES EMPLOYEE (Ssn) ON DELETE SET NULL,
ADD CONSTRAINT FK_EMPLOYEE_DNO FOREIGN KEY (Dno) REFERENCES DEPARTMENT (Dnumber);

ALTER TABLE DEPARTMENT
ADD CONSTRAINT FK_DEPARTMENT_MGRSSN FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE (Ssn) ON DELETE SET NULL;

ALTER TABLE DEPT_LOCATIONS
ADD CONSTRAINT FK_DEPT_LOCATIONS FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT (Dnumber) ON DELETE CASCADE;

ALTER TABLE PROJECT
ADD CONSTRAINT FK_PROJECT_DNUM FOREIGN KEY (Dnum) REFERENCES DEPARTMENT (Dnumber) ON DELETE CASCADE;

ALTER TABLE WORKS_ON
ADD CONSTRAINT FK_WORKS_ON_ESSN FOREIGN KEY (Essn) REFERENCES EMPLOYEE (Ssn) ON DELETE CASCADE,
ADD CONSTRAINT FK_WORKS_ON_PNO FOREIGN KEY (Pno) REFERENCES PROJECT (Pnumber) ON DELETE CASCADE;

ALTER TABLE DEPENDENT
ADD CONSTRAINT FK_DEPENDENT_ESSN FOREIGN KEY (Essn) REFERENCES EMPLOYEE (Ssn) ON DELETE CASCADE;

-- Insert Locations
INSERT INTO
    DEPT_LOCATIONS (Dnumber, Dlocation)
VALUES (1, 'Houston'),
    (4, 'Stafford'),
    (5, 'Bellaire'),
    (5, 'Sugarland'),
    (5, 'Houston');

-- Insert Projects
INSERT INTO
    PROJECT (
        Pname,
        Pnumber,
        Plocation,
        Dnum
    )
VALUES ('ProductX', 1, 'Bellaire', 5),
    ('ProductY', 2, 'Sugarland', 5),
    ('ProductZ', 3, 'Houston', 5),
    (
        'Computerization',
        10,
        'Stafford',
        4
    ),
    (
        'Reorganization',
        20,
        'Houston',
        1
    ),
    (
        'Newbenefits',
        30,
        'Stafford',
        4
    );

-- Insert Works On
INSERT INTO
    WORKS_ON (Essn, Pno, Hours)
VALUES ('123456789', 1, 32.5),
    ('123456789', 2, 7.5),
    ('666884444', 3, 40.0),
    ('453453453', 1, 20.0),
    ('453453453', 2, 20.0),
    ('333445555', 2, 10.0),
    ('333445555', 3, 10.0),
    ('333445555', 10, 10.0),
    ('333445555', 20, 10.0);

-- Insert Dependents
INSERT INTO
    DEPENDENT (
        Essn,
        Dependent_name,
        Sex,
        Bdate,
        Relationship
    )
VALUES (
        '333445555',
        'Alice',
        'F',
        '1986-04-05',
        'Daughter'
    ),
    (
        '333445555',
        'Theodore',
        'M',
        '1983-10-25',
        'Son'
    ),
    (
        '333445555',
        'Joy',
        'F',
        '1958-05-03',
        'Spouse'
    ),
    (
        '987654321',
        'Abner',
        'M',
        '1942-02-28',
        'Spouse'
    ),
    (
        '123456789',
        'Michael',
        'M',
        '1988-01-04',
        'Son'
    ),
    (
        '123456789',
        'Alice',
        'F',
        '1988-12-30',
        'Daughter'
    ),
    (
        '888665555',
        'Elizabeth',
        'F',
        '1967-05-05',
        'Spouse'
    );

-- Queries
-- 1. Get the birth date and address of the employee(s) whose name is ‘John B. Smith’
SELECT Bdate, Address
FROM EMPLOYEE
WHERE
    Fname = 'John'
    AND Minit = 'B'
    AND Lname = 'Smith';

-- 2. Retrieve the name and address of all employees who work for the ‘Research’ department
SELECT E.Fname, E.Lname, E.Address
FROM EMPLOYEE E
    JOIN DEPARTMENT D ON E.Dno = D.Dnumber
WHERE
    D.Dname = 'Research';

-- 3. List project number, controlling department number, and manager details for projects in ‘Stafford’
SELECT P.Pnumber, P.Dnum, E.Lname, E.Address, E.Bdate
FROM
    PROJECT P
    JOIN DEPARTMENT D ON P.Dnum = D.Dnumber
    JOIN EMPLOYEE E ON D.Mgr_ssn = E.Ssn
WHERE
    P.Plocation = 'Stafford';

-- 4. Retrieve employee’s first and last name
SELECT Fname, Lname FROM EMPLOYEE;