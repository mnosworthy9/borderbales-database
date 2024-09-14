CREATE TABLE IF NOT EXISTS "user" (
  "id" INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 10000 INCREMENT BY 1),
  "first_name" varchar(50) DEFAULT NULL,
  "last_name" varchar(50) DEFAULT NULL,
  "username" varchar(100),
  "email" varchar(100),
  "password" varchar(255),
  "reputation" decimal(5,2) DEFAULT 100.00,
  "sales" INTEGER DEFAULT 0,
  "is_admin" BOOLEAN DEFAULT FALSE,
  "created_at" timestamp DEFAULT now(),

  CONSTRAINT pk_id_user
    PRIMARY KEY ("id"),
  CONSTRAINT unq_username_user
    UNIQUE ("username"),
  CONSTRAINT unq_email_user
    UNIQUE("email"),
  CONSTRAINT nn_email_user
    CHECK ("email" IS NOT NULL),
  CONSTRAINT nn_password_user
    CHECK ("password" IS NOT NULL),
  CONSTRAINT nn_reputaion_user
    CHECK ("reputation" IS NOT NULL),
  CONSTRAINT nn_created_at_user
    CHECK ("created_at" IS NOT NULL),
  CONSTRAINT rng_reputation_user
    CHECK ("reputation" >= 0.00 AND "reputation" <= 100.00),
  CONSTRAINT nn_sales_user
    CHECK ("sales" IS NOT NULL),
  CONSTRAINT nn_is_admin_user
    CHECK ("is_admin" IS NOT NULL)
);