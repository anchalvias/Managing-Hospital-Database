CREATE DATABASE "Project_COP6727"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;



CREATE TABLE public."Employee"
(
    "Employee_ID" numeric(10,0) NOT NULL,
    "Employee_SSN" numeric(9,0) NOT NULL,
    "Employee_FirstName" text COLLATE pg_catalog."default" NOT NULL,
    "Employee_LastName" text COLLATE pg_catalog."default" NOT NULL,
    "Employee_Sex" text COLLATE pg_catalog."default" NOT NULL,
    "Employee_DOB" date NOT NULL,
    "Employee_Phone" numeric(20,0) NOT NULL,
    "Salary" money,
    "Street" text COLLATE pg_catalog."default" NOT NULL,
    "House/Apt_Number" text COLLATE pg_catalog."default",
    "City" text COLLATE pg_catalog."default" NOT NULL,
    "State" text COLLATE pg_catalog."default" NOT NULL,
    "Zip_Coce" numeric NOT NULL,
    "Employee_Type" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "EmployeeTable_pkey" PRIMARY KEY ("Employee_ID")
)

TABLESPACE pg_default;

ALTER TABLE public."Employee"
    OWNER to postgres;



CREATE TABLE public."Doctor"
(
    "Employee_ID" numeric(50,0) NOT NULL,
    "Doctor_Specialty" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Doctor Table_pkey" PRIMARY KEY ("Employee_ID"),
    CONSTRAINT "Employee_ID" FOREIGN KEY ("Employee_ID")
        REFERENCES public."Employee" ("Employee_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."Doctor"
    OWNER to postgres;




CREATE TABLE public."Room"
(
    "Room_ID" text COLLATE pg_catalog."default" NOT NULL,
    "Room_Type" text COLLATE pg_catalog."default" NOT NULL,
    "Employee_ID" numeric NOT NULL,
    "Status" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Room Table_pkey" PRIMARY KEY ("Room_ID"),
    CONSTRAINT "Employee_ID" FOREIGN KEY ("Employee_ID")
        REFERENCES public."Employee" ("Employee_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."Room"
    OWNER to postgres;





CREATE TABLE public."Medicine "
(
    "Medicine_ID" text COLLATE pg_catalog."default" NOT NULL,
    "Description" text COLLATE pg_catalog."default" NOT NULL,
    "Price" money NOT NULL,
    "Quantity_In_Stock" numeric NOT NULL,
    CONSTRAINT "Medicine Table_pkey" PRIMARY KEY ("Medicine_ID")
)

TABLESPACE pg_default;

ALTER TABLE public."Medicine "
    OWNER to postgres;



CREATE TABLE public."Patient"
(
    "Patient_ID" text COLLATE pg_catalog."default" NOT NULL,
    "Patient_FirstName" text COLLATE pg_catalog."default" NOT NULL,
    "Patient_LastName" text COLLATE pg_catalog."default" NOT NULL,
    "Patient_DOB" date NOT NULL,
    "Patient_Sex" text COLLATE pg_catalog."default" NOT NULL,
    "Patient_SSN" numeric(9,0) NOT NULL,
    "Patient_Age" numeric NOT NULL,
    "Patient_Phone" numeric NOT NULL,
    "Street" text COLLATE pg_catalog."default" NOT NULL,
    "House/Apt_Number" text COLLATE pg_catalog."default",
    "City" text COLLATE pg_catalog."default" NOT NULL,
    "State" text COLLATE pg_catalog."default" NOT NULL,
    "Zip_Coce" numeric NOT NULL,
    "Employee_ID" numeric NOT NULL,
    "Room_ID" text COLLATE pg_catalog."default",
    CONSTRAINT "Patient Table_pkey" PRIMARY KEY ("Patient_ID"),
    CONSTRAINT "Employee_ID" FOREIGN KEY ("Employee_ID")
        REFERENCES public."Employee" ("Employee_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Room_ID" FOREIGN KEY ("Room_ID")
        REFERENCES public."Room" ("Room_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."Patient"
    OWNER to postgres;

CREATE INDEX "fki_Employee_ID"
    ON public."Patient" USING btree
    ("Employee_ID" ASC NULLS LAST)
    TABLESPACE pg_default;




CREATE TABLE public."Record"
(
    "Record_ID" text COLLATE pg_catalog."default" NOT NULL,
    "Admitted_Date" date NOT NULL,
    "Discharge_Date" date,
    "Ward" text COLLATE pg_catalog."default" NOT NULL,
    "Patient_ID" text COLLATE pg_catalog."default" NOT NULL,
    "Employee_ID" numeric NOT NULL,
    CONSTRAINT "Record Table_pkey" PRIMARY KEY ("Record_ID"),
    CONSTRAINT "Employee_ID" FOREIGN KEY ("Employee_ID")
        REFERENCES public."Employee" ("Employee_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Patient_ID" FOREIGN KEY ("Patient_ID")
        REFERENCES public."Patient" ("Patient_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."Record"
    OWNER to postgres;





CREATE TABLE public."Treatment"
(
    "Treatment_ID" text COLLATE pg_catalog."default" NOT NULL,
    "Patient_ID" text COLLATE pg_catalog."default" NOT NULL,
    "Employee_ID" numeric NOT NULL,
    "Medicine_ID" text COLLATE pg_catalog."default" NOT NULL,
    "Quantity" numeric NOT NULL,
    "Price" numeric NOT NULL,
    CONSTRAINT "Treatment Table_pkey" PRIMARY KEY ("Treatment_ID"),
    CONSTRAINT "Doctor_ID" FOREIGN KEY ("Employee_ID")
        REFERENCES public."Employee" ("Employee_ID") MATCH SIMPLE
        ON UPDATE SET DEFAULT
        ON DELETE SET DEFAULT,
    CONSTRAINT "Patient_ID" FOREIGN KEY ("Patient_ID")
        REFERENCES public."Patient" ("Patient_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."Treatment"
    OWNER to postgres;



CREATE INDEX "fki_Doctor_ID"
    ON public."Treatment" USING btree
    ("Employee_ID" ASC NULLS LAST)
    TABLESPACE pg_default;


CREATE INDEX "fki_Patient_ID"
    ON public."Treatment" USING btree
    ("Patient_ID" COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;