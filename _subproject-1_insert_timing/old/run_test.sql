
use wjr;

set @insertStartTime = current_timestamp(6);
set @min = 1;
set @max = 10000;



set @insertEndTime = current_timestamp(6);

INSERT into mysqltiming(count, FALSE, insertStartTime, insertEndtime) VALUES (@max, 



use wjr;

DELIMITER $$

DROP PROCEDURE IF EXISTS runTest $$

CREATE PROCEDURE runTest()
BEGIN
  DECLARE insertStartTime timestamp(6);
  DECLARE insertEndTime timestamp(6);
  DECLARE timeDiff varchar(25);
  
  SET insertStartTime = current_timestamp(6);

  CALL insert_N_Records_into_table_mysqlinsert(10000);

  SET insertEndTime = current_timestamp(6);
  
  SET timeDiff = timediff(insertEndTime, insertStartTime);
  
  INSERT INTO mysqltiming (recordsInsertedCount, hasIndex, insertStartTime, insertEndTime, diffTime) VALUES (10000, FALSE, insertStartTime, insertEndTime, timeDiff);
  
END $$

DELIMITER ;



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

  WHILE testNumber <= howManyTimesToRunInsert DO
  
    BEGIN
      DECLARE insertStartTime timestamp(6);
	  DECLARE insertEndTime timestamp(6);
	  DECLARE timeDiff varchar(25);
      DECLARE numberOfRecords INT;
  
      SET numberOfRecords = 10000;
  
      SET insertStartTime = current_timestamp(6);
	
	  CALL insert_N_Records_into_table_mysqlinsert(numberOfRecords);

      SET insertEndTime = current_timestamp(6);
  
      SET timeDiff = timediff(insertEndTime, insertStartTime);
  
      INSERT INTO mysqltiming (recordsInsertedCount, hasIndex, insertStartTime, insertEndTime, diffTime) VALUES (numberOfRecords, FALSE, insertStartTime, insertEndTime, timeDiff);
  
      END;
  
END $$

DELIMITER ;




