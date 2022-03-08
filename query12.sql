SELECT "Employee_FirstName", "Employee_LastName",
    date_trunc('month', "Admitted_Date") Months,
    COUNT ("Patient_ID")
FROM
    public."Record", public."Employee"
	where public."Record"."Employee_ID" = public."Employee"."Employee_ID"
GROUP BY
    Months, "Employee_FirstName", "Employee_LastName"
ORDER BY
    Months;