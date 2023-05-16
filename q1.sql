DROP VIEW IF EXISTS ticketSum CASCADE;
DROP VIEW IF EXISTS allSeats CASCADE;

-- The venue id, concert_id, concert name, concert datetime, count, 
-- and sum of the price of each concert.
CREATE VIEW ticketSum AS
SELECT concert.venue_id, concert.concert_id, concert.concert_name, 
concert.datetime, count(concert.concert_id), sum(price) 
FROM concert join ticket on concert.concert_id = ticket.concert_id
Group by concert.concert_id;

-- The venue id and count of all seats in a venue.
CREATE VIEW allSeats AS
SELECT Venue.venue_id, COUNT(seat_id)
FROM Venue, SectionTable, SeatTable
WHERE Venue.venue_id = SectionTable.venue_id AND 
SeatTable.section_id = SectionTable.section_id
GROUP BY Venue.venue_id;

-- The concert name, concert datetime, the total ticket value sold, 
-- and percentage of the venue that was sold for each each concert.
SELECT ticketSum.concert_name, datetime, ticketSum.sum as total_ticket_value,
(CAST(ticketSum.count AS real) / CAST(allSeats.count AS real)) * 100.00 
as percentage
FROM ticketSum Join allSeats on ticketSum.venue_id = allSeats.venue_id;

