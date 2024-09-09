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
  `id` INT NOT NULL AUTO_INCREMENT,
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
  `id` INT NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `museum_id` INT NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `start_date` DATE NULL DEFAULT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `artwork`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `artwork` ;

CREATE TABLE IF NOT EXISTS `artwork` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `artist` VARCHAR(255) NULL DEFAULT NULL,
  `exhibition_id` INT NOT NULL,
  `museum_id` INT NOT NULL,
  `creation_year` INT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `image` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `role` VARCHAR(50) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `review` ;

CREATE TABLE IF NOT EXISTS `review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `exhibition_id` INT NOT NULL,
  `artwork_id` INT NOT NULL,
  `rating` INT NULL DEFAULT NULL,
  `comment` TEXT NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `favorite`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favorite` ;

CREATE TABLE IF NOT EXISTS `favorite` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `exhibition_id` INT NOT NULL,
  `artwork_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));

SET SQL_MODE = '';
DROP USER IF EXISTS curator;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'curator' IDENTIFIED BY 'curator2024';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'curator';

-- -----------------------------------------------------
-- Data for table `museum`
-- -----------------------------------------------------
START TRANSACTION;
USE `artworld`;
INSERT INTO `museum` (`id`, `name`, `location`, `description`, `website_url`, `image`, `created_at`, `updated_at`) VALUES (1, 'Art Museum', 'New York City', 'A world-renowned museum showcasing modern art.', 'http://www.artmuseum.com', 'museum_image.jpg', '2023-08-15 14:30:00', '2024-02-10 10:15:00');

COMMIT;


-- -----------------------------------------------------
-- Data for table `exhibition`
-- -----------------------------------------------------
START TRANSACTION;
USE `artworld`;
INSERT INTO `exhibition` (`id`, `title`, `museum_id`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES (1, 'Impressionist Masterpieces', 1, '\"A stunning collection of Impressionist art from the late 19th and early 20th centuries, featuring works by Monet, Renoir, and Degas. This exhibition explores the techniques and themes that defined the movement, from the play of light to the beauty of everyday life.\"', '2023-02-01', '2023-12-31', '2022-12-20 11:45:30', '2023-12-01 09:50:00');

COMMIT;


-- -----------------------------------------------------
-- Data for table `artwork`
-- -----------------------------------------------------
START TRANSACTION;
USE `artworld`;
INSERT INTO `artwork` (`id`, `title`, `artist`, `exhibition_id`, `museum_id`, `creation_year`, `description`, `image`, `created_at`, `updated_at`) VALUES (1, 'The Starry Night', 'Vincent van Gogh', 1, 1, 1889, 'A famous post-impressionist painting by Van Gogh.', 'starry_night.jpg', '2023-03-12 09:12:00', '2024-02-28 11:20:10');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `artworld`;
INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES (1, 'artlover92', 'artlover92@example.com', 'password1', 'USER', '2023-01-10 08:23:45', '2024-03-20 14:10:21');

COMMIT;


-- -----------------------------------------------------
-- Data for table `review`
-- -----------------------------------------------------
START TRANSACTION;
USE `artworld`;
INSERT INTO `review` (`id`, `user_id`, `exhibition_id`, `artwork_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES (1, 1, 1, 1, 5, 'Incredible piece of work, truly inspiring!', '2023-08-15 12:05:30', '2023-08-16 09:45:00');

COMMIT;


-- -----------------------------------------------------
-- Data for table `favorite`
-- -----------------------------------------------------
START TRANSACTION;
USE `artworld`;
INSERT INTO `favorite` (`id`, `user_id`, `exhibition_id`, `artwork_id`, `created_at`) VALUES (1, 1, 1, 1, '2023-08-14 09:15:30');

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
