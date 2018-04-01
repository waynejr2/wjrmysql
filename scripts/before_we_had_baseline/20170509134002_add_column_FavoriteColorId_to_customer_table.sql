
use wjr;

delimiter $$

DROP PROCEDURE IF EXISTS add_column_FavoriteColorId_to_customer_table $$

CREATE PROCEDURE add_column_FavoriteColorId_to_customer_table()
BEGIN
	IF NOT EXISTS((SELECT * FROM information_schema.columns where table_schema = 'wjr' and table_name = 'customer' and column_name = 'FavoriteColorId')) THEN
		ALTER TABLE customer ADD FavoriteColorId int;
	END IF;
END $$

CALL add_column_FavoriteColorId_to_customer_table() $$
DROP PROCEDURE IF EXISTS add_column_FavoriteColorId_to_customer_table $$ 

delimiter ;
