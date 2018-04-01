
use wjr;

set @insertStartTime = current_timestamp(6);


drop table if exists mysqltiming;

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



insert into mysqltiming (recordsInsertedCount) values (10);

insert into mysqltiming (hasIndex) values (FALSE);

set @insertEndTime = current_timestamp(6);
set @diffTime = timediff(@insertEndTime, @insertStartTime);

insert into mysqltiming(hasIndex, insertStartTime, insertEndTime, diffTime) VALUES (FALSE, @insertStartTime, @insertEndTime, @diffTime);

select *  from mysqltiming;

select @insertStartTime, @insertEndTime, @difftime;



