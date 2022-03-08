select  "Patient_FirstName", "Patient_LastName", public."Patient"."Patient_ID"
from public."Patient", public."Record"
where public."Patient"."Patient_ID" = public."Record"."Patient_ID"
group by "Patient_FirstName", "Patient_LastName", public."Patient"."Patient_ID", "Discharge_Date"
Having "Discharge_Date" between '2020-06-30' and '2020-07-31'