-- The name of each owner and how many venues they own.
SELECT name, count(*) as venues_count
FROM VenueOwners, Venue
WHERE VenueOwners.name = Venue.owner_name
GROUP BY name;