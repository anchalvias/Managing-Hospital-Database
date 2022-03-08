SELECT
"Doctor_Specialty",
COUNT ("Doctor_Specialty") as Number_of_Doctors
FROM
public."Doctor", public."Employee"
where public."Doctor"."Employee_ID" = public."Employee"."Employee_ID"
and "Salary" > '$100000'

GROUP BY
"Doctor_Specialty"
HAVING
COUNT ("Doctor_Specialty") > 3;