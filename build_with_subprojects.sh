#!/usr/bin/bash

#mysql --defaults-file=../.my.cnf < baseline.sql

./build_baseline_only.sh

./scripts/change_scripts/build.sh

cd _subproject-1_insert_timing
./wjr.sh
cd ..


#add when you have completed subprojects
#mysql --defaults-file=../.my.cnf < FILENAME.sql
