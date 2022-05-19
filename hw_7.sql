CREATE ROLE IF NOT EXISTS 'developer', 'app_read', 'app_write';						-- create role developer, app_read, app_write
GRANT ALL ON _geodata.* TO 'developer'@'localhost';								-- grant privileges to role_group - developer
GRANT SELECT ON _geodata.* TO 'app_read'@'localhost';								-- grant privileges to role_group - app_read
GRANT INSERT, UPDATE, DELETE ON _geodata.* TO 'app_write'@'localhost';			-- grant privileges to role_group - app_write

--
CREATE USER IF NOT EXISTS 'dev1'@'localhost' IDENTIFIED WITH mysql_native_password  BY 'dev1pass';				-- create dev1 localhost login
CREATE USER IF NOT EXISTS 'read_user1'@'localhost' IDENTIFIED WITH mysql_native_password BY 'read_user1pass';	-- read_user1
CREATE USER IF NOT EXISTS 'read_user2'@'localhost' IDENTIFIED WITH mysql_native_password  BY 'read_user2pass';	-- read_user2
CREATE USER IF NOT EXISTS 'rw_user1'@'localhost' IDENTIFIED WITH mysql_native_password  BY 'rw_user1pass';		-- rw_user1

-- 
GRANT 'developer' TO 'dev1'@'localhost';								-- grant group privileges to user
GRANT 'app_read' TO 'read_user1'@'localhost', 'read_user2'@'localhost';
GRANT 'app_read', 'app_write' TO 'rw_user1'@'localhost';
--

FLUSH PRIVILEGES;
SELECT User, Host FROM mysql.user;
SELECT User, Host, Password FROM mysql.user;
-- SHOW GRANTS;
-- SHOW GRANTS FOR CURRENT_USER();
show grants for 'rw_user1'@'localhost'; 
show grants for 'dev1'@'localhost'; 


-- mysqldump -u root -p geodata > d:\src\_geodata_l7.sql
create database _geodata;
SELECT table_name, table_schema FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE';

-- пока в базе нет таблиц/наполнения - нет физически
-- mysql -u root -p _geodata < d:\src\geodata.sql

--
-- drop database _geodata;
-- mysql -u dev1 -p _geodata < d:\src\_geodata_l7.sql


