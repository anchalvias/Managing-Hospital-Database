select  "Patient_FirstName", "Patient_LastName", "Room_ID"
from public."Patient", public."Record"
where public."Patient"."Patient_ID" = public."Record"."Patient_ID"
group by "Patient_FirstName", "Patient_LastName", "Room_ID", "Discharge_Date", "Ward"
Having "Ward" = 'Emergency' and "Discharge_Date" is not null
