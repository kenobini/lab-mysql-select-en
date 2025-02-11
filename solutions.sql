USE sakila;
SHOW TABLES;
SELECT 
    a.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    t.title AS 'TITLE',
    p.pub_name AS 'PUBLISHER'
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id;

DESCRIBE authors;
SELECT 
    a.au_id AS author_id,       
    a.au_lname AS last_name,      
    a.au_fname AS first_name,     
    p.pub_name,
    COUNT(t.title_id) AS title_count
FROM 
    authors a
JOIN 
    titleauthor ta ON a.au_id = ta.au_id     
JOIN 
    titles t ON ta.title_id = t.title_id
JOIN 
    publishers p ON t.pub_id = p.pub_id
GROUP BY 
    a.au_id, p.pub_name   
ORDER BY 
    title_count DESC;

SELECT 
    a.au_id AS author_id,
    a.au_lname AS last_name,
    a.au_fname AS first_name,
    SUM(t.ytd_sales) AS total_sales
FROM 
    authors a
JOIN 
    titleauthor ta ON a.au_id = ta.au_id
JOIN 
    titles t ON ta.title_id = t.title_id
GROUP BY 
    a.au_id
ORDER BY 
    total_sales DESC
LIMIT 3;

SELECT 
    a.au_id AS author_id,
    a.au_lname AS last_name,
    a.au_fname AS first_name,
    COALESCE(SUM(t.ytd_sales), 0) AS total_sales  
FROM 
    authors a
LEFT JOIN  
    titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN 
    titles t ON ta.title_id = t.title_id
GROUP BY 
    a.au_id
ORDER BY 
    total_sales DESC;


