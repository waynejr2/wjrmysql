
use wjr;

DELIMITER $$

DROP PROCEDURE IF EXISTS create_table_employees_audit $$

CREATE PROCEDURE create_table_employees_audit()
BEGIN
	IF NOT EXISTS((SELECT * FROM information_schema.tables WHERE table_schema='wjr' AND table_name='employees_audit')) THEN
		CREATE TABLE employees_audit(
		id int auto_increment PRIMARY KEY,
		employeeNumber int,
		lastName varchar(50),
		changeDat DATETIME,
		action varchar(50)
		);
	END IF;
END $$
	
CALL create_table_employees_audit() $$
DROP PROCEDURE IF EXISTS create_table_employees_audit $$

DELIMITER ;
