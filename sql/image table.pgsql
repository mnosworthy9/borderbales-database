-- trying to store in S3

CREATE TABLE IF NOT EXISTS "image"(
  "id" INTEGER,
  "url" VARCHAR(255) DEFAULT NULL,
  "bucket" VARCHAR(255) DEFAULT NULL,
  "key" VARCHAR(255) DEFAULT NULL,

  CONSTRAINT pk_id_image
    PRIMARY KEY("id"),
  CONSTRAINT fk_id_image
    FOREIGN KEY("id")
    REFERENCES "product"("id")
);