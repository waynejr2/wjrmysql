
use wjr;


DELIMITER $$

DROP PROCEDURE IF EXISTS add_employees_table_changes_to_employees_audit_table $$

CREATE PROCEDURE add_employees_table_changes_to_employees_audit_table(IN inemployeeNumber int, IN inlastName varchar(50), IN inaction varchar(50))
BEGIN
	INSERT INTO employees_audit
	SET action = inaction,
		employeeNumber = inemployeeNumber,
		lastname = inlastName,
		changedat = NOW();
END $$
DELIMITER ;


DELIMITER $$

DROP TRIGGER IF EXISTS before_employee_update $$

CREATE TRIGGER before_employee_update
    BEFORE UPDATE ON employees
    FOR EACH ROW 
BEGIN
	CALL add_employees_table_changes_to_employees_audit_table(OLD.employeeNumber, OLD.lastName, "update");
END$$
DELIMITER ;


DELIMITER $$

DROP TRIGGER IF EXISTS before_employee_insert $$

CREATE TRIGGER before_employee_insert 
    BEFORE INSERT ON employees
    FOR EACH ROW 
BEGIN
	CALL add_employees_table_changes_to_employees_audit_table(NEW.employeeNumber, NEW.lastName, "insert");
END$$
DELIMITER ;
