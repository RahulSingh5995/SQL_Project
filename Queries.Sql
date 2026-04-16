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


-- 4. Who is the senior most employee based on job title?
-- (Assuming higher-level titles like 'General Manager' are senior)
SELECT *
FROM Employee
ORDER BY Title DESC
LIMIT 1;

-- 5. Which city has the best customers?
-- (City with highest total invoice revenue)
SELECT BillingCity, SUM(Total) AS total_revenue
FROM Invoice
GROUP BY BillingCity
ORDER BY total_revenue DESC
LIMIT 1;


-- =====================================================
-- 🟡 MEDIUM LEVEL QUERIES
-- =====================================================

-- 1. Which city generates the highest revenue?
SELECT BillingCity, SUM(Total) AS revenue
FROM Invoice
GROUP BY BillingCity
ORDER BY revenue DESC
LIMIT 1;


-- 2. Who are the best customers? (Top 5 by total spending)
SELECT c.CustomerId, c.FirstName, c.LastName, SUM(i.Total) AS total_spent
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId, c.FirstName, c.LastName
ORDER BY total_spent DESC
LIMIT 5;


-- 3. What are the most popular music genres?
SELECT g.Name AS genre, COUNT(il.Quantity) AS total_purchases
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY total_purchases DESC;

-- 4. Return email, first name, last name & Genre of all Rock Music listeners
-- Ordered alphabetically by email starting with A

SELECT DISTINCT c.Email, c.FirstName, c.LastName, g.Name AS Genre
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
JOIN Track t ON il.TrackId = t.TrackId
JOIN Genre g ON t.GenreId = g.GenreId
WHERE g.Name = 'Rock'
  AND c.Email LIKE 'A%'
ORDER BY c.Email ASC;


-- 5. Top 10 artists who have written the most Rock music

SELECT ar.Name AS artist_name, COUNT(t.TrackId) AS total_tracks
FROM Artist ar
JOIN Album al ON ar.ArtistId = al.ArtistId
JOIN Track t ON al.AlbumId = t.AlbumId
JOIN Genre g ON t.GenreId = g.GenreId
WHERE g.Name = 'Rock'
GROUP BY ar.Name
ORDER BY total_tracks DESC
LIMIT 10;


-- 6. Tracks longer than average song length

SELECT Name, Milliseconds
FROM Track
WHERE Milliseconds > (
    SELECT AVG(Milliseconds) FROM Track
)
ORDER BY Milliseconds DESC;


-- =====================================================
-- 🔴 ADVANCED LEVEL QUERIES
-- =====================================================

-- 1. What is the total amount spent by each customer? Show only customers who spent more than $40.
WITH customer_totals AS (
    SELECT
        c.FirstName || ' ' || c.LastName AS CustomerName,
        SUM(i.Total) AS TotalSpent
    FROM Customer c
    JOIN Invoice i ON i.CustomerId = c.CustomerId
    GROUP BY c.CustomerId
)
SELECT CustomerName, ROUND(TotalSpent, 2) AS TotalSpent
FROM   customer_totals
WHERE  TotalSpent > 40
ORDER BY TotalSpent DESC;


-- 2. Rank all customers by how much they've spent, from highest to lowest.
SELECT
    c.FirstName || ' ' || c.LastName AS CustomerName,
    ROUND(SUM(i.Total), 2) AS TotalSpent,
    RANK() OVER (ORDER BY SUM(i.Total) DESC) AS SpendRank
FROM Customer c
JOIN Invoice i ON i.CustomerId = c.CustomerId
GROUP BY c.CustomerId
ORDER BY SpendRank;


-- =====================================================
-- ✅ END OF FILE
-- =====================================================
