-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

DROP DATABASE IF EXISTS med_center;

CREATE DATABASE med_center;

\c med_center


CREATE TABLE "MedCenter" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    "address" text   NOT NULL,
    CONSTRAINT "pk_MedCenter" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Doctor" (
    "id" serial   NOT NULL,
    "med_center_id" INTEGER   NOT NULL,
    "name" text   NOT NULL,
    "practice" text   NOT NULL,
    CONSTRAINT "pk_Doctor" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Patient" (
    "id" serial   NOT NULL,
    "doctor_id" INTEGER   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_Patient" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Visits" (
    "id" serial   NOT NULL,
    "patient_id" INTEGER   NOT NULL,
    "doctor_id" INTEGER   NOT NULL,
    "disease_id" INTEGER   NOT NULL,
    "summary" text   NOT NULL,
    CONSTRAINT "pk_Visits" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Disease" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    "description" text   NOT NULL,
    CONSTRAINT "pk_Disease" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Doctor" ADD CONSTRAINT "fk_Doctor_med_center_id" FOREIGN KEY("med_center_id")
REFERENCES "MedCenter" ("id");

ALTER TABLE "Patient" ADD CONSTRAINT "fk_Patient_doctor_id" FOREIGN KEY("doctor_id")
REFERENCES "Doctor" ("id");

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_patient_id" FOREIGN KEY("patient_id")
REFERENCES "Patient" ("id");

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_doctor_id" FOREIGN KEY("doctor_id")
REFERENCES "Doctor" ("id");

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_disease_id" FOREIGN KEY("disease_id")
REFERENCES "Disease" ("id");


INSERT INTO "MedCenter" (name, address) VALUES
  ('MedCenter', '546 Main Street');

INSERT INTO "Doctor" (med_center_id, name, practice) VALUES
  (2, 'Doctor MD', 'Dermatology');

INSERT INTO "Patient" (doctor_id, name) VALUES
  (1, 'Patient Name');

INSERT INTO "Disease" (name, description) VALUES
  ('Disease', 'New  Disease'); 

INSERT INTO "Visits" (patient_id, doctor_id, disease_id, summary) VALUES
  (1, 1, 1, 'Summary');    


  

