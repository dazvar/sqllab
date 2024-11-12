CREATE TABLE IF NOT EXISTS `Metro` (
    `metro_id` INT PRIMARY KEY,
    `metro_name` VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS `Stations` (
    `station_id` INT PRIMARY KEY,
    `station_name` VARCHAR(255) NOT NULL,
    `metro_id` INT,
    FOREIGN KEY (`metro_id`) REFERENCES `Metro`(`metro_id`)
);
CREATE TABLE IF NOT EXISTS `MetroLines` (
    `line_id` INT PRIMARY KEY,
    `line_name` VARCHAR(255) NOT NULL,
    `color` VARCHAR(50),
    `metro_id` INT,
    FOREIGN KEY (`metro_id`) REFERENCES `Metro`(`metro_id`)
);
CREATE TABLE IF NOT EXISTS `Station_Line` (
    `station_id` INT,
    `line_id` INT,
    `position_on_line` INT,
    PRIMARY KEY (`station_id`, `line_id`),
    FOREIGN KEY (`station_id`) REFERENCES `Stations`(`station_id`),
    FOREIGN KEY (`line_id`) REFERENCES `MetroLines`(`line_id`)
);
CREATE TABLE IF NOT EXISTS `Transfers` (
    `transfer_id` INT PRIMARY KEY AUTO_INCREMENT,
    `station_id_from` INT,
    `station_id_to` INT,
    `transfer_type` VARCHAR(50),
    `distance` DECIMAL(5,2),
    FOREIGN KEY (`station_id_from`) REFERENCES `Stations`(`station_id`),
    FOREIGN KEY (`station_id_to`) REFERENCES `Stations`(`station_id`)
);
CREATE TABLE IF NOT EXISTS `Line_Extensions` (
    `line_extension_id` INT PRIMARY KEY AUTO_INCREMENT,
    `line_id` INT,
    `station_id` INT,
    `action` ENUM('ADD', 'REMOVE') NOT NULL,
    `date` DATE,
    FOREIGN KEY (`line_id`) REFERENCES `MetroLines`(`line_id`),
    FOREIGN KEY (`station_id`) REFERENCES `Stations`(`station_id`)
);