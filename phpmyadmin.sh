
cd /usr/share/doc/phpmyadmin/examples
sudo gunzip create_tables.sql.gz
mysql -u root -p < create_tables.sql
mysql -u root -p -e 'GRANT SELECT, INSERT, DELETE, UPDATE ON phpmyadmin.* TO 'pma'@'localhost' IDENTIFIED BY "pmapass"'
sudo sed -i 's/\/\/\ \$cfg\[\'Servers\'\]\[\$i\]\[\'controluser\'\]/\$cfg\[\'Servers\'\]\[\$i\]\[\'controluser\'\]/g' /etc/phpmyadmin/config.inc.php
sudo sed -i 's/\/\/\ \$cfg\[\'Servers\'\]\[\$i\]\[\'controlpass\'\]/\$cfg\[\'Servers\'\]\[\$i\]\[\'controlpass\'\]/g' /etc/phpmyadmin/config.inc.php
