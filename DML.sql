-- New product
BEGIN;
INSERT INTO "money" VALUES (1, 2500, 'EUR');
INSERT INTO "products" VALUES (1, 'Product 1', 1);
INSERT INTO "stock" VALUES (1,1,100);
COMMIT;

BEGIN;
INSERT INTO "money" VALUES (2, 15500, 'EUR');
INSERT INTO "products" VALUES (10, 'Product 10', 2);
INSERT INTO "stock" VALUES (2,10,200);
COMMIT;

BEGIN;
INSERT INTO "money" VALUES (12, 15500, 'EUR');
INSERT INTO "products" VALUES (12, 'Product 12', 12);
INSERT INTO "stock" VALUES (210,12,1000);
COMMIT;

BEGIN;
INSERT INTO "money" VALUES (13, 17000, 'EUR');
INSERT INTO "products" VALUES (13, 'Product 13', 13);
INSERT INTO "stock" VALUES (213,13,10000);
COMMIT;

-- New Client

INSERT INTO "clients" VALUES (1, 'John Doe', false);
INSERT INTO "contacts" VALUES (1,'+123456789', 'j@example.mail', 1);

INSERT INTO "clients" VALUES (2, 'Marry Poppins', false);
INSERT INTO "contacts" VALUES (2,'+223456789', 'mp@example.mail', 2);
INSERT INTO "contacts" VALUES (3,'+423456789', 'mp2@example.mail', 2);

-- DELTE PRODUCT

DELETE FROM stock WHERE product_id=11;
DELETE FROM products WHERE id=11;



-- Client info
SELECT * FROM "clients" JOIN "contacts" ON "clients".id = "contacts".client_id;

SELECT * FROM  "products"
JOIN "stock" on stock.product_id=products.id
JOIN "money" on "products".price_id = money.id


-- insert in BAGS

BEGIN;
INSERT INTO "money" VALUES (14, 17000*5, 'EUR');
INSERT INTO "bags" VALUES (1, 14, 2);
INSERT INTO "bags_items" VALUES (1, 1, 13, 5);
UPDATE "stock" SET quantity = quantity-5 WHERE product_id=13;
Commit;


-- UPDATE BAGS
BEGIN;
UPDATE "money" SET amount = amount +15000*10 WHERE id=14;
INSERT INTO "bags_items" VALUES (2, 1, 12, 10);
UPDATE "stock" SET quantity = quantity-10 WHERE product_id=12;
Commit;


-- show info about custmer and bag

SELECT name, quantity, amount, amount*quantity/1000, currency FROM "bags"
Join "bags_items" on "bags_items".bag_id = "bags".id
Join "products" on "bags_items".product_id = "products".id
Join "money" on "products".price_id = "money".id
WHERE "bags".client_id=2;

