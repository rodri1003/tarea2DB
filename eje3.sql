CREATE VIEW RentalStatus AS
SELECT 
    r.RentalID,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    r.CarID,
    r.RentalDate,
    r.ReturnDate,
    CASE 
        WHEN r.ReturnDate IS NULL OR r.ReturnDate > GETDATE() THEN 'Sí'
        ELSE 'No'
    END AS IsRented
FROM 
    dbo.Rentals r
JOIN 
    dbo.Customers c ON r.CustomerID = c.CustomerID;

SELECT * FROM RentalStatus