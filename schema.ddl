-- Documenting choices and assumptions
-- Could not: What constraints from the domain specification could not be enforced without assertions or triggers, if any?
-- Answer: At least 10 seats is a constraint that could not enforced without triggers

-- Did not: What constraints from the domain specification could have been enforced without assertions or triggers,
-- but were not enforced, if any? Why not?
-- We are assuming that a venue can only have one concert at a time instead of enforcing it. 
-- The reason is that we can enforce this as a constraint, but if we do with our design, then it will force us to wrap the entire attributes in the Concert
-- relation as a primary key. 


-- Extra constraints: What additional constraints that we didn't mention did you enforce, if any?
-- None

-- Assumptions: What assumptions did you make?
-- We are assuming that seat names do not repeat in the same section in a venue and section names do not repeat in the same venue.
-- The reason is because if this were to be enforced by a constraint, then by our design, it will force us to wrap the entire instance in the
-- corresponding tables as primary key. 



DROP SCHEMA IF EXISTS ticketschema cascade;
CREATE SCHEMA ticketschema;
SET search_path TO ticketschema;


-- A owner with personal information such as name and phone number
-- no two owners can have the same phone number

CREATE TABLE VenueOwners (
    name varchar(100) PRIMARY KEY,
    phone varchar(100) UNIQUE NOT NULL
);



-- A venue owned by a person, an organization, or company
-- Venue names are not unique
-- No two owners can have the same phone number

CREATE TABLE Venue (
    venue_id integer PRIMARY KEY,
    venue_name varchar(100) NOT NULL,
    address varchar(100) NOT NULL,
    owner_name varchar(100) NOT NULL references VenueOwners(name)
);


-- A section that is in a venue.
-- Each section has a name section_name that is unique per venue.
-- However, a different venue can have the same name section_name

CREATE TABLE SectionTable (
    section_id integer PRIMARY KEY,
    section_name varchar(100) NOT NULL,
    venue_id integer NOT NULL references Venue(venue_id)
);


-- A seat that is in a venue. Every concert in that venue has the same
-- seat arrangement.
-- There are at least 10 seats in a venue.
-- Every seat belongs to exactly one section.
-- Mobility is true for accessible, and false for not for accesible

CREATE TABLE SeatTable (
    seat_id integer PRIMARY KEY,
    seat_name varchar(100) NOT NULL,
    section_id integer NOT NULL references SectionTable(section_id),
    mobility boolean NOT NULL default false
);


-- A concert has a name concert_name, date and time datetime
-- Concert names are not unique.
-- A venue can only have one concert at a given time. 
-- Each concert refers to a specific concert at a specific time at a
-- specific venue.

CREATE TABLE Concert (
    concert_id integer PRIMARY KEY,
    venue_id integer NOT NULL references Venue(venue_id),
    concert_name varchar(100) NOT NULL,
    datetime timestamp NOT NULL
);

-- A ticket has the ticket ID, username for users, Concert ID for
-- concerts, and seat ID for seats, and a ticket price.
-- The price of the ticket depends on which section it is in the venue

CREATE TABLE Ticket(
    ticket_id integer PRIMARY KEY,
    concert_id integer NOT NULL references Concert(concert_id),
    section_id integer NOT NULL references SectionTable(section_id),
    price integer NOT NULL
);


-- A purchase made by user.
-- A username itself is unique
-- A user purchases a ticket for a seat seat_id and price (inside ticket_id) 
-- that is matching with the user's desired concert (inside ticket_id)

CREATE TABLE Purchases (
    username varchar(100) NOT NULL,
    seat_id integer NOT NULL references SeatTable(seat_id),
    ticket_id integer NOT NULL references Ticket(ticket_id),
    PRIMARY KEY (username, seat_id, ticket_id)
);