	-- Run this against the electronic_shop.mdf that appears under Data Connections.
	-- Adds sample products for Mobile, TV, Fridge categories.

INSERT INTO Products (ProductName, Price, ImageUrl, Category) VALUES('Samsung Galaxy S21', 49999.00, 'images/mobile1.jpg', 'Mobile');
INSERT INTO Products (ProductName, Price, ImageUrl, Category) VALUES('Apple iPhone 13', 69999.00, 'images/mobile2.jpg', 'Mobile');
INSERT INTO Products (ProductName, Price, ImageUrl, Category) VALUES('OnePlus 9', 42999.00, 'images/mobile3.jpg', 'Mobile');
INSERT INTO Products (ProductName, Price, ImageUrl, Category) VALUES('LG 55-inch OLED TV', 89999.00, 'images/tv1.jpg', 'TV');
INSERT INTO Products (ProductName, Price, ImageUrl, Category) VALUES('Samsung 43-inch Smart TV', 35999.00, 'images/tv2.jpg', 'TV');
INSERT INTO Products (ProductName, Price, ImageUrl, Category) VALUES('Sony 65-inch LED TV', 109999.00, 'images/tv3.jpg', 'TV');
INSERT INTO Products (ProductName, Price, ImageUrl, Category) VALUES('Whirlpool 265L Fridge', 24999.00, 'images/fridge1.jpg', 'Fridge');
INSERT INTO Products (ProductName, Price, ImageUrl, Category) VALUES('LG 190L Single Door', 14999.00, 'images/fridge2.jpg', 'Fridge');
INSERT INTO Products (ProductName, Price, ImageUrl, Category) VALUES('Samsung 320L Frost Free', 33999.00, 'images/fridge3.jpg', 'Fridge');

-- Verify:
SELECT TOP 20 * FROM Products;	