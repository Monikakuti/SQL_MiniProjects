use Practice
DROP TABLE student

-- Students Table
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    major VARCHAR(100)
);

INSERT INTO student (student_id, name, major) VALUES
(1, 'Aanya Singh', 'Physics'),
(2, 'Arjun Reddy', 'Biology'),
(3, 'Nisha Patel', 'Math'),
(4, 'Rohan Gupta', 'Chemistry'),
(5, 'Maya Iyer', 'Physics');

-- Courses Table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    department VARCHAR(50)
);

INSERT INTO courses (course_id, course_name, department) VALUES
(101, 'Quantum Mechanics', 'Physics'),
(102, 'Organic Chemistry', 'Chemistry'),
(103, 'Cell Biology', 'Biology'),
(104, 'Linear Algebra', 'Math'),
(105, 'Astrophysics', 'Physics');

-- Enrollments Table
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade CHAR(1),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO enrollments (enrollment_id, student_id, course_id, grade) VALUES
(1, 1, 101, 'A'),
(2, 1, 105, 'B'),
(3, 2, 103, 'A'),
(4, 3, 104, 'B'),
(5, 4, 102, 'A'),
(6, 5, 101, 'B'),
(7, 5, 105, 'A');

SELECT * FROM student
SELECT * FROM courses
SELECT * FROM enrollments


--Show each student’s name and the names of the courses they are enrolled in.
SELECT student.name , courses.course_name
FROM student
LEFT JOIN enrollments
ON enrollments.student_id = student.student_id 
LEFT JOIN courses
ON courses.course_id = enrollments.course_id

--List students who are not enrolled in any course.
SELECT student.name
FROM student
LEFT JOIN enrollments
ON enrollments.student_id = student.student_id 
LEFT JOIN courses
ON courses.course_id = enrollments.course_id
WHERE enrollments.enrollment_id IS NULL;


--Show the course name and number of students enrolled in each course.
SELECT courses.course_name, COUNT(enrollments.student_id) AS num_students
FROM courses
LEFT JOIN enrollments
ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name;


--Display each student’s name and their average grade (A=4, B=3, C=2).
SELECT student.name , AVG( grade) AS avg_grade 
FROM student
LEFT JOIN enrollments
ON student.student_id = enrollments.enrollment_id
GROUP BY enrollments.grade , student.name

--Find the students who scored an 'A' in at least one course.
SELECT DISTINCT students.name
FROM students
INNER JOIN enrollments
ON students.student_id = enrollments.student_id
WHERE enrollments.grade = 'A';


--List all courses that have not been taken by any student.
SELECT courses.course_name 
FROM courses
LEFT JOIN enrollments
ON courses.course_id = enrollments.course_id
WHERE enrollments.student_id IS NULL;

--Show the total number of courses each student has enrolled in.
SELECT students.name, COUNT(enrollments.course_id) AS total_courses
FROM students
LEFT JOIN enrollments
ON students.student_id = enrollments.student_id
GROUP BY students.name;

--Show all students and the departments of the courses they are taking.
SELECT students.name, courses.department
FROM students
INNER JOIN enrollments
ON students.student_id = enrollments.student_id
INNER JOIN courses
ON enrollments.course_id = courses.course_id;

--Find out which department has the most enrollments.
SELECT TOP 1 courses.department, COUNT(*) AS total_enrollments
FROM enrollments
INNER JOIN courses
ON enrollments.course_id = courses.course_id
GROUP BY courses.department
ORDER BY total_enrollments DESC ;

--Show all combinations of students and courses, even if a student isn’t enrolled in the course .
SELECT students.name, courses.course_name
FROM students
CROSS JOIN courses;