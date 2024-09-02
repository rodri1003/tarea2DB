CREATE VIEW CarRentals AS
SELECT 
    c.CarID,
    c.Make,
    c.Model,
    c.Year,
    COUNT(r.RentalID) AS TimesRented,
    ISNULL(AVG(r.TotalAmount), 0) AS AverageIncome
FROM 
    dbo.Cars c
LEFT JOIN 
    dbo.Rentals r ON c.CarID = r.CarID
GROUP BY 
    c.CarID, 
    c.Make, 
    c.Model, 
    c.Year;

SELECT * FROM CarRentals