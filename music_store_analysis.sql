SELECT * FROM Customer LIMIT 10;
SELECT name FROM sqlite_schema WHERE type='table';
SELECT * FROM Customer LIMIT 10;
SELECT 
    Country,
    COUNT(*) AS total_customers
FROM Customer
GROUP BY Country
ORDER BY total_customers DESC;
SELECT 
    Customer.FirstName,
    Customer.LastName,
    Customer.Country,
    ROUND(SUM(Invoice.Total), 2) AS total_spent
FROM Customer
JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
GROUP BY Customer.CustomerId
ORDER BY total_spent DESC
LIMIT 5;
SELECT 
    Genre.Name AS genre_name,
    COUNT(InvoiceLine.TrackId) AS total_tracks_sold,
    ROUND(SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity), 2) AS total_revenue
FROM InvoiceLine
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
JOIN Genre ON Track.GenreId = Genre.GenreId
GROUP BY Genre.Name
ORDER BY total_revenue DESC;
SELECT 
    STRFTIME('%Y-%m', InvoiceDate) AS month,
    ROUND(SUM(Total), 2) AS monthly_revenue,
    COUNT(*) AS total_orders
FROM Invoice
GROUP BY month
ORDER BY monthly_revenue DESC
LIMIT 10;
SELECT 
    Artist.Name AS artist_name,
    COUNT(InvoiceLine.TrackId) AS tracks_sold,
    ROUND(SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity), 2) AS total_revenue
FROM InvoiceLine
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
JOIN Album ON Track.AlbumId = Album.AlbumId
JOIN Artist ON Album.ArtistId = Artist.ArtistId
GROUP BY Artist.Name
ORDER BY total_revenue DESC
LIMIT 10;