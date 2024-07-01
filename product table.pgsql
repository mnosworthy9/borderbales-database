-- Database: website

-- Written by: Matthew Nosworthy

-- contains user table

CREATE TABLE IF NOT EXISTS "product" (
  "id" INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
  "user_id" INTEGER,
  "name" VARCHAR(100) DEFAULT 'PRODUCT NAME',
  "price"	DECIMAL(10,2) DEFAULT 10.00,
  "description"	VARCHAR(1000) DEFAULT NULL,
  "stock" INTEGER DEFAULT 1,
  "has_image" BOOLEAN DEFAULT FALSE,

  CONSTRAINT pk_id_product
    PRIMARY KEY ("id"),
  CONSTRAINT fk_admin_id_product
    FOREIGN KEY ("user_id")
    REFERENCES "user"("id"),
  CONSTRAINT nn_name_product
    CHECK("name" IS NOT NULL),
  CONSTRAINT nn_price_product
    CHECK("price" IS NOT NULL)
);