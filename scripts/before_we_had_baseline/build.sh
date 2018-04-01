#!/usr/bin/bash


mysql --defaults-file=./.my.cnf < 20170428114700_create_database_wjr.sql

mysql --defaults-file=./.my.cnf < 20170505115500_create_customer_table.sql

mysql --defaults-file=./.my.cnf < 20170509134002_add_column_FavoriteColorId_to_customer_table.sql

mysql --defaults-file=./.my.cnf < 20170514140000_create_table_employees.sql

mysql --defaults-file=./.my.cnf < 20170515151515_create_table_employees_audit.sql

mysql --defaults-file=./.my.cnf < 20170530191800_create_triggers_and_procedure_to_add_employees_table_changes_to_employees_audit_table.sql

