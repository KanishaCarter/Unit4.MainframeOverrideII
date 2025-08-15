sudo -u postgres psql -f init.sql;
\l
\c mainframe_override;
\d mainframe_override;

-- 5 columns (4 text, 1 timestamp w/o timezone, none null)
\d forum_posts;

-- Found the username:  smart-money-44
SELECT id, date 
FROM forum_posts 
WHERE date >= '2048-04-01 00:00:00' AND date <= '2048-08-30 00:00:00' 
ORDER BY date;

-- Found first and last name: Brad Steele
 SELECT first_name, last_name FROM forum_accounts WHERE username = 'smart-money-44';

-- Found all with last name of Steele: Andrew Steele, Kevin Steele, Brad Steele
SELECT * FROM forum_accounts WHERE last_name = 'Steele';

-- Found acounts in emptystack_acounts with the same last name
SELECT username, first_name, last_name FROM emptystack_accounts ORDER BY last_name;