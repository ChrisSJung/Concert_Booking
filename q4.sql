DROP VIEW IF EXISTS ticketCount CASCADE;
DROP VIEW IF EXISTS ticketMax CASCADE;

-- The username and the count of tickets purhchased by each user.
CREATE VIEW ticketCount AS
    SELECT username, count(username)
    FROM Purchases
    GROUP BY username;

-- The highest count of tickets purchased.
CREATE VIEW ticketMax AS
    SELECT max(count)
    FROM ticketCount;

-- the username of the person who has purchased the most tickets. 
-- If there is a tie, report them all.
SELECT username
FROM ticketCount, ticketMax
WHERE count >= max;
