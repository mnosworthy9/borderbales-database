CREATE TABLE IF NOT EXISTS "refresh_token" (
  "id" INTEGER,
  "token" varchar(255) DEFAULT NULL,
  "created_at" timestamp DEFAULT now(),

  CONSTRAINT pk_id_refresh_token
    PRIMARY KEY ("id"),
  CONSTRAINT fk_user_id_refresh_token
    FOREIGN KEY ("id") REFERENCES "user" ("id")
);

ALTER TABLE "refresh_token" ADD 
  CONSTRAINT user_id_unique
    UNIQUE ("id");

CREATE OR REPLACE FUNCTION upsert_refresh_token(user_id INT, token TEXT)
RETURNS BOOLEAN AS $$
BEGIN
  INSERT INTO "refresh_token" ("id", "token")
  VALUES (user_id, token)
  ON CONFLICT ("id") DO UPDATE
  SET "token" = EXCLUDED."token";

  RETURN TRUE;
EXCEPTION
  WHEN OTHERS THEN
    RETURN FALSE;
END;
$$ LANGUAGE plpgsql;