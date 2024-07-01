CREATE TABLE IF NOT EXISTS "bank_details" (
  "id" INTEGER,
  "crypto_address" varchar(255) DEFAULT NULL,

  CONSTRAINT pk_id_bank_details
    PRIMARY KEY ("id"),
  CONSTRAINT fk_user_id_bank_details
    FOREIGN KEY ("id") REFERENCES "user" ("id")
);