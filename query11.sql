SELECT "Employee_FirstName", "Employee_LastName",
    date_trunc('month', "Admitted_Date") Months,
    COUNT (public."Record"."Patient_ID")
FROM
    public."Record", public."Employee", public."Room", public."Patient"
	
	where public."Record"."Patient_ID" = public."Patient"."Patient_ID"
	and public."Patient"."Room_ID" = public."Room"."Room_ID"
	and public."Room"."Employee_ID" = public."Employee"."Employee_ID"
	and public."Employee"."Employee_Type" = 'Nurse'
GROUP BY
    Months, "Employee_FirstName", "Employee_LastName"
ORDER BY
    Months;