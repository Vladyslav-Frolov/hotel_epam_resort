-- MySQL Script generated by MySQL Workbench
-- Sat Oct  3 06:40:32 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

-- -----------------------------------------------------
-- Schema hotel
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `hotel` ;

-- -----------------------------------------------------
-- Schema hotel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hotel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `hotel` ;

-- -----------------------------------------------------
-- Table `hotel`.`applications`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel`.`applications` ;

CREATE TABLE IF NOT EXISTS `hotel`.`applications` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `client_id` INT NOT NULL,
  `number_of_adults` INT NOT NULL,
  `number_of_children` INT NOT NULL,
  `room_class_id` INT NOT NULL,
  `check_in` DATE NOT NULL,
  `check_out` DATE NOT NULL,
  PRIMARY KEY (`id`),
INDEX `fk_applications_clients1_idx` (`client_id` ASC) VISIBLE,
INDEX `fk_applications_room_classes1_idx` (`room_class_id` ASC) VISIBLE,
CONSTRAINT `fk_applications_clients1`
FOREIGN KEY (`client_id`)
REFERENCES `hotel`.`clients` (`id`),
CONSTRAINT `fk_applications_room_classes1`
FOREIGN KEY (`room_class_id`)
REFERENCES `hotel`.`room_classes` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel`.`clients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel`.`clients` ;

CREATE TABLE IF NOT EXISTS `hotel`.`clients` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `record_id` INT NOT NULL,
  `note` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `user_id`),
INDEX `fk_clients_users1_idx` (`user_id` ASC) VISIBLE,
INDEX `fk_clients_records1_idx` (`record_id` ASC) VISIBLE,
CONSTRAINT `fk_clients_records1`
FOREIGN KEY (`record_id`)
REFERENCES `hotel`.`records` (`id`),
CONSTRAINT `fk_clients_users1`
FOREIGN KEY (`user_id`)
REFERENCES `hotel`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel`.`order_flow`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel`.`order_flow` ;

CREATE TABLE IF NOT EXISTS `hotel`.`order_flow` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `application_id` INT NULL DEFAULT NULL,
  `staff_id` INT NULL DEFAULT NULL,
  `client_id` INT NOT NULL,
  `room_id` INT NOT NULL,
  `check_in` DATE NOT NULL,
  `check_out` DATE NOT NULL,
  `total_price` DOUBLE NOT NULL,
  `payment_status` ENUM('FALSE', 'TRUE') NOT NULL,
`start_booking` DATETIME(6) NOT NULL,
`room_order_status_id` INT NOT NULL,
PRIMARY KEY (`id`),
INDEX `fk_order_flow_room_statuses1_idx` (`room_order_status_id` ASC) VISIBLE,
INDEX `fk_order_flow_staff1_idx` (`staff_id` ASC) VISIBLE,
INDEX `fk_order_flow_clients1_idx` (`client_id` ASC) VISIBLE,
INDEX `fk_order_flow_rooms1_idx` (`room_id` ASC) VISIBLE,
CONSTRAINT `fk_order_flow_room_statuses1`
FOREIGN KEY (`room_order_status_id`)
REFERENCES `hotel`.`statuses` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
CONSTRAINT `fk_order_flow_staff1`
FOREIGN KEY (`staff_id`)
REFERENCES `hotel`.`staff` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
CONSTRAINT `fk_order_flow_clients1`
FOREIGN KEY (`client_id`)
REFERENCES `hotel`.`clients` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
CONSTRAINT `fk_order_flow_rooms1`
FOREIGN KEY (`room_id`)
REFERENCES `hotel`.`rooms` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel`.`positions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel`.`positions` ;

CREATE TABLE IF NOT EXISTS `hotel`.`positions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel`.`records`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel`.`records` ;

CREATE TABLE IF NOT EXISTS `hotel`.`records` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel`.`roles` ;

CREATE TABLE IF NOT EXISTS `hotel`.`roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(11) NOT NULL,
PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel`.`room_classes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel`.`room_classes` ;

CREATE TABLE IF NOT EXISTS `hotel`.`room_classes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel`.`room_types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel`.`room_types` ;

CREATE TABLE IF NOT EXISTS `hotel`.`room_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(45) NOT NULL,
  `abbreviation_name` VARCHAR(45) NOT NULL,
  `number_of_adults` INT NOT NULL,
  `number_of_children` INT NOT NULL,
PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel`.`rooms`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel`.`rooms` ;

CREATE TABLE IF NOT EXISTS `hotel`.`rooms` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `class_id` INT NOT NULL,
  `type_id` INT NOT NULL,
  `cost_per_day` DOUBLE NOT NULL,
  `floor` INT NOT NULL,
  PRIMARY KEY (`id`),
INDEX `fk_rooms_room_classes1_idx` (`class_id` ASC) VISIBLE,
INDEX `fk_rooms_room_types1_idx` (`type_id` ASC) VISIBLE,
CONSTRAINT `fk_rooms_room_classes1`
FOREIGN KEY (`class_id`)
REFERENCES `hotel`.`room_classes` (`id`),
CONSTRAINT `fk_rooms_room_types1`
FOREIGN KEY (`type_id`)
REFERENCES `hotel`.`room_types` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel`.`staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel`.`staff` ;

CREATE TABLE IF NOT EXISTS `hotel`.`staff` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `position_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
INDEX `fk_staff_users1_idx` (`user_id` ASC) VISIBLE,
INDEX `fk_staff_positions1_idx` (`position_id` ASC) VISIBLE,
CONSTRAINT `fk_staff_positions1`
FOREIGN KEY (`position_id`)
REFERENCES `hotel`.`positions` (`id`),
CONSTRAINT `fk_staff_users1`
FOREIGN KEY (`user_id`)
REFERENCES `hotel`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel`.`statuses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel`.`statuses` ;

CREATE TABLE IF NOT EXISTS `hotel`.`statuses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel`.`users` ;

CREATE TABLE IF NOT EXISTS `hotel`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(16) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
`create_time` TIMESTAMP(6) NOT NULL,
`first_name` VARCHAR(20) NOT NULL,
`last_name` VARCHAR(20) NOT NULL,
`role_id` INT NOT NULL,
PRIMARY KEY (`id`),
INDEX `fk_users_roles_idx` (`role_id` ASC) VISIBLE,
CONSTRAINT `fk_users_roles`
FOREIGN KEY (`role_id`)
REFERENCES `hotel`.`roles` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
