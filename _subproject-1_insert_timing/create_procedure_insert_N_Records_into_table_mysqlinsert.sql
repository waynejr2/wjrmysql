
use wjr;

DELIMITER $$

DROP PROCEDURE IF EXISTS insert_N_Records_into_table_mysqlinsert $$

CREATE PROCEDURE insert_N_Records_into_table_mysqlinsert(IN numberOfInserts int)
BEGIN
  DECLARE COUNT INT;
  SET COUNT = 0;
  
  WHILE COUNT < numberOfInserts DO
    INSERT INTO mysqlinsert (id) VALUES (COUNT);
    SET COUNT = COUNT + 1;
  END WHILE;
END $$

DELIMITER ;
