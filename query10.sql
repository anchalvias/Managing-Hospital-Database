select "Patient_FirstName", "Patient_LastName", public."Room"."Room_ID", "Room_Type", public."Employee"."Employee_FirstName", public."Employee"."Employee_LastName"
from public."Patient", public."Record", public."Room", public."Employee"
where public."Patient"."Patient_ID" = public."Record"."Patient_ID" and public."Room"."Room_ID" = public."Patient"."Room_ID" 
and public."Room"."Employee_ID" = public."Employee"."Employee_ID"
group by "Patient_FirstName", "Patient_LastName", public."Room"."Room_ID", "Room_Type", public."Employee"."Employee_FirstName", 
public."Employee"."Employee_LastName", "Discharge_Date"
Having "Discharge_Date" is null