SET SEARCH_PATH TO ticketschema, public;

-- Insert values in VenueOwners
INSERT INTO VenueOwners(name, phone) VALUES
    ('The Corporation of Massey Hall and Roy Thomson Hall', '6474445555'),
    ('Maple Leaf Sports & Entertainment', '6478889999');


-- Insert values in Venues
INSERT INTO Venue(venue_id, venue_name, address, owner_name) VALUES
    (1, 'Massey Hall', '178 Victoria Street, Toronto', 
    'The Corporation of Massey Hall and Roy Thomson Hall'),
    (2, 'Roy Thomson Hall', '60 Simcoe Street, Toronto', 
    'The Corporation of Massey Hall and Roy Thomson Hall'),
    (3, 'ScotiaBank Arena', '40 Bay Street, Toronto', 
    'Maple Leaf Sports & Entertainment');


-- Insert values in SectionTable
INSERT INTO SectionTable(section_id, section_name, venue_id) VALUES
    -- venue 1
    (1101,'floor', 1),
    (1201, 'balcony', 1),

    -- venue 2
    (2101, 'main hall', 2),

    -- venue 3
    (3101, '100', 3),
    (3201, '200', 3),
    (3301, '300', 3);


-- Insert values into SeatTable
INSERT INTO SeatTable(seat_id, seat_name, section_id, mobility) VALUES
    -- venue 1, row AA seats through 1 - 10
    (101, 'A1', 1101, true),
    (102, 'A2', 1101, true),
    (103, 'A3', 1101, true),
    (104, 'A4', 1101, false),
    (105, 'A5', 1101, false),
    (106, 'A6', 1101, false),
    (107, 'A7', 1101, false),
    (108, 'A8', 1101, true),
    (109, 'A9', 1101, true),
    (110, 'A10', 1101, true),

    -- venue 1, row B, seats through 1 - 10
    (111, 'B1', 1101, false),
    (112, 'B2', 1101, false),
    (113, 'B3', 1101, false),
    (114, 'B4', 1101, false),
    (115, 'B5', 1101, false),
    (116, 'B6', 1101, false),
    (117, 'B7', 1101, false),
    (118, 'B8', 1101, false),
    (119, 'B9', 1101, false),
    (120, 'B10', 1101, false),

    -- venue 1, row C, seats through 1 - 5
    (121, 'C1', 1201, false),
    (122, 'C2', 1201, false),
    (123, 'C3', 1201, false),
    (124, 'C4', 1201, false),
    (125, 'C5', 1201, false),

    -- venue 2, row AA, seats through 1 - 3
    (201, 'AA1', 2101, false),
    (202, 'AA2', 2101, false),
    (203, 'AA3', 2101, false),

    -- venue 2, row BB, seats through 1 - 8
    (211, 'BB1', 2101, false),
    (212, 'BB2', 2101, false),
    (213, 'BB3', 2101, false),
    (214, 'BB4', 2101, false),
    (215, 'BB5', 2101, false),
    (216, 'BB6', 2101, false),
    (217, 'BB7', 2101, false),
    (218, 'BB8', 2101, false),

    -- venue 2, row CC, seats through 1 - 10
    (221, 'CC1', 2101, false),
    (222, 'CC1', 2101, false),
    (223, 'CC3', 2101, false),
    (224, 'CC4', 2101, false),
    (225, 'CC5', 2101, false),
    (226, 'CC6', 2101, false),
    (227, 'CC7', 2101, false),
    (228, 'CC8', 2101, false),
    (229, 'CC9', 2101, false),
    (230, 'CC10', 2101, false),

    -- venue 3, section 100
    (301, 'row 1, seat 1', 3101, true),
    (302, 'row 1, seat 2', 3101, true),
    (303, 'row 1, seat 3', 3101, true),
    (304, 'row 1, seat 4', 3101, true),
    (305, 'row 1, seat 5', 3101, true),
    (306, 'row 2, seat 1', 3101, true),
    (307, 'row 2, seat 2', 3101, true),
    (308, 'row 2, seat 3', 3101, true),
    (309, 'row 2, seat 4', 3101, true),
    (310, 'row 2, seat 5', 3101, true),

    -- venue 3, section 200
    (311, 'row 1, seat 1', 3201, false),
    (312, 'row 1, seat 2', 3201, false),
    (313, 'row 1, seat 3', 3201, false),
    (314, 'row 1, seat 4', 3201, false),
    (315, 'row 1, seat 5', 3201, false),
    (316, 'row 2, seat 1', 3201, false),
    (317, 'row 2, seat 2', 3201, false),
    (318, 'row 2, seat 3', 3201, false),
    (319, 'row 2, seat 4', 3201, false),
    (320, 'row 2, seat 5', 3201, false),

    -- venue 3, section 300
    (321, 'row 1, seat 1', 3301, false),
    (322, 'row 1, seat 2', 3301, false),
    (323, 'row 1, seat 3', 3301, false),
    (324, 'row 1, seat 4', 3301, false),
    (325, 'row 1, seat 5', 3301, false),
    (326, 'row 2, seat 1', 3301, false),
    (327, 'row 2, seat 2', 3301, false),
    (328, 'row 2, seat 3', 3301, false),
    (329, 'row 2, seat 4', 3301, false),
    (330, 'row 2, seat 5', 3301, false);


