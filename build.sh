#!/usr/bin/bash


#mysql --defaults-file=../.my.cnf < baseline.sql

./build_baseline_only.sh

./scripts/change_scripts/build.sh
