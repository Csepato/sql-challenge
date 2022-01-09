{\rtf1\ansi\ansicpg1252\cocoartf1671\cocoasubrtf600
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- Data Engineering --\
-- Drop Tables if Existing\
DROP TABLE IF EXISTS departments;\
DROP TABLE IF EXISTS dept_emp;\
DROP TABLE IF EXISTS dept_manager;\
DROP TABLE IF EXISTS employees;\
DROP TABLE IF EXISTS salaries;\
DROP TABLE IF EXISTS titles;\
\
-- Exported from QuickDBD: Specifying Data Types, Primary Keys & Foreign Keys \
-- Import CSV Files Into Corresponding SQL Table\
CREATE TABLE "titles" (\
    "title_id" VARCHAR(10)   NOT NULL,\
    "title" VARCHAR(30)   NOT NULL,\
    CONSTRAINT "pk_titles" PRIMARY KEY (\
        "title_id"\
     )\
);\
\
CREATE TABLE "departments" (\
    "dept_no" VARCHAR(10)   NOT NULL,\
    "dept_name" VARCHAR(30)   NOT NULL,\
    CONSTRAINT "pk_departments" PRIMARY KEY (\
        "dept_no"\
     )\
);\
\
CREATE TABLE "employees" (\
    "emp_no" INT   NOT NULL,\
    "emp_title_id" VARCHAR(10)   NOT NULL,\
    "birth_date" VARCHAR(10)   NOT NULL,\
    "first_name" VARCHAR(20)   NOT NULL,\
    "last_name" VARCHAR(20)   NOT NULL,\
    "sex" VARCHAR(1)   NOT NULL,\
    "hire_date" VARCHAR(10)   NOT NULL,\
    CONSTRAINT "pk_employees" PRIMARY KEY (\
        "emp_no"\
     )\
);\
\
CREATE TABLE "dept_manager" (\
    "dept_no" VARCHAR(10)   NOT NULL,\
    "emp_no" INT   NOT NULL\
);\
\
CREATE TABLE "salaries" (\
    "emp_no" INT   NOT NULL,\
    "salary" INT   NOT NULL\
);\
\
CREATE TABLE "dept_emp" (\
    "emp_no" INT   NOT NULL,\
    "dept_no" VARCHAR(10)   NOT NULL\
);\
\
\
ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")\
REFERENCES "titles" ("title_id");\
\
ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")\
REFERENCES "departments" ("dept_no");\
\
ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")\
REFERENCES "employees" ("emp_no");\
\
ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")\
REFERENCES "employees" ("emp_no");\
\
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")\
REFERENCES "employees" ("emp_no");\
\
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")\
REFERENCES "departments" ("dept_no");}