-- Insert Values into Concert
INSERT INTO Concert(concert_id, venue_id, concert_name, datetime) VALUES
    -- Ron Sexsmith
    (11111, 1, 'Ron Sexsmith', '2022-12-03 19:30:00'),
    
    -- Women's Blues Review
    (11211, 1, 'Women''s Blues Review', '2022-11-25 20:00:00'),
    
    -- Mariah Carey - Merry Christmas to all
    (31111, 3, 'Mariah Carey - Merry Christmas to all', '2022-12-09 20:00:00'),
    (31112, 3, 'Mariah Carey - Merry Christmas to all', '2022-12-11 20:00:00'),
    
    -- TSO - Elf in Concert
    (21111, 2, 'TSO - Elf in Concert', '2022-12-09 19:30:00'),
    (21112, 2, 'TSO - Elf in Concert', '2022-12-10 14:30:00'),
    (21113, 2, 'TSO - Elf in Concert', '2022-12-10 19:30:00');


-- Insert Values into Ticket
INSERT INTO Ticket(ticket_id, concert_id, section_id, price) VALUES
    -- Ron Sexmith concert at venue 1 on 2022-12-03 19:30:00, floor seats
    (111110, 11111, 1101, 130),
    -- Ron Sexmith concert at venue 1 on 2022-12-03 19:30:00, balcony seats
    (111111, 11111, 1201, 99),

    -- Women's Blues Review at venue 1 on 2022-11-25 20:00:00, floor seats
    (111210, 11211, 1101, 150),
    -- Women's Blues Review at venue 1 on 2022-11-25 20:00:00, balcony seats
    (111211, 11211, 1201, 125),

    -- Mariah Carey - Merry Christmas to all at venue 3 on 2022-12-09 20:00:00,
    -- section 100 seats
    (311110, 31111, 3101, 986),
    -- Mariah Carey - Merry Christmas to all at venue 3 on 2022-12-09 20:00:00,
    -- section 200 seats
    (311111, 31111, 3201, 244),
    -- Mariah Carey - Merry Christmas to all at venue 3 on 2022-12-09 20:00:00,
    -- section 300 seats
    (311112, 31111, 3301, 176),

    -- Mariah Carey - Merry Christmas to all at venue 3 on 2022-12-11 20:00:00,
    -- section 100 seats
    (311120, 31112, 3101, 936),
    -- Mariah Carey - Merry Christmas to all at venue 3 on 2022-12-11 20:00:00,
    -- section 200 seats
    (311121, 31112, 3201, 194),
    -- Mariah Carey - Merry Christmas to all at venue 3 on 2022-12-11 20:00:00,
    --section 300 seats
    (311122, 31112, 3301, 126),

    -- TSO - Elf in Concert at venue 2 on 2022-12-09 19:30:00, main hall seats
    (211110, 21111, 2101, 159),
    -- TSO - Elf in Concert at venue 2 on 2022-12-10 14:30:00, main hall seats
    (211120, 21112, 2101, 159),
    -- TSO - Elf in Concert at venue 2 on 2022-12-10 19:30:00, main hall seats
    (211121, 21113, 2101, 159);


-- Insert Values into Purchases
INSERT INTO Purchases(username, seat_id, ticket_id) VALUES
    -- Alicent Hightower, ahightower, purchased floor seat A5 for the Women's
    -- Blues Review
    ('ahightower', 105, 111210),
    -- Alicent Hightower, ahightower, purchased balcony seat C2 for the Women's
    -- Blues Review 
    ('ahightower', 122, 111211),

    -- Daemon Targaryen, d_targaryen, purchased floor seat B3 for the
    -- Ron Sexmith Concert on December 3rd
    ('d_targaryen', 113, 111110),
    -- Daemon Targaryen, d_targaryen, purchased for seat BB7 in the
    -- main hall for the Elf in Concert on December 10th, 7:30 pm
    ('d_targaryen', 217, 211121),

    -- Criston Cole, cristonc, purchased seat 3 in row 1 of 
    -- section 100 for Mariah Carey - Merry Christmas on December 9th
    ('cristonc', 303, 311110), 
    -- Criston Cole, cristonc, purchased seat 3 in row 2 of 
    -- section 200 for Mariah Carey - Merry Christmas on December 11th
    ('cristonc', 318, 311121),
    -- Criston Cole, cristonc, purchased seat 4 in row 2 of
    -- section 200 for Mariah Carey - Merry Christmas on December 11th
    ('cristonc', 319, 311121);