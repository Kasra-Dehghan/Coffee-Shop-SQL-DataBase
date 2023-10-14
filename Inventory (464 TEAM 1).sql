##Inventory Update From Order
##This code needs to be ran sequentially for it to make sense


##Step 1: Emplyoyee asks for customers name 
INSERT INTO customers (customer_id, first_name, last_name)
VALUES	
		(201, 'Josh', 'Smart');

SELECT customer_id FROM customers WHERE first_name = "Josh";

        

##Step 2: Customer orders  
##Rob wants to order a ham and cheese breakfast wrap

##Employee logs in to take order and creates new order 
Insert into orders 
(order_id, employee_id, order_date,customer_id)
VALUES
("201", "6", "2023-01-01","201"); 

#Step 3: Adds food order into system 
INSERT INTO food_order_item
(food_order_item_id, product_id, to_go, warmed_up, order_id)
VALUES
("14_2", (SELECT product_id FROM products WHERE product_name= "truffle mushroom breakfast wrap"), 'YES', 'YES', "201");


##Step 4: System checks to the food order from inventory.

SELECT 
    ii.product_name,
    il.real_time_inventory
FROM product_inventory AS pi
JOIN inventory_item AS ii ON pi.inventory_item_id = ii.inventory_item_id
JOIN inventory_level AS il ON pi.inventory_item_id = il.inventory_item_id
WHERE pi.product_id = (SELECT product_id FROM food_order_item WHERE order_id = 201);



#System deducts one from stock
UPDATE inventory_level
SET real_time_inventory = real_time_inventory - 1
WHERE inventory_item_id = (
    SELECT inventory_item_id
    FROM product_inventory
    WHERE product_id = 212
);

#Double check to see if deduct worked.

SELECT 
    ii.product_name,
    il.real_time_inventory
FROM product_inventory AS pi
JOIN inventory_item AS ii ON pi.inventory_item_id = ii.inventory_item_id
JOIN inventory_level AS il ON pi.inventory_item_id = il.inventory_item_id
WHERE pi.product_id = 212;


##Alternatively rob requests a ham and cheese sandwhich that's out of stock
#Employee/System checks to the food order from inventory and sees there is no inventory
#Rob then orders something different

SELECT 
    ii.product_name,
    il.real_time_inventory
FROM product_inventory AS pi
JOIN inventory_item AS ii ON pi.inventory_item_id = ii.inventory_item_id
JOIN inventory_level AS il ON pi.inventory_item_id = il.inventory_item_id
WHERE pi.product_id = 211;

##########################################
##########################################
##########################################
##########################################

#Step 1 Vendor Inventory Orders being generated

INSERT INTO line_item_vendor_order (lineitem, inventory_level_id, vendor_order_id, quantity, Date_time)
VALUES
    (1, 2001, 160, '50', '2023-04-02 10:00:00'),
    (2, 2002, 161, '30', '2023-04-02 10:00:00'),
    (3, 2003, 162, '20', '2023-04-02 10:00:00'),
    (4, 2004, 163, '25', '2023-04-02 10:00:00'),
    (5, 2005, 164, '15', '2023-04-02 10:00:00'),
    (6, 2006, 165, '10', '2023-04-02 10:00:00'),
    (7, 2007, 166, '30', '2023-04-02 10:00:00'),
    (8, 2008, 167, '35', '2023-04-02 10:00:00'),
    (9, 2009, 168, '25', '2023-04-02 10:00:00'),
    (10, 2010, 169, '20', '2023-04-02 10:00:00');


SELECT lineitem, inventory_level_id, vendor_order_id, quantity FROM line_item_vendor_order;


## Step 2 
## vendor_order_ids for inventory being genderated can use this to view vendor orders and contact if needed.

SELECT iv.vendor_order_id, v.vendor_name, v.contact_person, v.phone_number, v.email
FROM inventory_vendor_order iv
JOIN vendor v ON iv.vendor_id = v.vendor_id;




##########################################
##########################################
##########################################
##########################################










