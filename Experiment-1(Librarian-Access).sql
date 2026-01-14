SELECT * FROM books;

INSERT INTO books VALUES(130,'mowgli','clearstone',4);

UPDATE books
SET NAME='panchtantra'
WHERE ID=120;

INSERT INTO books VALUES(110,'STEVE ROLLS','ROLL CLANS',2);
INSERT INTO books VALUES(150,'THE LORD','J.R.R',7);

DELETE FROM books
WHERE ID=150;

SELECT * FROM book_issue;
SELECT * FROM library_visitor;
