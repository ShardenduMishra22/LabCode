CREATE DATABASE UniversityDB;

USE UniversityDB;

CREATE TABLE Student (
    studentid INT PRIMARY KEY AUTO_INCREMENT,
    Department VARCHAR(50),
    Firstname VARCHAR(50),
    Lastname VARCHAR(50),
    DOB DATE
);

CREATE TABLE Course (
    courseid INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(50),
    Credits INT
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    studentid INT,
    courseid INT,
    EnrollmentDate DATE,
    Grade VARCHAR(2),
    FOREIGN KEY (studentid) REFERENCES Student (studentid) ON DELETE CASCADE,
    FOREIGN KEY (courseid) REFERENCES Course (courseid) ON DELETE CASCADE
);

INSERT INTO
    Student (
        Department,
        Firstname,
        Lastname,
        DOB
    )
VALUES (
        'Computer Science',
        'John',
        'Doe',
        '1990-01-01'
    ),
    (
        'Computer Science',
        'Jon',
        'Doi',
        '1992-01-02'
    ),
    (
        'Computer Science',
        'Jane',
        'Doe',
        '1991-01-03'
    ),
    (
        'Computer Science',
        'Jen',
        'Doe',
        '1993-01-04'
    ),
    (
        'Computer Science',
        'Jin',
        'Doe',
        '1994-01-05'
    ),
    (
        'Computer Science',
        'Jen',
        'Doe',
        '1995-01-06'
    ),
    (
        'Computer Science',
        'Jen',
        'Doe',
        '1996-01-07'
    ),
    (
        'Computer Science',
        'Jen',
        'Doe',
        '1997-01-08'
    ),
    (
        'Computer Science',
        'Jen',
        'Doe',
        '1998-01-09'
    ),
    (
        'Computer Science',
        'Jen',
        'Doe',
        '1999-01-10'
    );

INSERT INTO
    Course (courseid, CourseName, Credits)
VALUES (1, 'Math', 3),
    (2, 'Science', 4),
    (3, 'History', 3),
    (4, 'English', 3),
    (5, 'Computer Science', 4);

INSERT INTO
    Enrollment (
        studentid,
        courseid,
        EnrollmentDate,
        Grade
    )
VALUES (1, 1, '2019-01-01', 'A'),
    (1, 2, '2019-01-01', 'B'),
    (1, 3, '2019-01-01', 'C'),
    (1, 4, '2019-01-01', 'D'),
    (1, 5, '2019-01-01', 'F'),
    (2, 1, '2019-01-01', 'A'),
    (2, 2, '2019-01-01', 'B'),
    (2, 3, '2019-01-01', 'C'),
    (2, 4, '2019-01-01', 'D'),
    (2, 5, '2019-01-01', 'F'),
    (3, 1, '2019-01-01', 'A'),
    (3, 2, '2019-01-01', 'B'),
    (3, 3, '2019-01-01', 'C'),
    (3, 4, '2019-01-01', 'D'),
    (3, 5, '2019-01-01', 'F'),
    (4, 1, '2019-01-01', 'A'),
    (4, 2, '2019-01-01', 'B'),
    (4, 3, '2019-01-01', 'C'),
    (4, 4, '2019-01-01', 'D'),
    (4, 5, '2019-01-01', 'F'),
    (5, 1, '2019-01-01', 'A'),
    (5, 2, '2019-01-01', 'B'),
    (5, 3, '2019-01-01', 'C'),
    (5, 4, '2019-01-01', 'D'),
    (5, 5, '2019-01-01', 'F'),
    (6, 1, '2019-01-01', 'A'),
    (6, 2, '2019-01-01', 'B'),
    (6, 3, '2019-01-01', 'C'),
    (6, 4, '2019-01-01', 'D');

SELECT * FROM Student;

SELECT * FROM Course;

SELECT * FROM Enrollment;

SELECT * FROM Student WHERE Department = "Computer Science";

SELECT * FROM Enrollment WHERE studentid = 2;

SELECT * FROM Enrollment WHERE Grade <= "B";

UPDATE Enrollment
SET
    GRADE = "A"
WHERE
    STUDENTID = 1
    AND COURSEID = 1;

SELECT * FROM Enrollment;

DELETE FROM Student WHERE studentid = 1;

SELECT * FROM Enrollment;