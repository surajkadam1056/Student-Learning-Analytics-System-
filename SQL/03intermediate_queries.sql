use student_analytics;
# 1) INNER JOIN 
#Display students with their department names.
SELECT students.first_name,departments.department_name FROM students
INNER JOIN departments
ON students.department_id = departments.department_id;

#Display courses with instructor names.
SELECT courses.course_name,instructors.first_name,instructors.last_name  FROM courses
INNER JOIN instructors
ON courses.instructor_id = instructors.instructor_id;


#2)LEFT JOIN 
#Show all students and their enrollments 
SELECT students.student_id,students.first_name,students.last_name,enrollments.course_id,enrollments.enrollment_date,enrollments.completion_status
FROM students
LEFT JOIN enrollments 
ON students.student_id = enrollments.student_id;

#Show all courses and assigned instructors.
SELECT courses.course_name,courses.course_code,instructors.first_name,instructors.last_name,instructors.designation
FROM courses 
LEFT JOIN instructors 
ON courses.instructor_id = instructors.instructor_id;
.
#Show all exams and results.
SELECT exams.exam_name,exams.exam_type,exam_results.student_id,exam_results.marks_obtained,exam_results.grade,exam_results.pass_fail
FROM exams
LEFT JOIN exam_results 
ON exams.exam_id = exam_results.exam_id;

#3 right join 
#Show all departments and students
SELECT departments.department_id,departments.department_name,students.student_id,students.first_name,students.last_name
FROM students
RIGHT JOIN departments 
ON students.department_id = departments.department_id;.

#Show all instructors and courses.
SELECT instructors.instructor_id,instructors.first_name,instructors.last_name,courses.course_name,courses.course_code
FROM courses
RIGHT JOIN instructors 
ON courses.instructor_id = instructors.instructor_id;

#4)SELF JOIN :

#5)Multi-table JOIN 
#Student + Department + Course.
SELECT
    students.student_id,
    CONCAT(students.first_name, ' ', students.last_name) AS student_name,
    departments.department_name,
    courses.course_name,
    enrollments.enrollment_date,
    enrollments.completion_status
FROM students
INNER JOIN departments
    ON students.department_id = departments.department_id
INNER JOIN enrollments 
    ON students.student_id = enrollments.student_id
INNER JOIN courses 
    ON enrollments.course_id = courses.course_id;

#Student + Enrollment + Course + Instructor.
SELECT
    students.student_id,
    CONCAT(students.first_name, ' ', students.last_name) AS student_name,
    courses.course_name,
    CONCAT(instructors.first_name, ' ', instructors.last_name) AS instructor_name,
    instructors.designation,
    enrollments.enrollment_date,
    enrollments.completion_status
FROM students 
INNER JOIN enrollments 
    ON students.student_id = enrollments.student_id
INNER JOIN courses 
    ON enrollments.course_id = courses.course_id
INNER JOIN instructors 
    ON courses.instructor_id = instructors.instructor_id;
    
#6)GROUP BY with JOIN 
#Students per department
SELECT departments.department_name, COUNT(students.student_id) AS total_students FROM departments
INNER JOIN students 
ON departments.department_id = students.department_id
GROUP BY departments.department_name;

#avrage marks by course
SELECT courses.course_name,ROUND(AVG(exam_results.marks_obtained), 2) AS average_marks FROM courses
INNER JOIN exams 
    ON courses.course_id = exams.course_id
INNER JOIN exam_results
    ON exams.exam_id = exam_results.exam_id
GROUP BY courses.course_name;

#7) CASE Statement
#Pass/Fail using CASE
SELECT result_id,student_id,exam_id,marks_obtained,
    CASE
        WHEN marks_obtained >= 35 THEN 'Pass'
        ELSE 'Fail'
    END AS Result
FROM exam_results;

#8) Subqueries
#Students scoring above average.
SELECT student_id, exam_id,marks_obtained FROM exam_results
WHERE marks_obtained >
(
    SELECT AVG(marks_obtained)
    FROM exam_results
);
