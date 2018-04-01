#!/usr/bin/bash


mysqldump --defaults-file=./.my.cnf -d --add-drop-database --triggers --routines --events --skip-dump-date --databases wjr