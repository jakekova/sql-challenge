-- Data Analysis

-- List the employee number, last name, first name, sex, and salary of each employee.

select emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
from employees AS emp
inner join salaries AS sal ON emp.emp_no = sal.emp_no;


-- List the first name, last name, and hire date for the employees who were hired in 1986.

select first_name, last_name, hire_date
from employees
where year(hire_date) = 1986;


-- List the manager of each department along with their department number, department name, employee number, last name, and first name.

select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
from dept_manager AS dm
inner join departments AS d ON dm.dept_no = d.dept_no
inner join employees AS e ON dm.emp_no = e.emp_no;


-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_no, d.dept_name
from employees e
inner join dept_emp de ON e.emp_no = de.emp_no
inner join departments d ON de.dept_no = d.dept_no
left join dept_manager dm ON d.dept_no = dm.dept_no
where dm.emp_no IS NULL OR de.emp_no = dm.emp_no;


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

select first_name, last_name, sex
from employees
where first_name = 'Hercules' AND last_name LIKE 'B%';


-- List each employee in the Sales department, including their employee number, last name, and first name.

select e.emp_no, e.last_name, e.first_name
from employees e
inner join dept_emp de ON e.emp_no = de.emp_no
inner join departments d ON de.dept_no = d.dept_no
where d.dept_name = 'Sales';


-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

select e.emp_no , e.last_name, e.first_name, d.dept_name
from employees e
inner join dept_emp de ON e.emp_no = de.emp_no
inner join departments d ON de.dept_no = d.dept_no
where d.dept_name IN ('Sales', 'Development');


-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

select
    last_name, COUNT(*) as frequency
from employees
group by last_name
order by frequency DESC;
