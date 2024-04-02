create database db;
use db;

CREATE TABLE User (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),
    email VARCHAR(100),
    role VARCHAR(20)
);

CREATE TABLE Donor (
    donor_id INT PRIMARY KEY,
    user_id INT,
    donor_name VARCHAR(100),
    contact_number VARCHAR(20),
    address VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE Recipient (
    recipient_id INT PRIMARY KEY,
    user_id INT,
    recipient_name VARCHAR(100),
    contact_number VARCHAR(20),
    address VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE FoodItem (
    food_id INT PRIMARY KEY,
    donor_id INT,
    food_name VARCHAR(100),
    food_description VARCHAR(255),
    quantity INT,
    expiry_date DATE,
    FOREIGN KEY (donor_id) REFERENCES Donor(donor_id)
);

CREATE TABLE Donation (
    donation_id INT PRIMARY KEY,
    donor_id INT,
    recipient_id INT,
    donation_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (donor_id) REFERENCES Donor(donor_id),
    FOREIGN KEY (recipient_id) REFERENCES Recipient(recipient_id)
);

CREATE TABLE Delivery (
    delivery_id INT PRIMARY KEY,
    donation_id INT,
    delivery_date DATE,
    delivery_status VARCHAR(50),
    FOREIGN KEY (donation_id) REFERENCES Donation(donation_id)
);

CREATE TABLE Feedback (
    feedback_id INT PRIMARY KEY,
    user_id INT,
    feedback_message TEXT,
    feedback_date DATE,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE Admin (
    admin_id INT PRIMARY KEY,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE FoodCategory (
    food_category_id INT PRIMARY KEY,
    food_id INT,
    category_id INT,
    FOREIGN KEY (food_id) REFERENCES FoodItem(food_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

INSERT INTO User (user_id, username, password, email, role) VALUES
(1, 'JohnDoe', 'password123', 'john.doe@example.com', 'donor'),
(2, 'JaneSmith', 'qwerty456', 'jane.smith@example.com', 'recipient'),
(3, 'AliceJohnson', 'abcdef789', 'alice.johnson@example.com', 'donor'),
(4, 'DavidBrown', '123456xyz', 'david.brown@example.com', 'recipient'),
(5, 'EmilyWilson', 'password321', 'emily.wilson@example.com', 'donor'),
(6, 'MichaelDavis', 'pass123word', 'michael.davis@example.com', 'recipient'),
(7, 'SamanthaTaylor', 'abcxyz789', 'samantha.taylor@example.com', 'donor'),
(8, 'DanielClark', 'daniel123', 'daniel.clark@example.com', 'recipient'),
(9, 'JenniferMartinez', 'qwerty789', 'jennifer.martinez@example.com', 'donor'),
(10, 'ChristopherLee', 'password789', 'christopher.lee@example.com', 'recipient'),
(11, 'AmandaWhite', 'abcdef123', 'amanda.white@example.com', 'donor'),
(12, 'MatthewHall', 'pass789word', 'matthew.hall@example.com', 'recipient'),
(13, 'JessicaLopez', '123456abc', 'jessica.lopez@example.com', 'donor'),
(14, 'AndrewKing', 'andrew123', 'andrew.king@example.com', 'recipient'),
(15, 'SarahGarcia', 'pass456word', 'sarah.garcia@example.com', 'donor'),
(16, 'JamesAnderson', 'passwordabc', 'james.anderson@example.com', 'recipient'),
(17, 'ElizabethMartinez', 'elizabeth123', 'elizabeth.martinez@example.com', 'donor'),
(18, 'RyanTaylor', 'passxyzword', 'ryan.taylor@example.com', 'recipient'),
(19, 'LaurenHernandez', 'lauren123', 'lauren.hernandez@example.com', 'donor'),
(20, 'BrandonYoung', 'pass123xyz', 'brandon.young@example.com', 'recipient');

INSERT INTO Donor (donor_id, user_id, donor_name, contact_number, address) VALUES
(1, 1, 'John Doe Foundation', '+1234567890', '123 Main Street, Cityville, USA'),
(2, 3, 'Alices Restaurant', '+1987654321', '456 Elm Street, Townsville, USA'),
(3, 5, 'Emilys Catering', '+1122334455', '789 Oak Avenue, Villagetown, USA'),
(4, 7, 'Samanthas Bakery', '+1567890123', '234 Maple Drive, Hamletville, USA'),
(5, 9, 'Jennifers Food Bank', '+1324354657', '567 Pine Lane, Boroughburg, USA'),
(6, 11, 'Amandas Café', '+1789456123', '890 Cedar Road, Villageville, USA'),
(7, 13, 'Jessicas Diner', '+1246384756', '345 Cherry Street, Townburg, USA'),
(8, 15, 'Sarahs Soup Kitchen', '+1987654321', '678 Walnut Avenue, Citytown, USA'),
(9, 17, 'Elizabeths Eatery', '+1122334455', '901 Pine Street, Countyville, USA'),
(10, 19, 'Laurens Deli', '+1876543210', '234 Oak Lane, Villagetown, USA');

INSERT INTO Recipient (recipient_id, user_id, recipient_name, contact_number, address) VALUES
(1, 2, 'Janes Shelter', '+1234567890', '123 Shelter Street, Cityville, USA'),
(2, 4, 'Davids Homeless Center', '+1987654321', '456 Hope Avenue, Townsville, USA'),
(3, 6, 'Michaels Soup Kitchen', '+1122334455', '789 Nourish Lane, Villagetown, USA'),
(4, 8, 'Daniels Food Pantry', '+1567890123', '234 Care Drive, Hamletville, USA'),
(5, 10, 'Chriss Community Kitchen', '+1324354657', '567 Nourishment Boulevard, Boroughburg, USA'),
(6, 12, 'Matthews Outreach Center', '+1789456123', '890 Serve Road, Villageville, USA'),
(7, 14, 'Andrews Hunger Relief', '+1246384756', '345 Caregiver Street, Townburg, USA'),
(8, 16, 'Jamess Assistance Program', '+1987654321', '678 Aid Avenue, Citytown, USA'),
(9, 18, 'Ryans Food Bank', '+1122334455', '901 Give Street, Countyville, USA'),
(10, 20, 'Brandons Nourish Fund', '+1876543210', '234 Serve Lane, Villagetown, USA');

INSERT INTO FoodItem (food_id, donor_id, food_name, food_description, quantity, expiry_date) VALUES
(1, 1, 'Canned Soup', 'Various flavors of canned soup', 100, '2024-04-30'),
(2, 2, 'Fresh Bread', 'Assorted loaves of freshly baked bread', 50, '2024-05-02'),
(3, 3, 'Frozen Vegetables', 'Mixed vegetables frozen for preservation', 75, '2024-04-28'),
(4, 4, 'Dessert Bars', 'Chocolate and vanilla dessert bars', 80, '2024-05-01'),
(5, 5, 'Canned Tuna', 'Canned tuna packed in water', 120, '2024-04-29'),
(6, 6, 'Fresh Fruits', 'Assorted fresh fruits including apples, oranges, and bananas', 60, '2024-05-03'),
(7, 7, 'Bakery Pastries', 'Freshly baked pastries including croissants and muffins', 90, '2024-04-30'),
(8, 8, 'Frozen Pizza', 'Assorted flavors of frozen pizzas', 70, '2024-04-27'),
(9, 9, 'Canned Vegetables', 'Various types of canned vegetables', 110, '2024-05-01'),
(10, 10, 'Deli Sandwiches', 'Assorted deli sandwiches with different fillings', 65, '2024-04-28');

INSERT INTO Donation (donation_id, donor_id, recipient_id, donation_date, status) VALUES
(1, 1, 1, '2024-04-15', 'Delivered'),
(2, 2, 2, '2024-04-16', 'In Transit'),
(3, 3, 3, '2024-04-17', 'Pending'),
(4, 4, 4, '2024-04-18', 'Delivered'),
(5, 5, 5, '2024-04-19', 'In Transit'),
(6, 6, 6, '2024-04-20', 'Pending'),
(7, 7, 7, '2024-04-21', 'Delivered'),
(8, 8, 8, '2024-04-22', 'In Transit'),
(9, 9, 9, '2024-04-23', 'Pending'),
(10, 10, 10, '2024-04-24', 'Delivered');

INSERT INTO Delivery (delivery_id, donation_id, delivery_date, delivery_status) VALUES
(1, 1, '2024-04-16', 'Delivered'),
(2, 3, '2024-04-18', 'In Transit'),
(3, 5, '2024-04-20', 'Pending'),
(4, 7, '2024-04-22', 'Delivered'),
(5, 9, '2024-04-24', 'In Transit'),
(6, 2, '2024-04-17', 'Pending'),
(7, 4, '2024-04-19', 'Delivered'),
(8, 6, '2024-04-21', 'In Transit'),
(9, 8, '2024-04-23', 'Pending'),
(10, 10, '2024-04-25', 'Delivered');

INSERT INTO Feedback (feedback_id, user_id, feedback_message, feedback_date) VALUES
(1, 1, 'Great experience with the donation process. Thank you!', '2024-04-20'),
(2, 3, 'The food received was fresh and delicious. Very grateful!', '2024-04-22'),
(3, 5, 'Appreciate the timely delivery of the food items. Excellent service!', '2024-04-24'),
(4, 7, 'The food quality could be improved. Some items were nearing expiry.', '2024-04-26'),
(5, 9, 'Received a variety of food items. Thank you for your generosity!', '2024-04-28');

INSERT INTO Admin (admin_id, user_id) VALUES
(1234, 2),
(5678, 6),
(9876, 10);

INSERT INTO Category (category_id, category_name) VALUES
(1, 'Canned Goods'),
(2, 'Bakery Items'),
(3, 'Fresh Produce'),
(4, 'Frozen Foods'),
(5, 'Desserts');

INSERT INTO FoodCategory (food_category_id, food_id, category_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 5),
(5, 5, 1),
(6, 6, 3),
(7, 7, 2),
(8, 8, 4),
(9, 9, 1),
(10, 10, 2);

select * from User;
select * from Donor;
select * from Recipient;
select * from FoodItem;
select * from Donation;
select * from Delivery;
select * from Feedback;
select * from Admin;
select * from Category;
select * from FoodCategory;

SELECT u.username, u.email, u.role
   FROM User u;

SELECT d.donor_name, d.address, fi.food_name, fi.quantity, fi.expiry_date
   FROM Donor d
   JOIN FoodItem fi ON d.donor_id = fi.donor_id;

SELECT r.recipient_name, r.address, d.status
   FROM Recipient r
   JOIN Donation d ON r.recipient_id = d.recipient_id;

SELECT u.username, f.feedback_message, f.feedback_date
   FROM User u
   JOIN Feedback f ON u.user_id = f.user_id;

SELECT fi.food_name, c.category_name
   FROM FoodItem fi
   JOIN FoodCategory fc ON fi.food_id = fc.food_id
   JOIN Category c ON fc.category_id = c.category_id;
   
SELECT d.donation_date, d.status
   FROM Donation d
   JOIN Donor dr ON d.donor_id = dr.donor_id
   WHERE dr.donor_name = 'John Doe Foundation';
   
SELECT d.delivery_date, d.delivery_status
   FROM Delivery d
   WHERE d.delivery_date = '2024-04-22';

SELECT fi.food_name, SUM(fi.quantity) AS total_quantity
   FROM FoodItem fi
   GROUP BY fi.food_name;

SELECT d.donor_name, AVG(fi.quantity) AS average_quantity
   FROM Donor d
   JOIN FoodItem fi ON d.donor_id = fi.donor_id
   GROUP BY d.donor_name;

SELECT d.donor_name, COUNT(*) AS donation_count
    FROM Donor d
    JOIN Donation dn ON d.donor_id = dn.donor_id
    GROUP BY d.donor_name;
    
SELECT r.recipient_name, d.donation_date
    FROM Recipient r
    JOIN Donation d ON r.recipient_id = d.recipient_id
    WHERE d.status = 'Pending';

SELECT d.donor_name, d.contact_number
    FROM Donor d;

SELECT r.recipient_name, r.address
    FROM Recipient r;

    SELECT u.username, f.feedback_message, f.feedback_date
    FROM User u
    JOIN Feedback f ON u.user_id = f.user_id
    WHERE f.feedback_date = (
        SELECT MAX(feedback_date)
        FROM Feedback
        WHERE user_id = u.user_id
    );
    
SELECT d.donor_name, fi.food_name
    FROM Donor d
    JOIN FoodItem fi ON d.donor_id = fi.donor_id
    WHERE fi.food_name = 'Canned Soup';
    
SELECT r.recipient_name, dn.donation_date
FROM Recipient r
JOIN Donation dn ON r.recipient_id = dn.recipient_id
WHERE dn.donation_date = '2024-04-20';

SELECT c.category_name, AVG(fi.quantity) AS average_quantity
FROM Category c
JOIN FoodCategory fc ON c.category_id = fc.category_id
JOIN FoodItem fi ON fc.food_id = fi.food_id
GROUP BY c.category_name;

SELECT d.donor_name, fi.food_name, fi.quantity
    FROM Donor d
    JOIN FoodItem fi ON d.donor_id = fi.donor_id
    WHERE fi.quantity > 50;
    
SELECT r.recipient_name, d.delivery_date
    FROM Recipient r
    JOIN Donation dn ON r.recipient_id = dn.recipient_id
    JOIN Delivery d ON dn.donation_id = d.donation_id
    WHERE d.delivery_status = 'Pending';

SELECT r.recipient_name, COUNT(dn.donation_id) AS donation_count
    FROM Recipient r
    JOIN Donation dn ON r.recipient_id = dn.recipient_id
    GROUP BY r.recipient_name;







