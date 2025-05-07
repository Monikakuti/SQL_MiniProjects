--MiniProject 
--From D1,D2,D3

use Practice;

CREATE TABLE students (
    student_id INT,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    grade VARCHAR(2),
    marks INT,
    city VARCHAR(100),
    country VARCHAR(100)
);

INSERT INTO students (student_id, name, age, gender, grade, marks, city, country)
VALUES
(1, 'Alice', 20, 'Female', 'A', 850, 'New York', 'USA'),
(2, 'Bob', 22, 'Male', 'B', 720, 'San Francisco', 'USA'),
(3, 'Charlie', 18, 'Male', 'A', 900, 'Mumbai', 'India'),
(4, 'David', 21, 'Male', 'C', 650, 'Los Angeles', 'USA'),
(5, 'Eva', 19, 'Female', 'B', 710, 'London', 'UK'),
(6, 'Fay', 20, 'Female', 'A', 880, 'Paris', 'France'),
(7, 'George', 23, 'Male', 'B', 740, 'Toronto', 'Canada'),
(8, 'Hannah', 18, 'Female', 'A', 920, 'Mumbai', 'India'),
(9, 'Ivy', 22, 'Female', 'C', 670, 'Berlin', 'Germany'),
(10, 'Jack', 21, 'Male', 'B', 800, 'Tokyo', 'Japan'),
(11, 'Kathy', 25, 'Female', 'B', 720, 'Los Angeles', 'USA'),
(12, 'Leo', 20, 'Male', 'A', 850, 'New York', 'USA'),
(13, 'Megan', 22, 'Female', 'A', 870, 'London', 'UK'),
(14, 'Nina', 19, 'Female', 'B', 750, 'Toronto', 'Canada'),
(15, 'Oscar', 20, 'Male', 'C', 600, 'Paris', 'France'),
(16, 'Paul', 21, 'Male', 'A', 910, 'Mumbai', 'India'),
(17, 'Quincy', 23, 'Male', 'C', 670, 'Berlin', 'Germany'),
(18, 'Rachel', 22, 'Female', 'A', 950, 'New York', 'USA'),
(19, 'Sam', 24, 'Male', 'B', 780, 'Tokyo', 'Japan'),
(20, 'Tina', 18, 'Female', 'A', 900, 'San Francisco', 'USA');


SELECT * FROM students

--Count how many students are from India.
SELECT COUNT(*) AS total_stu
FROM students
WHERE country ='India'

--Get the names and marks of students who scored more than 750.
SELECT name , marks 
FROM students
WHERE marks > 750 

--Find the average marks of students from each country.
SELECT AVG(marks) AS avg_mark , country
FROM students
GROUP BY country


--Show all students who are younger than 18.
SELECT name ,age 
FROM students
WHERE age < 18

--Find the total number of male and female students.
SELECT COUNT (*) AS total , gender
FROM students
GROUP BY gender

--Get the highest marks scored in each city.
SELECT MAX(marks) AS highest_mark , city
FROM students
GROUP BY city;


--Display students who got a grade 'A' and are older than 20.
SELECT name 
FROM students
WHERE grade = 'A' and age > 20

--List all female students whose names start with 'S'.
SELECT name
FROM students
WHERE gender='Female' and name LIKE 'S%'

--Find the number of students in each grade.
SELECT COUNT(*) AS no_of_stu , grade
FROM students
GROUP BY grade;

--Show countries where the average marks are below 600.
SELECT AVG(marks) AS avg_mark , country 
FROM students
GROUP BY country
HAVING AVG(marks) < 600

--List the top 3 students with the highest marks.
SELECT TOP 3 name, marks
FROM students
ORDER BY marks DESC;

--Get the student name, age, and grade for those who live in either Mumbai or Delhi.
SELECT name,age,grade 
FROM students
WHERE city IN ('Mumbai','Delhi')

--Find how many students have marks between 500 and 900.
SELECT COUNT(*) AS total_count
FROM students
WHERE marks BETWEEN 500 AND 900

--Show cities where more than 5 students live.
SELECT city
FROM students
GROUP BY city
HAVING COUNT(*) > 5;


--Find the average age of students in each grade who are from the USA.
SELECT AVG(age) AS avg_age, grade
FROM students
WHERE country = 'USA'
GROUP BY grade;