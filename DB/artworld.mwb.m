-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema artworld
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `artworld` ;

-- -----------------------------------------------------
-- Schema artworld
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `artworld` ;
USE `artworld` ;

-- -----------------------------------------------------
-- Table `museum`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `museum` ;

CREATE TABLE IF NOT EXISTS `museum` (
  `id` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `location` VARCHAR(255) NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `website_url` VARCHAR(255) NULL DEFAULT NULL,
  `image` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `exhibition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exhibition` ;

CREATE TABLE IF NOT EXISTS `exhibition` (
  `id` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `museum_id` INT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `start_date` DATE NULL DEFAULT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX (`museum_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`museum_id`)
    REFERENCES `museum` (`id`));


-- -----------------------------------------------------
-- Table `artwork`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `artwork` ;

CREATE TABLE IF NOT EXISTS `artwork` (
  `id` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `artist` VARCHAR(255) NULL DEFAULT NULL,
  `exhibition_id` INT NULL DEFAULT NULL,
  `museum_id` INT NULL DEFAULT NULL,
  `creation_year` INT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `image` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX (`exhibition_id` ASC) VISIBLE,
  INDEX (`museum_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`exhibition_id`)
    REFERENCES `exhibition` (`id`),
  CONSTRAINT ``
    FOREIGN KEY (`museum_id`)
    REFERENCES `museum` (`id`));


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `username` VARCHAR(100) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `role` VARCHAR(50) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `review` ;

CREATE TABLE IF NOT EXISTS `review` (
  `id` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `user_id` INT NULL DEFAULT NULL,
  `exhibition_id` INT NULL DEFAULT NULL,
  `artwork_id` INT NULL DEFAULT NULL,
  `rating` INT NULL DEFAULT NULL,
  `comment` TEXT NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX (`user_id` ASC) VISIBLE,
  INDEX (`exhibition_id` ASC) VISIBLE,
  INDEX (`artwork_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`),
  CONSTRAINT ``
    FOREIGN KEY (`exhibition_id`)
    REFERENCES `exhibition` (`id`),
  CONSTRAINT ``
    FOREIGN KEY (`artwork_id`)
    REFERENCES `artwork` (`id`));


-- -----------------------------------------------------
-- Table `favorite`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favorite` ;

CREATE TABLE IF NOT EXISTS `favorite` (
  `id` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `user_id` INT NULL DEFAULT NULL,
  `exhibition_id` INT NULL DEFAULT NULL,
  `artwork_id` INT NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX (`user_id` ASC) VISIBLE,
  INDEX (`exhibition_id` ASC) VISIBLE,
  INDEX (`artwork_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`),
  CONSTRAINT ``
    FOREIGN KEY (`exhibition_id`)
    REFERENCES `exhibition` (`id`),
  CONSTRAINT ``
    FOREIGN KEY (`artwork_id`)
    REFERENCES `artwork` (`id`));

SET SQL_MODE = '';
DROP USER IF EXISTS Curator;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'Curator' IDENTIFIED BY 'curator2024';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'Curator';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `museum`
-- -----------------------------------------------------
START TRANSACTION;
USE `artworld`;
INSERT INTO `museum` (`id`, `name`, `location`, `description`, `website_url`, `image`, `created_at`, `updated_at`) VALUES (1, 'Art Museum', 'New York City', 'A world-renowned museum showcasing modern art.', 'http://www.artmuseum.com', 'museum_image.jpg', DEFAULT, DEFAULT);

COMMIT;

