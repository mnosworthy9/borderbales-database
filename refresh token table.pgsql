CREATE TABLE IF NOT EXISTS "refresh_token" (
  "id" INTEGER,
  "token" varchar(255) DEFAULT NULL,
  "created_at" timestamp DEFAULT now(),

  CONSTRAINT pk_id_refresh_token
    PRIMARY KEY ("id"),
  CONSTRAINT fk_user_id_refresh_token
    FOREIGN KEY ("id") REFERENCES "user" ("id")
);