CREATE VIEW CustomerPayments AS
SELECT 
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    ISNULL(SUM(p.Amount), 0) AS TotalPayments,
    MAX(p.PaymentDate) AS LastPaymentDate
FROM 
    dbo.Customers c
LEFT JOIN 
    dbo.Rentals r ON c.CustomerID = r.CustomerID
LEFT JOIN 
    dbo.Payments p ON r.RentalID = p.RentalID
GROUP BY 
    c.CustomerID, 
    c.FirstName, 
    c.LastName;


SELECT * FROM CustomerPayments