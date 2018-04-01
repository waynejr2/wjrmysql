#!/usr/bin/bash


mysql --defaults-file=./.my.cnf < 20170606163200_create_table_mysqltiming.sql

mysql --defaults-file=./.my.cnf < 20170606181800_create_table_mysqlinsert.sql

mysql --defaults-file=./.my.cnf < create_procedure_insert_N_Records_into_table_mysqlinsert.sql

mysql --defaults-file=./.my.cnf < create_procedure_run_insert_test_and_timing.sql

mysql --defaults-file=./.my.cnf < create_procedure_run_test.specific.sql
