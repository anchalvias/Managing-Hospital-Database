select "Employee_LastName", "Employee_FirstName", "Employee_ID", "Employee_Type" 
from public."Employee"
group by "Employee_Type", "Employee_LastName", "Employee_FirstName", "Employee_ID"
order by "Employee_Type", "Employee_LastName"