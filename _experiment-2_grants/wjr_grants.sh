#!/usr/bin/bash

#mysql --defaults-file=./.my.cnf --skip-column-names -A -e"SELECT CONCAT('SHOW GRANTS FOR ''',user,'''@''',host,''';') FROM mysql.user WHERE user<>''" | mysql -h... -u... -p... --skip-column-names -A | sed 's/$/;/g'

mysql --defaults-file=./.my.cnf --skip-column-names -A -e"SELECT CONCAT('SHOW GRANTS FOR ''',user,'''@''',host,''';') FROM mysql.user WHERE user<>''" | mysql --defaults-file=./.my.cnf --skip-column-names -A



