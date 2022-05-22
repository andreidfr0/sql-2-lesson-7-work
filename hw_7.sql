mysql -u root -p
mysql> CREATE USER IF NOT EXISTS 'dev1'@'localhost' IDENTIFIED WITH mysql_native_password  BY 'dev1pass';
-- 
mysql> GRANT all on 'geodata'.* TO 'dev1'@'localhost';
--
mysql> FLUSH PRIVILEGES;
--
mysql> SELECT User, Host FROM mysql.user;
mysql> SHOW GRANTS;
-- SHOW GRANTS FOR CURRENT_USER();
mysql> show grants for 'dev1'@'localhost';

mysqldump -u root -p geodata > d:\src\geodata_l7.sql
mysql> drop database geodata;
mysql> show database;
mysql> create database geodata;
mysql> SELECT table_name, table_schema FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE';

mysqldump --no-tablespaces -u dev1 -p geodata > ~/geodata.sql
tail -n 13 geodata_dev1.sql
-- не срабатывает пишет нет такой БД mysql -u dev1 -p geodata < ~/geodata.sql
mysql> source ~/geodata_dev1.sql

--
