-- 1. Select the names of all users.

SELECT name from users;

--  2. Select the names of all shows that cost less than £15.

SELECT name FROM shows WHERE price > 15;

-- 3. Insert a user with the name "Val Gibson" into the users table

INSERT INTO users(name) VALUES('Val Gibson'); 

--  4. Insert a record that Val Gibson wants to attend the show "Two girls, one cup of comedy".

INSERT INTO shows_users(show_id, user_id) VALUES 
(
    (SELECT id FROM shows WHERE name = 'Two girls, one cup of comedy'),
    (SELECT id FROM users WHERE name = 'Val Gibson')
);

-- 5. Updates the name of the "Val Gibson" user to be "Valerie Gibson".

UPDATE users SET name = 'Valerie Gibson' WHERE name = 'Val Gibson';

-- 6. Deletes the user with the name 'Valerie Gibson'.

DELETE FROM users WHERE name = 'Valerie Gibson';

-- 7. Deletes the shows for the user you just deleted.

DELETE FROM shows_users WHERE user_id = 25;

-- 9. Select the names and prices of all shows, ordered by price in ascending order.

SELECT name, price FROM shows ORDER BY price ASC;

-- 10. Select the average price of all shows.

SELECT AVG(price) from shows;

-- 11. Select the price of the least expensive show. 

SELECT price FROM shows ORDER BY price ASC LIMIT 1;

-- 12. Select the sum of the price of all shows.

SELECT SUM(price) FROM shows;

-- 13. Select the sum of the price of all shows whose prices is less than £20.

SELECT SUM(price) FROM shows WHERE price < 20;

-- 14. Select the name and price of the most expensive show.

SELECT name, price FROM shows ORDER BY price DESC LIMIT 1;

-- 15 Select the name and price of the second from cheapest show.

SELECT name, price FROM shows ORDER BY price ASC LIMIT 1 OFFSET 1;

-- 16. Select the names of all users whose names start with the letter "N".

SELECT name from users WHERE name LIKE 'N%';

--  17. Select the names of users whose names contain "er".

SELECT name from users WHERE name LIKE '%er%';

-- 18. Select the time for the Edinburgh Royal Tattoo.

SELECT time FROM times INNER JOIN shows 
  ON times.show_id = shows.id WHERE shows.name = 'Edinburgh Royal Tattoo';

--  19. Select the number of users who want to see "Shitfaced Shakespeare".

SELECT user_id FROM shows_users INNER JOIN shows 
  ON shows_users.show_id = shows.id WHERE shows.name = 'Shitfaced Shakespeare';

-- 20. Select all of the user names and the count of shows they're going to see.

SELECT name, count(name) FROM users 
  INNER JOIN shows_users ON shows_users.user_id = users.id GROUP BY name;

-- 21. SELECT all users who are going to a show at 17:15.

SELECT users.name FROM users 
  INNER JOIN shows_users ON users.id = shows_users.user_id 
    INNER JOIN shows ON shows_users.show_id = shows.id
      INNER JOIN times ON shows.id = times.show_id
        WHERE time = '17:15';