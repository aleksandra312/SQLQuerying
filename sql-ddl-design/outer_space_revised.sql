-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "planets" (
    "id" int   NOT NULL,
    "orbital_period_in_years" int   NOT NULL,
    "orbit_id" int   NOT NULL,
    "galaxy_id" int   NOT NULL,
    CONSTRAINT "pk_planets" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "orbits" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_orbits" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "galaxies" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_galaxies" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "moons" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    "planet_id" int   NOT NULL,
    CONSTRAINT "pk_moons" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "planets" ADD CONSTRAINT "fk_planets_orbit_id" FOREIGN KEY("orbit_id")
REFERENCES "orbits" ("id");

ALTER TABLE "planets" ADD CONSTRAINT "fk_planets_galaxy_id" FOREIGN KEY("galaxy_id")
REFERENCES "galaxies" ("id");

ALTER TABLE "moons" ADD CONSTRAINT "fk_moons_planet_id" FOREIGN KEY("planet_id")
REFERENCES "planets" ("id");

