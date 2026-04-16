-- =====================================================
-- 🎵 Online Music Store Analysis (Chinook Database)
-- 📌 Author: Rahul Singh
-- 📌 Description: SQL queries to analyze customer behavior,
-- sales trends, and business insights
-- =====================================================


-- =====================================================
-- 🟢 EASY LEVEL QUERIES
-- =====================================================

-- 1. Who is the senior-most employee?
SELECT *
FROM Employee
ORDER BY HireDate ASC
LIMIT 1;


-- 2. Which country has the most invoices?
SELECT BillingCountry, COUNT(*) AS total_invoices
FROM Invoice
GROUP BY BillingCountry
ORDER BY total_invoices DESC
LIMIT 1;


-- 3. What are the top 3 invoice totals?
SELECT Total
FROM Invoice
ORDER BY Total DESC
LIMIT 3;



-- =====================================================
-- 🟡 MEDIUM LEVEL QUERIES
-- =====================================================

-- 4. Which city generates the highest revenue?
SELECT BillingCity, SUM(Total) AS revenue
FROM Invoice
GROUP BY BillingCity
ORDER BY revenue DESC
LIMIT 1;


-- 5. Who are the best customers? (Top 5 by total spending)
SELECT c.CustomerId, c.FirstName, c.LastName, SUM(i.Total) AS total_spent
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId, c.FirstName, c.LastName
ORDER BY total_spent DESC
LIMIT 5;


-- 6. What are the most popular music genres?
SELECT g.Name AS genre, COUNT(il.Quantity) AS total_purchases
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY total_purchases DESC;



-- =====================================================
-- 🔴 ADVANCED LEVEL QUERIES
-- =====================================================

-- 7. Identify the top 10% customers based on spending
WITH customer_spending AS (
    SELECT c.CustomerId, SUM(i.Total) AS total_spent
    FROM Customer c
    JOIN Invoice i ON c.CustomerId = i.CustomerId
    GROUP BY c.CustomerId
),
ranked_customers AS (
    SELECT *,
           NTILE(10) OVER (ORDER BY total_spent DESC) AS percentile
    FROM customer_spending
)
SELECT *
FROM ranked_customers
WHERE percentile = 1;


-- 8. Find the most profitable artist
SELECT ar.Name AS artist, SUM(il.UnitPrice * il.Quantity) AS revenue
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN Artist ar ON al.ArtistId = ar.ArtistId
GROUP BY ar.Name
ORDER BY revenue DESC
LIMIT 1;


-- 9. Analyze customer purchase patterns across regions
SELECT c.Country, COUNT(i.InvoiceId) AS total_orders, SUM(i.Total) AS total_revenue
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.Country
ORDER BY total_revenue DESC;


-- =====================================================
-- ✅ END OF FILE
-- =====================================================
