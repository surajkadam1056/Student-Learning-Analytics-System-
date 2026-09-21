use student_analytics

#SELECT
select * from departments;
select * from instructors;
select * from courses;
select * from students;
select * from enrollments;
select * from attendance;
select * from assignments;
select * from assignment_submissions;
select * from exams;
select * from exam_results;

#WHERE
select * from students where city='pune';
SELECT * FROM students WHERE gender='Female';
SELECT * FROM courses WHERE difficulty_level='Beginner';
SELECT * FROM courses WHERE fees>30000;
SELECT * FROM students WHERE admission_date>'2024-01-01';

#ORDER BY 
select * from students order by first_name;
select * from courses order by fees Desc;
select * from exam_results order by marks_obtained desc;


#LIMIT 
SELECT * FROM students LIMIT 3;
select * from instructors limit 10;
select * from exam_results order by marks_obtained desc limit 1 offset 1;  #finding second topper
SELECT * FROM courses ORDER BY fees DESC LIMIT 5;

#Aggregate Functions
select count(*) as total_students from students;
SELECT AVG(fees) AS Average_Fees FROM courses;
SELECT MAX(fees) AS Highest_Fee FROM courses;
SELECT MIN(fees) AS Lowest_Fee FROM courses;
SELECT SUM(fees) AS Total_Fees FROM courses;

#LIKE
select * from students where first_name like 'a%';     # NAME start with letter a
select * from students where first_name  like '%n';     # Name end with letter n
select * from students where first_name like '%a%';      # name those have letter a
select * from students where first_name like '_a%';      # name those have second letter a

#BETWEEN
select * from courses where fees between 10000 and 40000;

#and-or 
select * from students where gender='other' and city='pune';
select * from students where gender='other' or state='goa';

#in 
select * from students where city in ('pune','Loni');

#null
select * from students where gender  is null;

#Distnict     : remove duplicates 
select distinct city from students;
select count(distinct(city )) from students;

#Group by
select department_id, count(*) as total_students from students group by department_id;
select difficulty_level, avg(fees) as average_fee from courses group by difficulty_level;
SELECT department_id, COUNT(*) AS total_instructors FROM instructors GROUP BY department_id;

# HAVING
select department_id, count(*) as total_students from students group by department_id having count(*)>60;
select difficulty_level, avg(fees) as average_fee from courses group by difficulty_level having average_fee>30000;




