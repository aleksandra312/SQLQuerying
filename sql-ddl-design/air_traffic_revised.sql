-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "customers" (
    "id" int   NOT NULL,
    "first_name" text   NOT NULL,
    "last_name" text   NOT NULL,
    CONSTRAINT "pk_customers" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "airlines" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_airlines" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "tickets" (
    "id" int   NOT NULL,
    "seat" text   NOT NULL,
    "arrival" text   NOT NULL,
    "departure" text   NOT NULL,
    "customer_id" int   NOT NULL,
    "airline_id" int   NOT NULL,
    "city_id" int   NOT NULL,
    CONSTRAINT "pk_tickets" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "countries" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_countries" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "cities" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    "country_id" int   NOT NULL,
    CONSTRAINT "pk_cities" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "tickets" ADD CONSTRAINT "fk_tickets_customer_id" FOREIGN KEY("customer_id")
REFERENCES "customers" ("id");

ALTER TABLE "tickets" ADD CONSTRAINT "fk_tickets_airline_id" FOREIGN KEY("airline_id")
REFERENCES "airlines" ("id");

ALTER TABLE "tickets" ADD CONSTRAINT "fk_tickets_city_id" FOREIGN KEY("city_id")
REFERENCES "cities" ("id");

ALTER TABLE "cities" ADD CONSTRAINT "fk_cities_country_id" FOREIGN KEY("country_id")
REFERENCES "countries" ("id");

