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

-- #5 =  triple-cart-38 password456 Andrew Steele **Forum_accounts username = sharp-engine-57
SELECT emptystack_accounts.username,
       emptystack_accounts.password,
       emptystack_accounts.first_name,
       emptystack_accounts.last_name,
       forum_accounts.username AS forum_username
FROM emptystack_accounts
INNER JOIN forum_accounts
ON emptystack_accounts.first_name = forum_accounts.first_name
AND emptystack_accounts.last_name = forum_accounts.last_name;

-- #6 Found message mentioning self-driving taxi project id= LidWj from= your-boss-99 to= triple-cart-38 subject= Project TAXI body= Deploy Project TAXI by end of week. We need this out ASAP.
SELECT * FROM emptystack_messages WHERE subject ILIKE '%taxi%';

-- #7 Found credentials of admin account: username= your-boss-99 password= notagaincarter first_name= Skylar last_name= Singer
SELECT * FROM emptystack_accounts WHERE username = 'your-boss-99';