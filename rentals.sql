/*Q1*/
INSERT INTO rental_records VALUES
   (NULL,
    'SBA1111A', 
    (SELECT customer_id FROM customers WHERE name='Angel'),
    CURDATE(),
    DATE_ADD(CURDATE(), INTERVAL 10 DAY),
    NULL); 
    
/*Q2*/
INSERT INTO rental_records VALUES
   (NULL,
    'GA5555E', 
    (SELECT customer_id FROM customers WHERE name='Kumar'),
    CURDATE() + 1,
    DATE_ADD(CURDATE() + 1, INTERVAL 3 MONTH),
    NULL); 
    

/*Q3*/

SELECT
	r.start_date AS 'Start Date', 
	r.end_date AS "End Date", 
	r.veh_reg_no AS "Vehicle Registration No", 
	v.brand AS "Brand", 
	v.category AS "Category", 
	c.name AS "Customer Name"
FROM rental_records AS r
	JOIN vehicles AS v using(veh_reg_no)
	JOIN customers AS c using(customer_id)
ORDER BY v.category, start_date;
/*Q4*/
SELECT * FROM rental_records
WHERE end_date < curdate();

/*Q5*/
SELECT 
	r.veh_reg_no AS "Vehicle Registration No", 
	c.name AS "Customer Name", 
    r.start_date AS "Start Date", 
    r.end_date AS "End Date"
FROM rental_records AS r
JOIN customers AS c USING(customer_id)
WHERE start_date <= '2012-01-10' AND end_date >= '2012-01-10';


/*Q6*/
SELECT 
	r.veh_reg_no AS "Vehicle Registration No", 
    c.name AS "Customer Name", 
    r.start_date AS "Start Date", 
    r.end_date AS "End Date"
FROM rental_records AS r
JOIN customers AS c USING(customer_id)
WHERE start_date <= curdate() AND end_date >= curdate();


/*Q7*/
SELECT 
	r.veh_reg_no AS "Vehicle Registration No", 
    c.name AS "Customer Name", 
    r.start_date AS "Start Date", 
    r.end_date AS "End Date"
FROM customers AS c
JOIN rental_records AS r USING(customer_id)
WHERE (start_date >= '2012-01-03' AND start_date <= '2012-01-18')
OR (end_date >= '2012-01-03' AND end_date <= '2012-01-18') 
OR (start_date < '2012-01-03' AND end_date > '2012-01-18');


/*Q8*/
SELECT 
	v.veh_reg_no AS "Vehicle Registration No", 
    v.brand AS "Brand", 
    v.desc AS "Description"
FROM vehicles AS v
WHERE v.veh_reg_no NOT IN (
SELECT veh_reg_no FROM rental_records 
WHERE (start_date <= '2012-01-10' AND end_date >= '2012-01-10'));


/*Q9*/
SELECT 
	v.veh_reg_no AS "Vehicle Registration No", 
    v.brand AS "Brand", 
    v.desc AS "Description"
FROM vehicles AS v
WHERE v.veh_reg_no NOT IN (
SELECT
 veh_reg_no FROM rental_records
WHERE
	start_date >= "2012-01-03" AND start_date <= "2012-01-18" 
    OR end_date >="2012-01-03" AND end_date <= "2012-01-18" 
OR start_date < "2012-01-03" AND end_date > "2012-01-18");


/*Q10*/
SELECT 
	v.veh_reg_no AS "Vehicle Registration No", 
    v.brand AS "Brand", 
    v.desc AS "Description"
FROM vehicles AS v
WHERE v.veh_reg_no NOT IN (
SELECT veh_reg_no FROM rental_records 
WHERE start_date >= curdate() AND end_date > curdate() + 10);

SELECT * FROM rental_records;
SELECT * FROM customers;
SELECT * FROM vehicles; 