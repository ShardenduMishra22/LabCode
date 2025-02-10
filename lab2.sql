Create and use the database
CREATE DATABASE IF NOT EXISTS SchoolDB;
USE SchoolDB;

Create Students table
CREATE TABLE Students (
    studentid INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(25),
    lastname VARCHAR(25),
    dob DATE,
    gender ENUM('Male', 'Female', 'Other'),
    major VARCHAR(20)
);

Create Courses table
CREATE TABLE Courses (
    courseid INT PRIMARY KEY AUTO_INCREMENT,
    coursename VARCHAR(50),
    credits INT
);

Create Enrollments table
CREATE TABLE Enrollments (
    enrollmentid INT PRIMARY KEY AUTO_INCREMENT,
    studentid INT,
    courseid INT,
    enrollmentDate DATE,
    grade CHAR(2),
    FOREIGN KEY (studentid) REFERENCES Students(studentid) ON DELETE CASCADE,
    FOREIGN KEY (courseid) REFERENCES Courses(courseid) ON DELETE CASCADE
);

Insert data into table Students
INSERT INTO Students (firstname, lastname, dob, gender, major) VALUES 
('John', 'Doe', '2000-05-15', 'Male', 'Computer Science'),
('Jane', 'Smith', '2001-08-21', 'Female', 'Biology'),
('Mike', 'Johnson', '1999-11-10', 'Male', 'Mathematics');

Insert data into table Courses
INSERT INTO Courses (coursename, credits) VALUES 
('Database Systems', 3),
('Calculus', 4),
('Physics', 3);

Insert data into Enrollments
INSERT INTO Enrollments (studentid, courseid, enrollmentDate, grade) VALUES 
(1, 1, '2024-02-01', 'A'),
(2, 2, '2024-02-02', 'B'),
(3, 3, '2024-02-03', 'A');

SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;

SELECT Students.StudentID, Students.FirstName, Students.LastName 
FROM Students
JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
WHERE Enrollments.CourseID = 1;

SELECT * FROM Students;

UPDATE Students 
SET major = "Computer Science"
WHERE studentid = 1; 

SELECT * FROM Students;

DELETE FROM Students where StudentID = 1;

SELECT * FROM Students;

ALTER TABLE Students ADD Email VARCHAR(20);

SELECT * FROM Students;

DROP TABLE Enrollments;
DROP TABLE Courses;
DROP TABLE Students;
DROP DATABASE SchoolDB;

SHOW TABLES;
