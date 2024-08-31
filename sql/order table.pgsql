CREATE TABLE IF NOT EXISTS "order"(
  "id" INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
  "user_id" INTEGER,
  "product_id" INTEGER,
  "quantity" INTEGER,
  "price" DECIMAL(10,2),
  "order_time" TIMESTAMP DEFAULT NOW(),

  CONSTRAINT pk_id_order
    PRIMARY KEY ("id"),
  CONSTRAINT fk_user_id_order
    FOREIGN KEY ("user_id")
    REFERENCES "user"("id"),
  CONSTRAINT fk_product_id_order
    FOREIGN KEY ("product_id")
    REFERENCES "product"("id"),
  CONSTRAINT nn_quantity_order
    CHECK ("quantity" IS NOT NULL),
  CONSTRAINT nn_price_order
    CHECK ("price" IS NOT NULL),
  CONSTRAINT nn_created_at_order
    CHECK ("order_time" IS NOT NULL)
);