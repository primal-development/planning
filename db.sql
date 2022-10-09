SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `Athlete`;
DROP TABLE IF EXISTS `PlannedActivity`;
DROP TABLE IF EXISTS `Activity`;
DROP TABLE IF EXISTS `group`;
DROP TABLE IF EXISTS `Sport`;
DROP TABLE IF EXISTS `athlete_plannedActivity`;
DROP TABLE IF EXISTS `presences`;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE `Athlete` (
    `athlete_id` INTEGER NOT NULL,
    `athlete_name` VARCHAR(30) NOT NULL,
    `athlete_lastname` VARCHAR(30) NOT NULL,
    `pass_hash` VARCHAR(300) NOT NULL,
    `athlete_salt` VARCHAR(10),
    `refresh_token` VARCHAR(50),
    PRIMARY KEY (`athlete_id`)
);

CREATE TABLE `PlannedActivity` (
    `activity_id` INTEGER NOT NULL,
    `activity_name` VARCHAR(30) NOT NULL,
    `duration` TIME NOT NULL,
    `activity_description` VARCHAR(80),
    `activity_date` DATE,
    `time_of_day` VARCHAR(1),
    `activity_img` BLOB,
    `sport_id` INTEGER NOT NULL,
    `L1` DOUBLE,
    `L2` DOUBLE,
    `L3` DOUBLE,
    `L4` DOUBLE,
    `L5` DOUBLE,
    `core` DOUBLE,
    `arms` DOUBLE,
    `legs` DOUBLE,
    `agility` DOUBLE,
    `technique` DOUBLE,
    PRIMARY KEY (`activity_id`)
);

CREATE TABLE `Activity` (
    `activity_id` INTEGER NOT NULL,
    `activity_name` VARCHAR(30) NOT NULL,
    `start_time` DATETIME NOT NULL,
    `duration` TIME NOT NULL,
    `activity_description` VARCHAR(80),
    `distance` DOUBLE,
    `elevation` INTEGER,
    `avg_velocity` VARCHAR(10),
    `athlete_id` INTEGER NOT NULL,
    `sport_id` INTEGER NOT NULL,
    `L1` DOUBLE,
    `L2` DOUBLE,
    `L3` DOUBLE,
    `L4` DOUBLE,
    `L5` DOUBLE,
    `core` DOUBLE,
    `arms` DOUBLE,
    `legs` DOUBLE,
    `agility` DOUBLE,
    `technique` DOUBLE,
    PRIMARY KEY (`activity_id`)
);

CREATE TABLE `group` (
    `group_name` VARCHAR(30) NOT NULL,
    `athlete_id` INTEGER NOT NULL,
    `trainer_id` INTEGER NOT NULL,
    PRIMARY KEY (`group_name`)
);

CREATE TABLE `Sport` (
    `sport_id` INTEGER NOT NULL,
    `sport_name` VARCHAR(30) NOT NULL,
    PRIMARY KEY (`sport_id`),
    UNIQUE (`sport_name`)
);

CREATE TABLE `athlete_plannedActivity` (
    `athlete_id` INTEGER NOT NULL,
    `activity_id` INTEGER NOT NULL,
    PRIMARY KEY (`athlete_id`, `activity_id`)
);

CREATE TABLE `presences` (
    `athlete_id` INTEGER NOT NULL,
    `activity_id` INTEGER NOT NULL,
    PRIMARY KEY (`athlete_id`, `activity_id`)
);

ALTER TABLE `PlannedActivity` ADD FOREIGN KEY (`sport_id`) REFERENCES `Sport`(`sport_id`);
ALTER TABLE `Activity` ADD FOREIGN KEY (`athlete_id`) REFERENCES `Athlete`(`athlete_id`);
ALTER TABLE `Activity` ADD FOREIGN KEY (`sport_id`) REFERENCES `Sport`(`sport_id`);
ALTER TABLE `group` ADD FOREIGN KEY (`athlete_id`) REFERENCES `Athlete`(`athlete_id`);
ALTER TABLE `group` ADD FOREIGN KEY (`trainer_id`) REFERENCES `Athlete`(`athlete_id`);
ALTER TABLE `athlete_plannedActivity` ADD FOREIGN KEY (`athlete_id`) REFERENCES `Athlete`(`athlete_id`);
ALTER TABLE `athlete_plannedActivity` ADD FOREIGN KEY (`activity_id`) REFERENCES `PlannedActivity`(`activity_id`);
ALTER TABLE `presences` ADD FOREIGN KEY (`athlete_id`) REFERENCES `Athlete`(`athlete_id`);
ALTER TABLE `presences` ADD FOREIGN KEY (`activity_id`) REFERENCES `PlannedActivity`(`activity_id`);