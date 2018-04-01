
use wjr;

DELIMITER $$

DROP PROCEDURE IF EXISTS create_table_mysqltiming $$

CREATE PROCEDURE create_table_mysqltiming()
BEGIN
	IF NOT EXISTS((SELECT * FROM information_schema.tables WHERE table_schema='wjr' AND table_name='mysqltiming')) THEN
		CREATE TABLE mysqltiming(recordsInsertedCount int,
						hasIndex tinyint,
						insertStartTime datetime(6),
						insertEndTime timestamp(6),
						diffTime varchar(25),
						timePerInsert float
						);
	END IF;
END $$
	
CALL create_table_mysqltiming() $$
DROP PROCEDURE IF EXISTS create_table_mysqltiming $$

DELIMITER ;
