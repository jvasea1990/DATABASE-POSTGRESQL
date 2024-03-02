CREATE TABLE IF NOT EXISTS money(
    id integer PRIMARY KEY,
    amount INTEGER NOT NULL,
    currency character varying NOT NULL
);

CREATE TABLE IF NOT EXISTS "products" (
    id integer PRIMARY KEY,
    name character varying NOT NULL,
    price_id integer
);

ALTER TABLE "products"
ADD CONSTRAINT fk_products_money FOREIGN KEY (price_id)
REFERENCES "money" (id);


CREATE TABLE  IF NOT EXISTS bags (
    id integer PRIMARY KEY,
    cost_id integer NOT NULL, 
    client_id integer
);

ALTER TABLE "bags"
ADD CONSTRAINT fk_bags_clients FOREIGN KEY (client_id) 
REFERENCES "clients"(id);
ALTER TABLE "bags"
ADD CONSTRAINT fk_bags_money FOREiGN KEY (cost_id)
REFERENCES "money" (id);


CREATE TABLE IF NOT EXISTS "bags_items" (
    id integer PRIMARY KEY,
    bag_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    CONSTRAINT fk_bags_items_products FOREIGN KEY (product_id) REFERENCES "products"(id),
    CONSTRAINT fk_bags_items_bags FOREIGN KEY (bag_id) REFERENCES "bags"(id)

);


CREATE TABLE IF NOT EXISTS stock (
    id integer PRIMARY KEY,
    product_id INTEGER,
    quantity INTEGER NOT NULL
);

ALTER TABLE "stock"
ADD CONSTRAINT fk_stock_products FOREIGN KEY (product_id)
REFERENCES "products" (id);

CREATE TABLE IF NOT EXISTS clients (
    id INTEGER PRIMARY KEY,
    fullName character varying NOT NULL,
    isVIP boolean DEFAULT false
);

CREATE TABLE IF NOT EXISTS contacts (
    id integer PRIMARY KEY,
    phoneNumber character varying NOT NULL,
    emailAddress character varying NOT NULL,
    client_id integer
);

ALTER TABLE "contacts"
ADD CONSTRAINT fk_contacts_clients FOREIGN KEY (client_id)
REFERENCES "clients" (id);