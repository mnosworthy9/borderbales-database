INSERT INTO "user" ("first_name", "last_name", "email", "username", "password")
VALUES('Matthew', 'Nosworthy', 'mnosworthy007@gmail.com', 'matty', 'password')
RETURNING "id";

INSERT INTO "user" ("first_name", "last_name", "email", "username", "password", "is_admin")
VALUES('Matthew', 'Nosworthy', 'mnosworthy008@gmail.com', 'matty2', 'password', true)
RETURNING "id";

INSERT INTO "product" ("user_id", "name", "price", "description", "stock")
VALUES (10000, 'bench', 20, 'really good', 10)
RETURNING "id";

insert into "product_review" ("product_id", "user_id", "rating", "review")
VALUES (1, 10000, 5, 'this is a review')
RETURNING "id";

INSERT INTO "image" ("id", "bucket", "key")
VALUES (1, 'https://s3.amazonaws.com/matthew-nosworthy-images', 'grass.jpg');

INSERT INTO "order" ("user_id", "product_id", "quantity", "price")
VALUES (10000, 1, 1, 20)
RETURNING "id";