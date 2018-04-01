[client]
user=mysqluser
password=mysqlpass


BUILD [no subprojects]:
./build.sh

BUILD baseline only [only baseline nothing else] run other scripts manually. ex: change_scripts:
./build_baseline_only.sh

BUILD with subprojects (completed subprojects.  Incomplete subprojects need to be run manually after this).
./build_with_subprojects.sh



Scripts:
build.sh
build_baseline_only.sh
build_with_subprojects.sh
scripts/misc/baseline.sh
scripts/misc/create_mysql_baseline.sh

