select  "Patient_FirstName", "Patient_LastName", "Patient_Sex", public."Patient"."Patient_ID", "Room_ID"
from public."Patient", public."Record"
where public."Patient"."Patient_ID" = public."Record"."Patient_ID"
group by "Patient_FirstName", "Patient_LastName", "Patient_Sex", public."Patient"."Patient_ID", "Room_ID", "Discharge_Date"
Having "Patient_Age" > '65' and "Discharge_Date" is null 