USE LibraryDB;


CREATE VIEW View_Books_With_Category AS
SELECT 
    b.book_id,
    b.title,
    c.name AS category,
    b.isbn,
    b.published_year
FROM Books b
LEFT JOIN Categories c ON b.category_id = c.category_id;


SELECT * FROM View_Books_With_Category;


CREATE VIEW View_Member_Loans AS
SELECT 
    m.member_id,
    m.name AS member_name,
    b.title AS book_title,
    l.loan_date,
    l.return_date
FROM Members m
JOIN Loans l ON m.member_id = l.member_id
JOIN Books b ON b.book_id = l.book_id;


SELECT * FROM View_Member_Loans;


CREATE VIEW View_Loan_Counts AS
SELECT 
    m.member_id,
    m.name AS member_name,
    COUNT(l.loan_id) AS total_loans
FROM Members m
LEFT JOIN Loans l ON m.member_id = l.member_id
GROUP BY m.member_id, m.name;


SELECT * FROM View_Loan_Counts;


-- View for updatable fields
CREATE VIEW View_Simple_Members AS
SELECT member_id, name, email
FROM Members;

-- Update through the view (valid)
UPDATE View_Simple_Members
SET email = 'updated_email@example.com'
WHERE name = 'Alice';


DROP VIEW View_Simple_Members;
