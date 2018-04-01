
use wjr;

DELIMITER $$

DROP PROCEDURE IF EXISTS runTest $$

CREATE PROCEDURE runTest()
BEGIN

  DECLARE howManyTimesToRunInsert INT;
  DECLARE testNumber INT;
  DECLARE baseNumberOfRecordsToInsert INT;
  DECLARE numberOfRecords INT;
  
  SET howManyTimesToRunInsert = 100;
  SET testNumber = 1;
  SET baseNumberOfRecordsToInsert= 10000;
  SET numberOfRecords = baseNumberOfRecordsToInsert * testNumber;
  SET @numberOfRecords = baseNumberOfRecordsToInsert * testNumber;

  WHILE testNumber <= howManyTimesToRunInsert DO
    BEGIN
      DECLARE insertStartTime timestamp(6);
  	  DECLARE insertEndTime timestamp(6);
	  DECLARE timeDiff varchar(25);
      DECLARE numberOfRecords INT;

      SET insertStartTime = current_timestamp(6);
	
	  CALL insert_N_Records_into_table_mysqlinsert(@numberOfRecords);

      SET insertEndTime = current_timestamp(6);
      SET timeDiff = timediff(insertEndTime, insertStartTime);
  
      INSERT INTO mysqltiming (recordsInsertedCount, hasIndex, insertStartTime, insertEndTime, diffTime) VALUES (@numberOfRecords, FALSE, insertStartTime, insertEndTime, timeDiff);
  
    END;
	
    SET testNumber = testNumber + 1;
	
    SET numberOfRecords = baseNumberOfRecordsToInsert * testNumber;
    SET @numberOfRecords = baseNumberOfRecordsToInsert * testNumber;
  
    DELETE FROM mysqlinsert;
  
  END WHILE;
  
END $$

DELIMITER ;




