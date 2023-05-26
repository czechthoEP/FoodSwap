
CREATE TABLE IF NOT EXISTS BuildingComplex (
    building_complex_id int NOT NULL AUTO_INCREMENT,
    tag varchar(255),
    PRIMARY KEY (building_complex_id)
);


CREATE TABLE IF NOT EXISTS Building (
    building_id int NOT NULL AUTO_INCREMENT,
    tag varchar(255),
    building_complex_id int NOT NULL ,
    PRIMARY KEY (building_id),
    FOREIGN KEY (building_complex_id) REFERENCES BuildingComplex(building_complex_id)
);

CREATE TABLE IF NOT EXISTS Permission (
    permission_id int NOT NULL AUTO_INCREMENT,
    start_date varchar(20) not null,
    end_date varchar(20) not null,
    start_time varchar(20) not null,
    end_time varchar(20) not null,
    value BOOLEAN NOT NULL,
    PRIMARY KEY (permission_id)
);


CREATE TABLE IF NOT EXISTS Room (
    permission_id int NOT NULL,
    room_id int NOT NULL AUTO_INCREMENT,
    min_body_temperature float NOT NULL,
    max_body_temperature float NOT NULL,
    building_id int NOT NULL,
    tag varchar(255),
    PRIMARY KEY (room_id),
    FOREIGN KEY (building_id) REFERENCES Building(building_id),
    FOREIGN KEY (permission_id) REFERENCES Permission(permission_id)
);


CREATE TABLE IF NOT EXISTS IoTDevice (
    iot_id int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (iot_id)
);

CREATE TABLE IF NOT EXISTS Rule (
    rule_id int NOT NULL AUTO_INCREMENT,
    rule_name varchar(255) NOT NULL,
    rule_expression varchar(255) NOT NULL,
    iot_id int NOT NULL,
    PRIMARY KEY (rule_id),
    FOREIGN KEY (iot_id) REFERENCES IoTDevice(iot_id)
);

CREATE TABLE IF NOT EXISTS Door (
    door_id int NOT NULL AUTO_INCREMENT,
    room_id int NOT NULL,
    iot_id int NOT NULL,
    PRIMARY KEY (door_id),
    FOREIGN KEY (room_id) REFERENCES Room(room_id),
    FOREIGN KEY (iot_id) REFERENCES IoTDevice(iot_id)
);

CREATE TABLE IF NOT EXISTS Role (
    role_id int NOT NULL,
    role_name varchar(255) NOT NULL,
    PRIMARY KEY (role_id)
);

CREATE TABLE IF NOT EXISTS Person (
    id int NOT NULL AUTO_INCREMENT,
    email varchar(255) NOT NULL UNIQUE,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    start_date varchar(20) ,
    end_date varchar(20),
    start_time varchar(20),
    end_time varchar(20),
    role_id int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES Role(role_id)
);

CREATE TABLE IF NOT EXISTS enters (
    door_id int NOT NULL,
    id int NOT NULL,
    time_stamp varchar(50),
    PRIMARY KEY (door_id),
    FOREIGN KEY (id) REFERENCES Person(id)
);

CREATE TABLE IF NOT EXISTS RuleStorage (
    rule_id int NOT NULL AUTO_INCREMENT,
    rule_name varchar(255) NOT NULL,
    rule_expression text  NOT NULL,
    PRIMARY KEY (rule_id)
);

CREATE TABLE IF NOT EXISTS Request (
    request_id int NOT NULL AUTO_INCREMENT,
    start_date varchar(20) not null,
    end_date varchar(20) not null,
    start_time varchar(20) not null,
    end_time varchar(20) not null,
    description varchar(255) NOT NULL,
    permission_id int NOT NULL,
    time_stamp varchar(50) not null,
    state BOOLEAN NOT NULL,
    PRIMARY KEY (request_id)
);

CREATE TABLE IF NOT EXISTS has (
    room_id int NOT NULL,
     id int NOT NULL,
    request_id int NOT NULL,
    PRIMARY KEY (room_id),
    FOREIGN KEY (room_id) REFERENCES Room(room_id),
    FOREIGN KEY (request_id) REFERENCES Request(request_id),
    FOREIGN KEY (id) REFERENCES Person(id)
);
