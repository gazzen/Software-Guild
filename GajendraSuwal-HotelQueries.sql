USE HotelDB;

-- 1. Write a query that returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates.

SELECT `name`, room_number, start_date, end_date FROM Reservation
JOIN Room ON Reservation.roomID = Room.roomID
WHERE MONTH(end_date) = 7 AND YEAR(end_date) = 2023;

-- Walter Holaway	204	2023-07-13 00:00:00	2023-07-14 00:00:00
-- Cindy Okino	205	2023-06-28 00:00:00	2023-07-02 00:00:00
-- Bettyann Seery	303	2023-07-28 00:00:00	2023-07-29 00:00:00
-- Wilfred Vise	401	2023-07-18 00:00:00	2023-07-21 00:00:00
-- ===========================================================================================================================

-- 2. Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation.

SELECT `name`, room_number, start_date, end_date FROM Reservation
JOIN Room ON Reservation.roomID = Room.roomID
JOIN RoomAmenity ON Room.roomID = RoomAmenity.roomID AND RoomAmenity.amenityID = 2;

-- Karie Yang	201	2023-03-06 00:00:00	2023-03-07 00:00:00
-- Bettyann Seery	203	2023-02-05 00:00:00	2023-02-10 00:00:00
-- Karie Yang	203	2023-09-13 00:00:00	2023-09-15 00:00:00
-- Cindy Okino	205	2023-06-28 00:00:00	2023-07-02 00:00:00
-- Wilfred Vise	207	2023-04-23 00:00:00	2023-04-24 00:00:00
-- Walter Holaway	301	2023-04-09 00:00:00	2023-04-13 00:00:00
-- Mack Simmer	301	2023-11-22 00:00:00	2023-11-25 00:00:00
-- Bettyann Seery	303	2023-07-28 00:00:00	2023-07-29 00:00:00
-- Duane Cullison	305	2023-02-22 00:00:00	2023-02-24 00:00:00
-- Bettyann Seery	305	2023-08-30 00:00:00	2023-09-01 00:00:00
-- Cindy Okino	307	2023-03-17 00:00:00	2023-03-20 00:00:00
-- ===========================================================================================================================

-- 3. Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, the starting date of the reservation, and how many people were included in the reservation. (Choose a guest's name from the existing data.)

SELECT 	
	`name`,
    room_number,
    start_date,
    (adults + children) as total_people
FROM Reservation
INNER JOIN Room ON Reservation.roomID = Room.roomID 
WHERE Reservation.guestID = 1;

-- Cindy Okino	307	2023-03-17 00:00:00	2
-- Cindy Okino	205	2023-06-28 00:00:00	2
-- ===========================================================================================================================

-- 4. Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. The results should include all rooms, whether or not there is a reservation associated with the room.

SELECT room_number, reservationID, total_room_cost FROM Room
LEFT OUTER JOIN Reservation 
    ON Room.roomID = Reservation.roomID ;

-- 201	4	199.99
-- 202	7	349.98
-- 203	2	999.95
-- 203	21	399.98
-- 204	16	184.99
-- 205	15	699.96
-- 206	12	599.96
-- 206	23	449.97
-- 207	10	174.99
-- 208	13	599.96
-- 208	20	149.99
-- 301	9	799.96
-- 301	24	599.97
-- 302	6	924.95
-- 302	25	699.96
-- 303	18	199.99
-- 304	14	184.99
-- 305	3	349.98
-- 305	19	349.98
-- 306	null null	
-- 307	5	524.97
-- 308	1	299.98
-- 401	11	1199.97
-- 401	17	1259.97
-- 401	22	1199.97
-- 402	null null	
-- ===========================================================================================================================

-- 5. Write a query that returns all the rooms accommodating at least three guests and that are reserved on any date in April 2023.
SELECT * FROM Room
INNER JOIN Reservation ON Room.roomID = Reservation.roomID 
WHERE maximun_occupancy >= 3 AND MONTH(start_date) = 4 AND YEAR(start_date) = 2023;

-- 9	301	No	2	4	199.99	10	2	9	Walter Holaway	1	0	2023-04-09 00:00:00	2023-04-13 00:00:00	799.96	9	9
-- ===========================================================================================================================

-- 6. Write a query that returns a list of all guest names and the number of reservations per guest, sorted starting with the guest with the most reservations and then by the guest's last name.
SELECT 
SUBSTRING_INDEX(Guest.`name`, ' ', -1) as LastName,
COUNT(reservation.reservationID) AS total_reservation
FROM Guest
INNER JOIN Reservation ON Guest.guestID = Reservation.guestID 
GROUP BY Reservation.guestId
ORDER BY total_reservation DESC;
 
-- Simmer	4
-- Seery	3
-- Okino	2
-- Cullison	2
-- Yang	2
-- Lipton	2
-- Holaway	2
-- Vise	2
-- Tilton	2
-- Tison	2
-- Luechtefeld	1
-- ===========================================================================================================================

-- 7. Write a query that displays the name, address, and phone number of a guest based on their phone number. (Choose a phone number from the existing data.)

SELECT `name`, address, phone FROM guest
WHERE phone = '(231) 893-2755';

-- Joleen Tison	87 Queen St.	(231) 893-2755