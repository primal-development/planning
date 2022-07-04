SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `Athlete`;
DROP TABLE IF EXISTS `Trainer`;
DROP TABLE IF EXISTS `PlannedActivity`;
DROP TABLE IF EXISTS `Activity`;
DROP TABLE IF EXISTS `athlete_trainer`;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE `Athlete` (
    `athlete_id` INTEGER NOT NULL AUTO_INCREMENT,
    `athlete_name` VARCHAR(30) NOT NULL,
    `athlete_lastname` VARCHAR(30) NOT NULL,
    `pass_hash` VARCHAR(300) NOT NULL,
    `athlete_salt` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`athlete_id`)
);

CREATE TABLE `Trainer` (
    `trainer_id` INTEGER NOT NULL AUTO_INCREMENT,
    `trainer_name` VARCHAR(30) NOT NULL,
    `trainer_lastname` VARCHAR(30) NOT NULL,
    `pass_hash` VARCHAR(300) NOT NULL,
    `trainer_salt` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`trainer_id`)
);

CREATE TABLE `PlannedActivity` (
    `activity_id` INTEGER NOT NULL AUTO_INCREMENT,
    `activity_name` VARCHAR(30) NOT NULL,
    `activity_description` VARCHAR(80),
    `activity_date` DATE,
    `time_of_day` varchar(1),
    `activity_img` BLOB,
    `athlete_id` INTEGER NOT NULL,
    PRIMARY KEY (`activity_id`)
);

CREATE TABLE `Activity` (
    `activity_id` INTEGER NOT NULL AUTO_INCREMENT,
    `activity_name` VARCHAR(30) NOT NULL,
    `activity_description` VARCHAR(80),
    `activity_location` POINT,
    `activity_time` DATETIME NOT NULL,
    `athlete_id` INTEGER NOT NULL,
    PRIMARY KEY (`activity_id`)
);

CREATE TABLE `athlete_trainer` (
    `athlete_id` INTEGER NOT NULL,
    `trainer_id` INTEGER NOT NULL,
    PRIMARY KEY (`athlete_id`, `trainer_id`)
);

ALTER TABLE `PlannedActivity` ADD FOREIGN KEY (`athlete_id`) REFERENCES `Athlete`(`athlete_id`);
ALTER TABLE `Activity` ADD FOREIGN KEY (`athlete_id`) REFERENCES `Athlete`(`athlete_id`);
ALTER TABLE `athlete_trainer` ADD FOREIGN KEY (`athlete_id`) REFERENCES `Athlete`(`athlete_id`);
ALTER TABLE `athlete_trainer` ADD FOREIGN KEY (`trainer_id`) REFERENCES `Trainer`(`trainer_id`);