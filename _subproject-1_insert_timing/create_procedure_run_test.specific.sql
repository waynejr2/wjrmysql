
use wjr;

DELIMITER $$

DROP PROCEDURE IF EXISTS runTest $$

CREATE PROCEDURE runTest()
BEGIN

  CALL run_insert_test_and_timing(10000, FALSE);
  CALL run_insert_test_and_timing(50000, FALSE);
  CALL run_insert_test_and_timing(100000, FALSE);
  CALL run_insert_test_and_timing(500000, FALSE);
  CALL run_insert_test_and_timing(1000000, FALSE);

  ALTER TABLE mysqlinsert ADD PRIMARY KEY(id);
  
  CALL run_insert_test_and_timing(10000, TRUE);
  CALL run_insert_test_and_timing(50000, TRUE);
  CALL run_insert_test_and_timing(100000, TRUE);
  CALL run_insert_test_and_timing(500000, TRUE);
  CALL run_insert_test_and_timing(1000000, TRUE);

END $$

DELIMITER ;




