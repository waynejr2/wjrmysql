
use wjr;

DELIMITER $$

DROP PROCEDURE IF EXISTS addc $$

CREATE PROCEDURE addc()
BEGIN
	IF NOT EXISTS((SELECT * FROM information_schema.tables WHERE table_schema='wjr' AND table_name='customer')) THEN
		CREATE TABLE customer(n int);
	END IF;
END $$
	
CALL addc() $$
DROP PROCEDURE IF EXISTS addc $$

DELIMITER ;
