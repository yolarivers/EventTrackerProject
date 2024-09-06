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
CREATE SCHEMA IF NOT EXISTS `artworld` DEFAULT CHARACTER SET utf8 ;
USE `artworld` ;

-- -----------------------------------------------------
-- Table `museums`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `museums` ;

CREATE TABLE IF NOT EXISTS `museums` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `description` VARCHAR(450) NOT NULL,
  `website_url` VARCHAR(45) NOT NULL,
  `image` VARCHAR(2000) NULL,
  `created at` VARCHAR(45) NULL,
  `updated at` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `name`, `location`, `description`, `website_url`))
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS Curator;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'Curator' IDENTIFIED BY 'curator2024';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'Curator';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `museums`
-- -----------------------------------------------------
START TRANSACTION;
USE `artworld`;
INSERT INTO `museums` (`id`, `name`, `location`, `description`, `website_url`, `image`, `created at`, `updated at`) VALUES (1, 'Uffizi Galllery', 'Florence, Italy', 'Outstanding Collection', 'uffizi.it', 'uffizi.jpg', '2023-01-05-14:23:11', '2024-01-07-14:23:11');

COMMIT;

