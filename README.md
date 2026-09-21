# 📊 Student Learning Analytics System

A data analytics and business intelligence project designed to analyze **student academic performance, attendance, assignments, examinations, and course-related data** using **MySQL and Power BI**.

The system stores structured student-learning data in a relational database and converts it into meaningful insights through SQL analysis and interactive Power BI dashboards.

---

## 🎯 Project Objective

The main objective of this project is to build a centralized student analytics system that helps analyze:

* Student academic performance
* Attendance patterns
* Assignment performance
* Examination results
* Course-wise performance
* Department-wise performance
* Student learning trends
* Instructor and course information

The project demonstrates an end-to-end **SQL + Power BI data analytics workflow**.

---

## 🛠️ Technologies Used

| Technology    | Purpose                                      |
| ------------- | -------------------------------------------- |
| **MySQL**     | Database design, storage and SQL analysis    |
| **SQL**       | Data extraction, transformation and analysis |
| **Power BI**  | Interactive dashboards and visualization     |
| **Excel/CSV** | Data preparation, if applicable              |

---

## 🗄️ Database Structure

The project uses a relational database named:

```text
student_learning_analytics
```

### Main Tables

```text
Departments
    ↓
Students
    ↓
Attendance
    ↓
Assignments
    ↓
Exams

Courses
    ↓
Students / Enrollments
    ↓
Attendance / Assignments / Exams

Instructors
    ↓
Courses
```

### Tables Included

#### 1. Departments

Stores department-related information.

Example fields:

```text
department_id
department_name
```

#### 2. Students

Stores student information.

Example fields:

```text
student_id
student_name
gender
age
department_id
```

#### 3. Instructors

Stores instructor information.

Example fields:

```text
instructor_id
instructor_name
department_id
```

#### 4. Courses

Stores course information.

Example fields:

```text
course_id
course_name
department_id
instructor_id
```

#### 5. Attendance

Stores student attendance records.

Example fields:

```text
attendance_id
student_id
course_id
attendance_percentage
```

#### 6. Exams

Stores examination and student score information.

Example fields:

```text
exam_id
student_id
course_id
exam_type
marks
```

#### 7. Assignments

Stores assignment-related performance.

Example fields:

```text
assignment_id
student_id
course_id
assignment_name
marks
submission_status
```

---

## 🔄 Project Workflow

```text
Raw Student Data
       ↓
     MySQL
       ↓
Database Design
       ↓
SQL Queries
       ↓
Data Analysis
       ↓
Power BI
       ↓
Interactive Dashboard
       ↓
Student Learning Insights
```

---

## 🔍 SQL Analysis

SQL is used to perform data extraction and analysis such as:

* Filtering students using `WHERE`
* Sorting records using `ORDER BY`
* Aggregating data using `SUM()`, `AVG()`, `COUNT()`, `MIN()`, `MAX()`
* Department-wise analysis using `GROUP BY`
* Filtering aggregated results using `HAVING`
* Combining multiple tables using `JOIN`
* Using subqueries for advanced analysis
* Using `CASE` statements for categorization
* Calculating attendance and performance metrics
* Identifying high-performing and low-performing students

### Example

```sql
SELECT 
    department_id,
    AVG(marks) AS average_marks
FROM exams
GROUP BY department_id
ORDER BY average_marks DESC;
```

---

## 📈 Power BI Dashboard

The analyzed data is connected to Power BI to create an interactive student analytics dashboard.

### Key KPIs

* 👨‍🎓 Total Students
* 📚 Total Courses
* 👨‍🏫 Total Instructors
* 📊 Average Marks
* 📅 Average Attendance
* 📝 Assignment Performance
* 🏆 Top Performing Students

### Dashboard Analysis

The dashboard can be used to analyze:

* Department-wise student performance
* Course-wise average marks
* Attendance distribution
* Student performance trends
* Assignment performance
* Examination performance
* Top and low-performing students

---

## 💡 Key Insights

This project can help identify:

* Departments with higher or lower average academic performance
* Courses where students are performing well or struggling
* Relationship between attendance and academic performance
* Students requiring additional academic support
* Assignment and examination performance patterns
* Overall learning trends across departments

---

## 📂 Project Structure

```text
Student-Learning-Analytics-System/
│
├── README.md
│
├── SQL/
│   ├── database_creation.sql
│   ├── table_creation.sql
│   ├── insert_data.sql
│   └── analysis_queries.sql
│
├── PowerBI/
│   └── Student_Learning_Analytics.pbix
│
├── Dataset/
│   └── student_data.csv
│
└── Screenshots/
    ├── dashboard.png
    └── database.png
```

> Update the folder/file names above according to the actual files present in your repository.

---

## 🚀 How to Run the Project

### 1. Clone the Repository

```bash
git clone https://github.com/surajkadam1056/Student-Learning-Analytics-System.git
```

### 2. Open MySQL Workbench

Create the database:

```sql
CREATE DATABASE student_learning_analytics;
```

Select the database:

```sql
USE student_learning_analytics;
```

### 3. Create Tables

Run the table creation SQL script.

```sql
SOURCE table_creation.sql;
```

### 4. Insert Data

Run the data insertion script.

```sql
SOURCE insert_data.sql;
```

### 5. Run SQL Analysis

Execute the queries available in:

```text
analysis_queries.sql
```

### 6. Open Power BI

Open the `.pbix` file and connect Power BI to the MySQL database.

Refresh the dataset to load the latest data.

---

## 📊 Skills Demonstrated

This project demonstrates practical knowledge of:

### SQL

* Database creation
* Table creation
* Primary Keys
* Foreign Keys
* Constraints
* CRUD operations
* Filtering
* Aggregate Functions
* `GROUP BY`
* `HAVING`
* `ORDER BY`
* Joins
* Subqueries
* `CASE`
* Data analysis

### Power BI

* Data loading
* Data modeling
* Relationships
* DAX basics
* KPI cards
* Charts
* Slicers
* Interactive dashboards
* Business insights

### Data Analytics

* Data cleaning
* Exploratory analysis
* KPI development
* Performance analysis
* Trend analysis
* Data visualization
* Business-oriented insights

---

## 🎓 Use Case

This system can be useful for educational institutions to analyze student learning data and support data-driven decision-making.

Possible users include:

* College administrators
* Faculty members
* Academic coordinators
* Department heads
* Educational analysts

---

## 🔮 Future Improvements

The project can be extended with:

* Student performance prediction using Machine Learning
* Early identification of at-risk students
* Automated performance reports
* More advanced Power BI DAX measures
* Student-level drill-through reports
* Attendance-performance correlation analysis
* Predictive analytics
* Flask API integration
* Automated database-to-dashboard refresh

---

## 👨‍💻 Author

**Suraj Kadam**

B.E. Electronics & Telecommunication Engineering

### Areas of Interest

* Data Analytics
* Data Science
* SQL
* Python
* Power BI
* Machine Learning

---

## ⭐ Project Highlights

```text
MySQL Database
      +
SQL Data Analysis
      +
Power BI Dashboard
      =
Student Learning Analytics System
```

This project demonstrates an end-to-end approach to transforming structured student data into meaningful analytical insights.
