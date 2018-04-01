
use wjr;

DELIMITER $$

DROP PROCEDURE IF EXISTS run_insert_test_and_timing $$

CREATE PROCEDURE run_insert_test_and_timing(IN numberOfRecords INT, IN hasIndex TINYINT)
BEGIN
  DECLARE insertStartTime timestamp(6);
  DECLARE insertEndTime timestamp(6);
  DECLARE timeDiff varchar(25);
  DECLARE perInsertTime float;

  SET insertStartTime = current_timestamp(6);
	
  CALL insert_N_Records_into_table_mysqlinsert(numberOfRecords);

  SET insertEndTime = current_timestamp(6);
  SET timeDiff = timediff(insertEndTime, insertStartTime);
  SET perInsertTime = truncate(timediff(insertEndTime, insertStartTime)/ numberOfRecords, 6);
  
  INSERT INTO mysqltiming (recordsInsertedCount, hasIndex, insertStartTime, insertEndTime, diffTime, timePerInsert) VALUES (numberOfRecords, hasIndex, insertStartTime, insertEndTime, timeDiff, perInsertTime);
    
  DELETE FROM mysqlinsert;
  
END $$

DELIMITER ;


