SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `Athlete`;
DROP TABLE IF EXISTS `PlannedActivity`;
DROP TABLE IF EXISTS `Activity`;
DROP TABLE IF EXISTS `group`;
DROP TABLE IF EXISTS `Sport`;
DROP TABLE IF EXISTS `athlete_plannedActivity`;
DROP TABLE IF EXISTS `presences`;
DROP TABLE IF EXISTS `group_athlete`;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE `Athlete` (
    `athlete_id` INTEGER NOT NULL,
    `athlete_name` VARCHAR(30) NOT NULL,
    `athlete_lastname` VARCHAR(30) NOT NULL,
    `email_address` VARCHAR(30) NOT NULL,
    `pass_hash` VARCHAR(300) NOT NULL,
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
    `L1` TIME,
    `L2` TIME,
    `L3` TIME,
    `L4` TIME,
    `L5` TIME,
    `core` TIME,
    `arms` TIME,
    `legs` TIME,
    `agility` TIME,
    `technique` TIME,
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
    `L1` TIME,
    `L2` TIME,
    `L3` TIME,
    `L4` TIME,
    `L5` TIME,
    `core` TIME,
    `arms` TIME,
    `legs` TEXT,
    `agility` TIME,
    `technique` TIME,
    PRIMARY KEY (`activity_id`)
);

CREATE TABLE `group` (
    `group_id` INTEGER NOT NULL,
    `group_name` VARCHAR(30) NOT NULL,
    `trainer_id` INTEGER NOT NULL,
    PRIMARY KEY (`group_id`)
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

CREATE TABLE `group_athlete` (
    `group_id` INTEGER NOT NULL,
    `athlete_id` INTEGER NOT NULL,
    PRIMARY KEY (`group_id`, `athlete_id`)
);

ALTER TABLE `PlannedActivity` ADD FOREIGN KEY (`sport_id`) REFERENCES `Sport`(`sport_id`);
ALTER TABLE `Activity` ADD FOREIGN KEY (`athlete_id`) REFERENCES `Athlete`(`athlete_id`);
ALTER TABLE `Activity` ADD FOREIGN KEY (`sport_id`) REFERENCES `Sport`(`sport_id`);
ALTER TABLE `group` ADD FOREIGN KEY (`trainer_id`) REFERENCES `Athlete`(`athlete_id`);
ALTER TABLE `athlete_plannedActivity` ADD FOREIGN KEY (`athlete_id`) REFERENCES `Athlete`(`athlete_id`);
ALTER TABLE `athlete_plannedActivity` ADD FOREIGN KEY (`activity_id`) REFERENCES `PlannedActivity`(`activity_id`);
ALTER TABLE `presences` ADD FOREIGN KEY (`athlete_id`) REFERENCES `Athlete`(`athlete_id`);
ALTER TABLE `presences` ADD FOREIGN KEY (`activity_id`) REFERENCES `PlannedActivity`(`activity_id`);
ALTER TABLE `group_athlete` ADD FOREIGN KEY (`athlete_id`) REFERENCES `Athlete`(`athlete_id`);
ALTER TABLE `group_athlete` ADD FOREIGN KEY (`group_id`) REFERENCES `group`(`group_id`);