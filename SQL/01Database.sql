create database student_analytics;
use student_analytics;
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    department_code VARCHAR(10) UNIQUE NOT NULL,
    hod_name VARCHAR(100),
    building VARCHAR(50)
);

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE,
    city VARCHAR(50),
    state VARCHAR(50),
    admission_date DATE NOT NULL,
    department_id INT NOT NULL,

    CONSTRAINT fk_student_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

CREATE TABLE instructors (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE,
    designation VARCHAR(50) NOT NULL,
    experience_years INT DEFAULT 0,
    joining_date DATE NOT NULL,
    department_id INT NOT NULL,

    CONSTRAINT fk_instructor_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    department_id INT NOT NULL,
    instructor_id INT NOT NULL,
    duration_months INT NOT NULL,
    fees DECIMAL(10,2) NOT NULL,
    difficulty_level ENUM('Beginner','Intermediate','Advanced') NOT NULL,

    CONSTRAINT fk_course_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id),

    CONSTRAINT fk_course_instructor
        FOREIGN KEY (instructor_id)
        REFERENCES instructors(instructor_id)
);

CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    completion_status ENUM('Active','Completed','Dropped') DEFAULT 'Active',

    CONSTRAINT fk_enrollment_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id),

    CONSTRAINT fk_enrollment_course
        FOREIGN KEY (course_id)
        REFERENCES courses(course_id),

    CONSTRAINT uq_student_course
        UNIQUE (student_id, course_id)
);

CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    attendance_date DATE NOT NULL,
    status ENUM('Present', 'Absent') NOT NULL,

    CONSTRAINT fk_attendance_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id),

    CONSTRAINT fk_attendance_course
        FOREIGN KEY (course_id)
        REFERENCES courses(course_id),

    CONSTRAINT uq_attendance
        UNIQUE (student_id, course_id, attendance_date)
);

CREATE TABLE assignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    assignment_title VARCHAR(100) NOT NULL,
    description TEXT,
    due_date DATE NOT NULL,
    total_marks INT NOT NULL,

    CONSTRAINT fk_assignment_course
        FOREIGN KEY (course_id)
        REFERENCES courses(course_id)
);

CREATE TABLE assignment_submissions (
    submission_id INT AUTO_INCREMENT PRIMARY KEY,
    assignment_id INT NOT NULL,
    student_id INT NOT NULL,
    submission_date DATE,
    marks_obtained INT,
    submission_status ENUM('Submitted', 'Late', 'Missing') NOT NULL,

    CONSTRAINT fk_submission_assignment
        FOREIGN KEY (assignment_id)
        REFERENCES assignments(assignment_id),

    CONSTRAINT fk_submission_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id),

    CONSTRAINT uq_student_assignment
        UNIQUE (assignment_id, student_id)
);

CREATE TABLE exams (
    exam_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    exam_name VARCHAR(100) NOT NULL,
    exam_type ENUM('Quiz', 'Mid Term', 'Final', 'Practical') NOT NULL,
    exam_date DATE NOT NULL,
    total_marks INT NOT NULL,

    CONSTRAINT fk_exam_course
        FOREIGN KEY (course_id)
        REFERENCES courses(course_id)
);

CREATE TABLE exam_results (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    exam_id INT NOT NULL,
    student_id INT NOT NULL,
    marks_obtained DECIMAL(5,2) NOT NULL,
    grade CHAR(2),
    pass_fail ENUM('Pass', 'Fail') NOT NULL,

    CONSTRAINT fk_result_exam
        FOREIGN KEY (exam_id)
        REFERENCES exams(exam_id),

    CONSTRAINT fk_result_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id),

    CONSTRAINT uq_exam_student
        UNIQUE (exam_id, student_id)
);


