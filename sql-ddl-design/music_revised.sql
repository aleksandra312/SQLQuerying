-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "songs" (
    "id" int   NOT NULL,
    "title" text   NOT NULL,
    "duration_in_seconds" int   NOT NULL,
    "release_date" text   NOT NULL,
    CONSTRAINT "pk_songs" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "artists" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    "song_id" int   NOT NULL,
    CONSTRAINT "pk_artists" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "albums" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    "artist_id" int   NOT NULL,
    CONSTRAINT "pk_albums" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "producers" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    "artist_id" int   NOT NULL,
    CONSTRAINT "pk_producers" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "artists" ADD CONSTRAINT "fk_artists_song_id" FOREIGN KEY("song_id")
REFERENCES "songs" ("id");

ALTER TABLE "albums" ADD CONSTRAINT "fk_albums_artist_id" FOREIGN KEY("artist_id")
REFERENCES "artists" ("id");

ALTER TABLE "producers" ADD CONSTRAINT "fk_producers_artist_id" FOREIGN KEY("artist_id")
REFERENCES "artists" ("id");

