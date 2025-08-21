-- I notice all tables are set as not null meaning all rows are required. It also lists
-- primqary keys, and unique data.

-- 1. 1. Get the username of the person who made the post about EmptyStack in `forum_posts`.
SELECT * FROM forum_posts WHERE date >= '2048-04-01 00:00:00' ORDER BY date;
-- Result: nbZY_ | Get rich fast | You should all invest in EmptyStack Solutions soon or you'll regret it. 
--         My dad works there and he's got some serious inside intel. Their self-driving taxis are the 
--         future and the future is here. | 2048-04-08 00:00:00 | smart-money-44
--         USERNAME = smart-money-44

-- 2. Get the last name of the person associated with that username in `forum_accounts`.
SELECT * FROM forum_accounts WHERE username LIKE 'smart-money-44%';
-- RESULT: smart-money-44 | Brad | Steele
--         LAST NAME = Steele

-- 3. Find all other accounts with the same last name.
SELECT * FROM forum_accounts WHERE last_name LIKE 'Steele%';
-- RESULT:  sharp-engine-57 | Andrew     | Steele
--          stinky-tofu-98  | Kevin      | Steele
--          smart-money-44  | Brad       | Steele

-- 4. Find all accounts in `emptystack_accounts` with the same last name.
SELECT * FROM emptystack_accounts WHERE last_name LIKE 'Steele%';
-- RESULT:  triple-cart-38 | password456 | Andrew     | Steele
--          lance-main-11  | password789 | Lance      | Steele

-- 5. There will only be one EmptyStack employee with a forum account. Use their credentials
--    to access `node mainframe`, which will output a new `sql` file for you to run.
SELECT emptystack_accounts.username, 
emptystack_accounts.password,
emptystack_accounts.first_name, 
emptystack_accounts.last_name, 
forum_accounts.username, 
forum_accounts.first_name, 
forum_accounts.last_name 
FROM emptystack_accounts 
INNER JOIN forum_accounts 
ON emptystack_accounts.last_name = forum_accounts.last_name 
AND emptystack_accounts.first_name = forum_accounts.first_name;
-- RESULT: triple-cart-38 | password456 | Andrew     | Steele    | sharp-engine-57 | Andrew     | Steele

-- 6. Find the message in `emptystack_messages` that mentions a project involving
   -- self-driving taxis. That message is sent from an admin account and also reveals
   -- the project code.
SELECT * FROM emptystack_messages 
WHERE body ILIKE '%self%' 
OR body ILIKE '%taxis%'
OR body ILIKE '%self%'
OR body ILIKE '%drive%'
OR subject ILIKE '%taxi%'
OR subject ILIKE '%taxis%'
OR subject ILIKE '%self%'
OR subject ILIKE '%drive%';
-- RESULT: id = LidWj | from = your-boss-99 
--        |to = triple-cart-38 | subject = Project TAXI |
--        body =  Deploy Project TAXI by end of week. We need this out ASAP.


-- 7. Get the credentials for the admin account from `emptystack_accounts`.
SELECT * FROM emptystack_accounts WHERE username ILIKE '%your-boss-99%';
-- RESULT:    username   |    password    | first_name | last_name
--------------+----------------+------------+-----------
--          your-boss-99 | notagaincarter | Skylar     | Singer

-- 8. Get the ID of the project from `emptystack_projects`.
SELECT * FROM emptystack_projects ORDER BY code;
-- RESULT: DczE0v2b

-- 9. Use that information to stop the project: `node mainframe -stop`!
-- RESULT: Successfully stopped the project.