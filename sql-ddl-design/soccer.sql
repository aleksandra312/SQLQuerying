-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "teams" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_teams" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "players" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    "team_id" int   NOT NULL,
    CONSTRAINT "pk_players" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "goals" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    "player_id" int   NOT NULL,
    "match_id" int   NOT NULL,
    CONSTRAINT "pk_goals" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "matches" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    "referee_id" int   NOT NULL,
    "season_id" int   NOT NULL,
    CONSTRAINT "pk_matches" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "referees" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_referees" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "season" (
    "id" int   NOT NULL,
    "start_date" text   NOT NULL,
    "end_date" text   NOT NULL,
    CONSTRAINT "pk_season" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "results" (
    "team_id" int   NOT NULL,
    "match_id" int   NOT NULL,
    "result" text   NOT NULL
);

ALTER TABLE "players" ADD CONSTRAINT "fk_players_team_id" FOREIGN KEY("team_id")
REFERENCES "teams" ("id");

ALTER TABLE "goals" ADD CONSTRAINT "fk_goals_player_id" FOREIGN KEY("player_id")
REFERENCES "players" ("id");

ALTER TABLE "goals" ADD CONSTRAINT "fk_goals_match_id" FOREIGN KEY("match_id")
REFERENCES "matches" ("id");

ALTER TABLE "matches" ADD CONSTRAINT "fk_matches_referee_id" FOREIGN KEY("referee_id")
REFERENCES "referees" ("id");

ALTER TABLE "matches" ADD CONSTRAINT "fk_matches_season_id" FOREIGN KEY("season_id")
REFERENCES "season" ("id");

ALTER TABLE "results" ADD CONSTRAINT "fk_results_team_id" FOREIGN KEY("team_id")
REFERENCES "teams" ("id");

ALTER TABLE "results" ADD CONSTRAINT "fk_results_match_id" FOREIGN KEY("match_id")
REFERENCES "matches" ("id");

