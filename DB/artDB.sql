CREATE TABLE IF NOT EXISTS `exhibition` (
  `id` INT NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `museum_id` INT NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `start_date` DATE NULL DEFAULT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX (`museum_id` ASC),
  CONSTRAINT `fk_exhibition_museum`
    FOREIGN KEY (`museum_id`)  -- Specify the foreign key column from `exhibition` table
    REFERENCES `museum` (`id`) -- Reference the `id` column of the `museum` table
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
