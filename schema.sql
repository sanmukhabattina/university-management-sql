-- University Management System Schema

DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Courses;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Major VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    Credits INT
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Grade CHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Students VALUES
(1, 'Alice', 20, 'Computer Science', 'alice@example.com'),
(2, 'Bob', 22, 'Data Science', 'bob@example.com'),
(3, 'Charlie', 19, 'AI', 'charlie@example.com'),
(4, 'David', 21, 'Computer Science', 'david@example.com'),
(5, 'Eva', 23, 'Data Science', 'eva@example.com');

INSERT INTO Courses VALUES
(101, 'DBMS', 4),
(102, 'AI', 3),
(103, 'Data Science', 4);

INSERT INTO Enrollments VALUES
(1001, 1, 101, 'A'),
(1002, 2, 102, 'B'),
(1003, 3, 103, 'A'),
(1004, 1, 102, 'C'),
(1005, 4, 103, 'B');
