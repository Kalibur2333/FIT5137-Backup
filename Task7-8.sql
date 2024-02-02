
select count (*) from article;
select count (*) from inventory;
select count (*) from cashier;
select count (*) from cashierpayment;
select count (*) from cashierdetail;


SELECT DISTINCT 'article' AS source_table, articlecode, baseprice
FROM article
WHERE baseprice NOT IN (SELECT DISTINCT baseprice FROM cashierdetail)
UNION ALL
SELECT DISTINCT 'cashierdetail' AS source_table, articlecode, baseprice
FROM cashierdetail
WHERE baseprice NOT IN (SELECT DISTINCT baseprice FROM article);


SELECT *
FROM inventory
WHERE articlecode NOT IN (SELECT articlecode FROM article);


SELECT *
FROM cashierdetail
WHERE barcode NOT IN (SELECT barcode FROM inventory)
   OR notrans NOT IN (SELECT notrans FROM cashier)
   OR articlecode NOT IN (SELECT articlecode FROM article);


SELECT *
FROM cashierpayment
WHERE notrans NOT IN (SELECT notrans FROM cashier);


SELECT COUNT(*)
FROM article
WHERE startdate > expiredate;


SELECT COUNT(picture) FROM article
WHERE picture != '-';
ALTER TABLE article DROP COLUMN picture;

SELECT * FROM article;


SELECT COUNT(notes) FROM article
WHERE notes != '-';
UPDATE article
SET notes = NULL
WHERE notes = '-';
COMMIT;

SELECT * FROM cashier;

SELECT COUNT(notes)
FROM cashier
WHERE notes IS NOT NULL;

SELECT * FROM inventory;


SELECT COUNT(consignment)
FROM inventory
WHERE consignment != 0;

SELECT * FROM cashierpayment;

SELECT COUNT(cardinit)
FROM cashierpayment;

SELECT COUNT(cardname)
FROM cashierpayment;

SELECT COUNT(cardnumber)
FROM cashierpayment;

SELECT COUNT(machinename)
FROM cashierpayment;

SELECT COUNT(companycharge)
FROM cashierpayment
WHERE companycharge != 0;

ALTER TABLE cashierpayment DROP COLUMN companycharge;

SELECT COUNT(progressivedisc)
FROM cashierpayment
WHERE progressivedisc != 0;

SELECT COUNT(customercharge)
FROM cashierpayment
WHERE customercharge != 0;
ALTER TABLE cashierpayment DROP COLUMN customercharge;

