DROP DATABASE IF EXISTS HotelDB;

CREATE DATABASE HotelDB;

USE HotelDB;

CREATE TABLE Guest (
    guestID INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(100) NOT NULL,
    zip VARCHAR(50) NOT NULL,
    phone VARCHAR(25) NOT NULL
);

CREATE TABLE Amenity (
	amenityID INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(50) NOT NULL
);

CREATE TABLE RoomType (
	room_typeID INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(50) NOT NULL
);

CREATE TABLE Room (
	roomID INT PRIMARY KEY AUTO_INCREMENT,
    room_number INT NOT NULL,
    ada_accessible VARCHAR(5) NOT NULL,
    standard_occupancy INT NOT NULL,
    maximun_occupancy INT NOT NULL,
    base_price DOUBLE NOT NULL,
    extra_person DOUBLE,
    room_typeID INT NOT NULL
);

CREATE TABLE Reservation (
    reservationID INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    adults INT NOT NULL,
    children INT NOT NULL,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    total_room_cost DOUBLE NOT NULL,
    roomID INT NOT NULL,
    guestID INT NOT NULL,
    CONSTRAINT fk_Reservation_Room
        FOREIGN KEY (roomID) 
        REFERENCES Room(roomID),
	CONSTRAINT fk_Guest_Reservation
        FOREIGN KEY (guestID) 
        REFERENCES Guest(guestID)
);

CREATE TABLE RoomAmenity (
	roomID INT NOT NULL,
    amenityID INT NOT NULL,
    PRIMARY KEY pk_RoomAmenity (roomID, amenityID),
    FOREIGN KEY fk_RoomAmenity_Room (roomID)
		REFERENCES Room(roomID),
	FOREIGN KEY fk_RoomAmenity_Amenity (amenityID)
		REFERENCES Amenity(amenityID)
);
