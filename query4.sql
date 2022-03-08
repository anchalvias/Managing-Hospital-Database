select  "Doctor_Specialty", Count(*)
from public."Doctor"
group by "Doctor_Specialty"
order by "Doctor_Specialty"