CREATE TABLE IF NOT EXISTS User (
    personId int NOT NULL AUTO_INCREMENT,
    firstName varchar(255),
    lastName varchar(255),
    email varchar(255),
    street varchar(255),
    streetNr int,
    city varchar(255),
    password varchar(255),
    PRIMARY KEY (PersonId)
);

INSERT INTO User (firstName,lastName,email, street, StreetNr, City) 
VALUES ('Thomas','Czech', 'Kepplerstraße', 75, 'Pforzheim');