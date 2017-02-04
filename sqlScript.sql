CREATE TABLE item_prices (item_name VARCHAR (11), item_cost varchar (2));

CREATE TABLE company_details(
company_name VARCHAR (20),
company_symbol VARCHAR (100),
off_percentage INT,
banner_text VARCHAR (350)
);

CREATE TABLE order_address (
init INT PRIMARY KEY, 
order_id VARCHAR (10) NOT NULL, 
add1 VARCHAR (100) NOT NULL, 
add2 VARCHAR (100) NOT NULL
);


INSERT INTO company_details (company_name, company_symbol, off_percentage, banner_text, minimum_order_cost)
VALUES ("Cleany Clean", "/visuals/cmpny-image", 40, "Get 40% OFF on your first order!!",100);


INSERT INTO item_prices (item_name, item_cost) VALUE ("T-Shirt","15");
INSERT INTO item_prices (item_name, item_cost) VALUE ("Shirt","15");
INSERT INTO item_prices (item_name, item_cost) VALUE ("Pant","20");
INSERT INTO item_prices (item_name, item_cost) VALUE ("Jeans","25");
INSERT INTO item_prices (item_name, item_cost) VALUE ("Casual-Coat","35");
INSERT INTO item_prices (item_name, item_cost) VALUE ("Formal-Coat","35");
INSERT INTO item_prices (item_name, item_cost) VALUE ("Sweater","20");
INSERT INTO item_prices (item_name, item_cost) VALUE ("Jacket","30");
INSERT INTO item_prices (item_name, item_cost) VALUE ("Blanket-Large","40");
INSERT INTO item_prices (item_name, item_cost) VALUE ("Blanket-Heavy","50");
INSERT INTO item_prices (item_name, item_cost) VALUE ("Blanket-Luxary","50");
INSERT INTO item_prices (item_name, item_cost) VALUE ("Others","30");