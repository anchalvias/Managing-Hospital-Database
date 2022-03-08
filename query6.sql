select  "Employee_FirstName", "Employee_LastName", "Employee_Type", "Salary"
from public."Employee"
where "Salary" > '$85,000'