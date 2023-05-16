DROP VIEW IF EXISTS accessibleSeats CASCADE;
DROP VIEW IF EXISTS allSeats CASCADE;

-- The venue id, venue name, and the count of accessible seats in each venue.
CREATE VIEW accessibleSeats AS
    SELECT Venue.venue_id, venue_name, COUNT(seat_id)
    FROM Venue, SectionTable, SeatTable
    WHERE Venue.venue_id = SectionTable.venue_id 
        AND SeatTable.section_id = SectionTable.section_id 
        AND SeatTable.mobility = true
    GROUP BY Venue.venue_id;

-- The venue id, venue name, and the count of total seats in each venue.
CREATE VIEW allSeats AS
SELECT Venue.venue_id, venue_name, COUNT(seat_id)
FROM Venue, SectionTable, SeatTable
WHERE Venue.venue_id = SectionTable.venue_id 
AND SeatTable.section_id = SectionTable.section_id
GROUP BY Venue.venue_id;

-- The venue id, venue name, and the percentage of seats that are accessible.
SELECT allSeats.venue_id, allSeats.venue_name, 
CAST((COALESCE(accessibleSeats.count, 0)) AS real)/ 
CAST(allSeats.count AS real) as percentage
FROM allSeats LEFT JOIN accessibleSeats ON 
allSeats.venue_id = accessibleSeats.venue_id;