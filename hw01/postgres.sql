CREATE TABLE "categories" (
  "category_id" SERIAL PRIMARY KEY,
  "description" text NOT NULL
);

CREATE TABLE "manufacturers" (
  "manufacturer_id" SERIAL PRIMARY KEY,
  "description" text NOT NULL
);

CREATE TABLE "products" (
  "product_id" SERIAL PRIMARY KEY,
  "category_id" int NOT NULL,
  "manufacturer_id" int NOT NULL,
  "description" text NOT NULL
);

CREATE TABLE "suppliers" (
  "supplier_id" SERIAL PRIMARY KEY,
  "description" text NOT NULL
);

CREATE TABLE "prices" (
  "price_id" SERIAL PRIMARY KEY,
  "product_id" int NOT NULL,
  "supplier_id" int NOT NULL,
  "price" numeric DEFAULT 0
);

CREATE TABLE "buyers" (
  "buyer_id" SERIAL PRIMARY KEY,
  "description" text NOT NULL
);

CREATE TABLE "sales" (
  "sale_id" SERIAL PRIMARY KEY,
  "buyer_id" int NOT NULL,
  "price_id" int NOT NULL,
  "date" timestamp NOT NULL
);

ALTER TABLE "products" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("category_id");

ALTER TABLE "products" ADD FOREIGN KEY ("manufacturer_id") REFERENCES "manufacturers" ("manufacturer_id");

ALTER TABLE "prices" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("product_id");

ALTER TABLE "prices" ADD FOREIGN KEY ("supplier_id") REFERENCES "suppliers" ("supplier_id");

ALTER TABLE "sales" ADD FOREIGN KEY ("buyer_id") REFERENCES "buyers" ("buyer_id");

ALTER TABLE "sales" ADD FOREIGN KEY ("price_id") REFERENCES "prices" ("price_id");
