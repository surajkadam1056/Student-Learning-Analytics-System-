use student_analytics
# 1: Top 10 Students by Average Marks
SELECT
    students.student_id,
    CONCAT(students.first_name,' ',students.last_name) AS student_name,
    ROUND(AVG(exam_results.marks_obtained),2) AS average_marks
FROM students
INNER JOIN exam_results
ON students.student_id = exam_results.student_id
GROUP BY students.student_id, student_name
ORDER BY average_marks DESC
LIMIT 10;

#2:Department-wise Average Attendance
SELECT
    departments.department_name,
    ROUND(
        SUM(CASE WHEN attendance.status='Present' THEN 1 ELSE 0 END)*100.0
        /COUNT(*),2
    ) AS attendance_percentage
FROM attendance 
INNER JOIN students 
ON attendance.student_id=students.student_id
INNER JOIN departments 
ON students.department_id=departments.department_id
GROUP BY departments.department_name
ORDER BY attendance_percentage DESC;

# 3:Students at Risk
SELECT
    students.student_id,
    CONCAT(students.first_name,' ',students.last_name) AS student_name,
    ROUND(
        SUM(CASE WHEN attendance.status='Present' THEN 1 ELSE 0 END)
        *100.0/COUNT(attendance.attendance_id),2
    ) AS attendance_percentage,
    ROUND(AVG(exam_results.marks_obtained),2) AS average_marks
FROM students
INNER JOIN attendance 
ON students.student_id=attendance.student_id
INNER JOIN exam_results 
ON students.student_id=exam_results.student_id
GROUP BY students.student_id, student_name
HAVING attendance_percentage<75
OR average_marks<40;

# 4: Assignment Submission Rate
SELECT
    ROUND(
        SUM(
            CASE
                WHEN submission_status IN ('Submitted', 'Late')
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS submission_rate
FROM assignment_submissions;

#5:Pass Percentage by Course
SELECT
    courses.course_name,
    ROUND(
        SUM(CASE WHEN exam_results.pass_fail='Pass'
        THEN 1 ELSE 0 END)
        *100.0/COUNT(*),2
    ) AS pass_percentage
FROM exam_results 
INNER JOIN exams 
ON exam_results.exam_id=exams.exam_id
INNER JOIN courses 
ON exams.course_id=courses.course_id
GROUP BY courses.course_name
ORDER BY pass_percentage DESC;

#6:Best Instructor
SELECT
    instructors.instructor_id,
    CONCAT(instructors.first_name,' ',instructors.last_name) AS instructor_name,
    ROUND(AVG(exam_results.marks_obtained),2) AS average_marks
FROM instructors 
INNER JOIN courses 
ON instructors.instructor_id=courses.instructor_id
INNER JOIN exams 
ON courses.course_id=exams.course_id
INNER JOIN exam_results
ON exams.exam_id=exam_results.exam_id
GROUP BY instructors.instructor_id,instructor_name
ORDER BY average_marks DESC
LIMIT 1;

#7:Most Difficult Course
SELECT
    courses.course_name,
    ROUND(AVG(exam_results.marks_obtained),2) AS average_marks
FROM courses
INNER JOIN exams
ON courses.course_id=exams.course_id
INNER JOIN exam_results 
ON exams.exam_id=exam_results.exam_id
GROUP BY courses.course_name
ORDER BY average_marks
LIMIT 1;

#8:Attendance vs Exam Performance
SELECT
    students.student_id,
    CONCAT(students.first_name,' ',students.last_name) AS student_name,
    ROUND(
        SUM(CASE WHEN attendance.status='Present'
        THEN 1 ELSE 0 END)
        *100.0/COUNT(attendance.attendance_id),2
    ) AS attendance_percentage,
    ROUND(AVG(exam_results.marks_obtained),2) AS average_marks
FROM students 
INNER JOIN attendance 
ON students.student_id=attendance.student_id
INNER JOIN exam_results 
ON students.student_id=exam_results.student_id
GROUP BY students.student_id,student_name
ORDER BY attendance_percentage DESC;

#9)Top Performing Department
SELECT
    departments.department_name,
    ROUND(AVG(exam_results.marks_obtained),2) AS average_marks
FROM departments
INNER JOIN students
ON departments.department_id=students.department_id
INNER JOIN exam_results
ON students.student_id=exam_results.student_id
GROUP BY departments.department_name
ORDER BY average_marks DESC
LIMIT 1;

#10: Course Completion Rate
SELECT
    courses.course_name,
    ROUND(
        SUM(
            CASE
                WHEN enrollments.completion_status = 'Completed'
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS completion_rate
FROM courses 
INNER JOIN enrollments 
ON courses.course_id = enrollments.course_id
GROUP BY courses.course_name
ORDER BY completion_rate DESC;
