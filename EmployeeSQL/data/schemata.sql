-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Fxtw3V
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "departments" (
    "dept_no" varchar  NOT NULL ,
    "dept_name" varchar  NOT NULL 
)

GO

CREATE TABLE "dept_emp" (
    "emp_no" int  NOT NULL ,
    "dept_no" varchar  NOT NULL 
)

GO

CREATE TABLE "employees" (
    "emp_no" int  NOT NULL ,
    "emp_title_id" varchar  NOT NULL ,
    "birth_date" date  NOT NULL ,
    "first_name" varchar  NOT NULL ,
    "last_name" varchar  NOT NULL ,
    "sex" varchar  NOT NULL ,
    "hire_date" date  NOT NULL 
)

GO

CREATE TABLE "titles" (
    "title_id" varchar  NOT NULL ,
    "title" varchar  NOT NULL 
)

GO

CREATE TABLE "salaries" (
    "emp_no" int  NOT NULL ,
    "salary" int  NOT NULL 
)

GO

CREATE TABLE "dept_manager" (
    "dept_no" varchar  NOT NULL ,
    "emp_no" int  NOT NULL 
)

GO

ALTER TABLE "departments" ADD CONSTRAINT "fk_departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "dept_manager" ("dept_no")
GO

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no")
GO

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no")
GO

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "salaries" ("emp_no")
GO

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id")
GO

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no")
GO

