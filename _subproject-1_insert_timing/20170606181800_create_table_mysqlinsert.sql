
use wjr;

DELIMITER $$

DROP PROCEDURE IF EXISTS create_table_mysqlinsert $$

CREATE PROCEDURE create_table_mysqlinsert()
BEGIN
	IF NOT EXISTS((SELECT * FROM information_schema.tables WHERE table_schema='wjr' AND table_name='mysqlinsert')) THEN
		CREATE TABLE mysqlinsert(id int);
	END IF;
END $$
	
CALL create_table_mysqlinsert() $$
DROP PROCEDURE IF EXISTS create_table_mysqlinsert $$

DELIMITER ;
