-- Question one  Achiveing 1NF (First Normal Form)
SELECT 
    OrderID,
    CustomerName,
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Products, ',', numbers.n), ',', -1)) AS Product
FROM 
    ProductDetail
JOIN (
    SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
) AS numbers
ON CHAR_LENGTH(Products) - CHAR_LENGTH(REPLACE(Products, ',', '')) >= numbers.n - 1;


-- Question 2 Achieveing 2NF (Second Normal Form)
-- Create Orders table( unique OrderID to CustmerName  mapping)

SELECT DISTINCT OrderID, CustomerName
 FROM OrderDetails;

-- Create OrderItems table ( remove CustomerName, Keep OrderID, Product Quantity)

SELECT OrderID, Product, Quantity
FROM OrderDetails;
