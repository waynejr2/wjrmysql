
use wjr;

DELIMITER $$

DROP PROCEDURE IF EXISTS create_table_employees $$

CREATE PROCEDURE create_table_employees()
BEGIN
	IF NOT EXISTS((SELECT * FROM information_schema.tables WHERE table_schema='wjr' AND table_name='employees')) THEN
		CREATE TABLE employees(
		employeeNumber int,
		lastName varchar(50),
		firstName varchar(50),
		extension varchar(10),
		email varchar(100),
		officeCode varchar(10),
		reportsTo int,
		jobTitle varchar(50)
		);
	END IF;
END $$
	
CALL create_table_employees() $$
DROP PROCEDURE IF EXISTS create_table_employees $$

DELIMITER ;
