CREATE DATABASE Colleege;
GO
USE Colleege;
GO

CREATE TABLE Hostell (
    Hostel_id INT PRIMARY KEY,
    Hostel_name VARCHAR(50),
    No_of_seats INT,
    City VARCHAR(50),
    State VARCHAR(50),
    Address VARCHAR(100),
    Pin_code VARCHAR(10)
);

CREATE TABLE Student (
    S_id INT,
    F_Name VARCHAR(30),
    L_Name VARCHAR(30),
    Name VARCHAR(60),
    Phone_no VARCHAR(15),
    DOB DATE,
    Age INT,
    Hostel_id INT
);
CREATE TABLE Subjects (
    Subject_id INT PRIMARY KEY,
    Subject_name VARCHAR(50)
);

CREATE TABLE Faculty (
    F_id INT,
    F_Name VARCHAR(30),
    Name VARCHAR(60),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Mobile_no VARCHAR(15)
);

CREATE TABLE Course (
    Course_id INT PRIMARY KEY,
    Course_name VARCHAR(50),
    Duration VARCHAR(20)
);

CREATE TABLE DepartmentS (
    Department_id INT PRIMARY KEY,
    D_name VARCHAR(50)
);

CREATE TABLE Exams (
    Exam_id INT PRIMARY KEY,
    Department_id INT
);

INSERT INTO Hostell VALUES
(1, 'Alpha Hostelll', 50, 'Lahore', 'Punjab', 'Street 12, Lahore', '54000'),
(2, 'Beta Hostelll', 40, 'Karachi', 'Sindh', 'Block A, Karachi', '75000');

INSERT INTO Student VALUES
(101, 'Ali', 'Khan', 'Ali Khan', '03001234567', '2002-05-14', 23, 1),
(102, 'Sara', 'Ahmed', 'Sara Ahmed', '03111234567', '2003-08-21', 22, 2),
(103, 'Hamza', 'Ali', 'Hamza Ali', '03221112222', '2000-01-15', 23, 1 );

INSERT INTO Course VALUES
(301, 'Database Systems', '6 Months'),
(302, 'Discrete Mathematics', '4 Months');

INSERT INTO Exams VALUES
(601, 501),
(602, 502);

INSERT INTO Faculty VALUES
(330, 'John', 'Doe', 'Computer Science', 55000, '03005551234');

SELECT * FROM Hostell;
SELECT * FROM Student;
SELECT * FROM Exams;

UPDATE Faculty
SET F_id= 301
WHERE F_id = 330;
SELECT *FROM Faculty ;


UPDATE Student
SET Phone_no = '0311004567700'
WHERE S_id = 102;
SELECT *FROM Student;




DELETE FROM Student
WHERE S_id = 102;
SELECT *FROM Student;

SELECT S.Name, H.Hostel_name
FROM Student AS S
JOIN Hostell AS H ON S.Hostel_id = H.Hostel_id
WHERE H.City = 'Lahore';

ALTER TABLE Student
ADD emaill VARCHAR(50);
SELECT * FROM Student;



ALTER TABLE Student
ALTER COLUMN DOB DATE NOT NULL;
SELECT * FROM Student;




ALTER TABLE Student
ADD Address VARCHAR(50), AdmissionDate DATE;
SELECT * FROM Student;



ALTER TABLE Faculty
ALTER COLUMN Salary FLOAT;
SELECT *FROM Faculty ;


EXEC sp_rename 'Course.Course_name', 'CourseName', 'COLUMN';
SELECT * FROM Course;


ALTER TABLE DepartmentS
DROP COLUMN D_name;
SELECT * FROM DepartmentS;


ALTER TABLE Student
ALTER COLUMN S_id INT NOT NULL;
SELECT * FROM Student;



ALTER TABLE Student
ADD CONSTRAINT PK_Student PRIMARY KEY (S_id);
SELECT * FROM Student;



ALTER TABLE Faculty
ADD CONSTRAINT FK_Faculty_Course FOREIGN KEY (F_id) REFERENCES Course(Course_id);
SELECT *FROM Faculty ;


ALTER TABLE Student
ADD CONSTRAINT UQ_Contacttt UNIQUE (Phone_no);
SELECT * FROM Student;





UPDATE Student
SET Age=23
WHERE Age<23;
SELECT * FROM Student;




ALTER TABLE Student
ADD CONSTRAINT CHK_Age CHECK (Age >= 23);
SELECT * FROM Student;



ALTER TABLE Student
DROP CONSTRAINT CHK_Age;
