CREATE TABLE IF NOT EXISTS "product_review"(
  "id" INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
  "product_id" INTEGER,
  "user_id" INTEGER,
  "rating" INTEGER,
  "review" VARCHAR(1000),
  "created_at" DATE DEFAULT NOW()::DATE,

  CONSTRAINT pk_id_product_review
    PRIMARY KEY ("id"),
  CONSTRAINT fk_product_id_product_review
    FOREIGN KEY ("product_id")
    REFERENCES "product"("id"),
  CONSTRAINT fk_user_id_product_review
    FOREIGN KEY ("user_id")
    REFERENCES "user"("id"),
  CONSTRAINT nn_rating_product_review
    CHECK ("rating" >= 0 AND "rating" <= 5 and "rating" IS NOT NULL),
  CONSTRAINT nn_created_at_product_review
    CHECK ("created_at" IS NOT NULL)
);
