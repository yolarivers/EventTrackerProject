-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema artworlddb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `artworlddb` ;

-- -----------------------------------------------------
-- Schema artworlddb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `artworlddb` ;
USE `artworlddb` ;

-- -----------------------------------------------------
-- Table `museum`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `museum` ;

CREATE TABLE IF NOT EXISTS `museum` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `location` VARCHAR(255) NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `website_url` VARCHAR(2000) NULL DEFAULT NULL,
  `image_url` VARCHAR(2000) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `exhibition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exhibition` ;

CREATE TABLE IF NOT EXISTS `exhibition` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `start_date` DATE NULL DEFAULT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `image_url` VARCHAR(2000) NULL,
  `museum_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_exhibition_museum1_idx` (`museum_id` ASC) VISIBLE,
  CONSTRAINT `fk_exhibition_museum1`
    FOREIGN KEY (`museum_id`)
    REFERENCES `museum` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


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
  `enabled` TINYINT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `artwork`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `artwork` ;

CREATE TABLE IF NOT EXISTS `artwork` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `artist` VARCHAR(255) NULL DEFAULT NULL,
  `creation_year` INT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `image_url` VARCHAR(2000) NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `user_id` INT NOT NULL,
  `museum_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_artwork_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_artwork_museum1_idx` (`museum_id` ASC) VISIBLE,
  CONSTRAINT `fk_artwork_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artwork_museum1`
    FOREIGN KEY (`museum_id`)
    REFERENCES `museum` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `artwork_review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `artwork_review` ;

CREATE TABLE IF NOT EXISTS `artwork_review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rating` INT NULL DEFAULT NULL,
  `comment` TEXT NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `artwork_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_artwork_review_artwork1_idx` (`artwork_id` ASC) VISIBLE,
  INDEX `fk_artwork_review_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_artwork_review_artwork1`
    FOREIGN KEY (`artwork_id`)
    REFERENCES `artwork` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artwork_review_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `favorite_artwork`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favorite_artwork` ;

CREATE TABLE IF NOT EXISTS `favorite_artwork` (
  `user_id` INT NOT NULL,
  `artwork_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `artwork_id`),
  INDEX `fk_user_has_artwork_artwork1_idx` (`artwork_id` ASC) VISIBLE,
  INDEX `fk_user_has_artwork_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_artwork_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_artwork_artwork1`
    FOREIGN KEY (`artwork_id`)
    REFERENCES `artwork` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `favorite_exhibitions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favorite_exhibitions` ;

CREATE TABLE IF NOT EXISTS `favorite_exhibitions` (
  `user_id` INT NOT NULL,
  `exhibition_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `exhibition_id`),
  INDEX `fk_user_has_exhibition_exhibition1_idx` (`exhibition_id` ASC) VISIBLE,
  INDEX `fk_user_has_exhibition_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_exhibition_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_exhibition_exhibition1`
    FOREIGN KEY (`exhibition_id`)
    REFERENCES `exhibition` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `exhibition_has_artwork`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exhibition_has_artwork` ;

CREATE TABLE IF NOT EXISTS `exhibition_has_artwork` (
  `artwork_id` INT NOT NULL,
  `exhibition_id` INT NOT NULL,
  PRIMARY KEY (`artwork_id`, `exhibition_id`),
  INDEX `fk_artwork_has_exhibition_exhibition1_idx` (`exhibition_id` ASC) VISIBLE,
  INDEX `fk_artwork_has_exhibition_artwork1_idx` (`artwork_id` ASC) VISIBLE,
  CONSTRAINT `fk_artwork_has_exhibition_artwork1`
    FOREIGN KEY (`artwork_id`)
    REFERENCES `artwork` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artwork_has_exhibition_exhibition1`
    FOREIGN KEY (`exhibition_id`)
    REFERENCES `exhibition` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `exhibition_review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exhibition_review` ;

CREATE TABLE IF NOT EXISTS `exhibition_review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rating` INT NULL DEFAULT NULL,
  `comment` TEXT NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `exhibition_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_exhibition_review_exhibition1_idx` (`exhibition_id` ASC) VISIBLE,
  INDEX `fk_exhibition_review_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_exhibition_review_exhibition1`
    FOREIGN KEY (`exhibition_id`)
    REFERENCES `exhibition` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exhibition_review_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

SET SQL_MODE = '';
DROP USER IF EXISTS curator;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'curator' IDENTIFIED BY 'curator';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'curator';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `museum`
-- -----------------------------------------------------
START TRANSACTION;
USE `artworlddb`;
INSERT INTO `museum` (`id`, `name`, `location`, `description`, `website_url`, `image_url`, `created_at`, `updated_at`) VALUES (1, 'Waters-Effertz', '57 Portage Alley', 'Nunc nisl. Duis bibendum, felis sed vehicula tempus, felis justo fermentum justo. ', 'https://google.es/ultrices/aliquet/maecenas/leo/odio.xml?montes=pellentesque&nascetur=at&ridiculus=nulla&mus=suspendisse&etiam=potenti&vel=cras&augue=in&vestibulum=purus&rutrum=eu&rutrum=magna&neque=vulputate&aenean=luctus&auctor=cum&gravida=sociis&sem=natoque&praesent=penatibus&id=et&massa=magnis&id=dis&nisl=parturient&venenatis=montes&lacinia=nascetur&aenean=ridiculus&sit=mus&amet=vivamus&justo=vestibulum&morbi=sagittis&ut=sapien', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/National_Museum_of_Modern_Art_Kyoto_2010.jpg/749px-National_Museum_of_Modern_Art_Kyoto_2010.jpg?20190209061344', '2022-07-06', '2023-07-06');
INSERT INTO `museum` (`id`, `name`, `location`, `description`, `website_url`, `image_url`, `created_at`, `updated_at`) VALUES (2, 'Collins-Bode', '15349 Waywood Circle', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', 'http://dummyimage.com/171x100.png/5fa2dd/ffffff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Museum_of_Modern_Art_Saitama_2010.jpg/796px-Museum_of_Modern_Art_Saitama_2010.jpg?20100705084442', '2022-07-06', '2023-07-06');
INSERT INTO `museum` (`id`, `name`, `location`, `description`, `website_url`, `image_url`, `created_at`, `updated_at`) VALUES (3, 'Gleichner-Braun', '62 Thierer Way', 'Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti.', 'https://nature.com/pulvinar/nulla/pede/ullamcorper/augue/a/suscipit.html?aliquam=sed&lacus=justo&morbi=pellentesque&quis=viverra&tortor=pede&id=ac&nulla=diam&ultrices=cras&aliquet=pellentesque&maecenas=volutpat&leo=dui&odio=maecenas&condimentum=tristique&id=est&luctus=et&nec=tempus&molestie=semper&sed=est&justo=quam&pellentesque=pharetra&viverra=magna&pede=ac&ac=consequat&diam=metus&cras=sapien&pellentesque=ut&volutpat=nunc&dui=vestibulum&maecenas=ante&tristique=ipsum&est=primis&et=in&tempus=faucibus&semper=orci&est=luctus&quam=et&pharetra=ultrices&magna=posuere&ac=cubilia&consequat=curae&metus=mauris&sapien=viverra&ut=diam&nunc=vitae&vestibulum=quam&ante=suspendisse&ipsum=potenti&primis=nullam&in=porttitor&faucibus=lacus&orci=at&luctus=turpis&et=donec&ultrices=posuere&posuere=metus&cubilia=vitae&curae=ipsum&mauris=aliquam&viverra=non&diam=mauris&vitae=morbi&quam=non&suspendisse=lectus&potenti=aliquam&nullam=sit&porttitor=amet&lacus=diam&at=in&turpis=magna&donec=bibendum&posuere=imperdiet&metus=nullam&vitae=orci&ipsum=pede&aliquam=venenatis&non=non&mauris=sodales&morbi=sed&non=tincidunt&lectus=eu&aliquam=felis&sit=fusce&amet=posuere&diam=felis&in=sed&magna=lacus&bibendum=morbi&imperdiet=sem&nullam=mauris&orci=laoreet&pede=ut&venenatis=rhoncus&non=aliquet', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/Middlesbrough_Institute_of_Modern_Art_-_MIMA.jpg/800px-Middlesbrough_Institute_of_Modern_Art_-_MIMA.jpg?20130323213837', '2022-07-06', '2023-07-06');
INSERT INTO `museum` (`id`, `name`, `location`, `description`, `website_url`, `image_url`, `created_at`, `updated_at`) VALUES (4, 'Fritsch-Schaefer', '746 Starling Street', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', 'http://google.co.jp/lorem/id/ligula.jsp?turpis=libero&nec=ut&euismod=massa&scelerisque=volutpat&quam=convallis&turpis=morbi&adipiscing=odio&lorem=odio&vitae=elementum&mattis=eu&nibh=interdum&ligula=eu&nec=tincidunt&sem=in&duis=leo&aliquam=maecenas&convallis=pulvinar', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Krakow_-_Concrete_bicycles_at_Museum_of_Modern_Art.jpg/800px-Krakow_-_Concrete_bicycles_at_Museum_of_Modern_Art.jpg?20191128123609', '2022-07-06', '2023-07-06');
INSERT INTO `museum` (`id`, `name`, `location`, `description`, `website_url`, `image_url`, `created_at`, `updated_at`) VALUES (5, 'Beer-Hayes', '6 Straubel Center', 'Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 'https://arizona.edu/pulvinar/nulla/pede/ullamcorper.jsp?donec=faucibus&dapibus=orci&duis=luctus&at=et&velit=ultrices&eu=posuere&est=cubilia&congue=curae&elementum=nulla&in=dapibus&hac=dolor&habitasse=vel&platea=est&dictumst=donec&morbi=odio&vestibulum=justo&velit=sollicitudin&id=ut&pretium=suscipit&iaculis=a&diam=feugiat&erat=et&fermentum=eros&justo=vestibulum&nec=ac&condimentum=est&neque=lacinia&sapien=nisi&placerat=venenatis&ante=tristique&nulla=fusce&justo=congue&aliquam=diam&quis=id&turpis=ornare&eget=imperdiet&elit=sapien&sodales=urna&scelerisque=pretium&mauris=nisl&sit=ut&amet=volutpat&eros=sapien&suspendisse=arcu&accumsan=sed&tortor=augue&quis=aliquam&turpis=erat&sed=volutpat&ante=in&vivamus=congue&tortor=etiam&duis=justo&mattis=etiam&egestas=pretium&metus=iaculis&aenean=justo&fermentum=in&donec=hac&ut=habitasse&mauris=platea&eget=dictumst&massa=etiam&tempor=faucibus&convallis=cursus&nulla=urna&neque=ut&libero=tellus&convallis=nulla&eget=ut&eleifend=erat&luctus=id&ultricies=mauris&eu=vulputate&nibh=elementum', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Scottish_National_Gallery_of_Modern_Art_One_-_geograph.org.uk_-_3538238.jpg/800px-Scottish_National_Gallery_of_Modern_Art_One_-_geograph.org.uk_-_3538238.jpg?20220518175756', '2022-07-06', '2023-07-06');
INSERT INTO `museum` (`id`, `name`, `location`, `description`, `website_url`, `image_url`, `created_at`, `updated_at`) VALUES (6, 'Monahan Group', '85 Springs Drive', 'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 'http://godaddy.com/porttitor/pede/justo.xml?non=feugiat&sodales=et&sed=eros&tincidunt=vestibulum&eu=ac&felis=est&fusce=lacinia&posuere=nisi&felis=venenatis&sed=tristique&lacus=fusce&morbi=congue', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Qingguo_Lane_Modern_Art_Sculpture.jpg/800px-Qingguo_Lane_Modern_Art_Sculpture.jpg?20230512104103', '2022-07-06', '2023-07-06');
INSERT INTO `museum` (`id`, `name`, `location`, `description`, `website_url`, `image_url`, `created_at`, `updated_at`) VALUES (7, 'Braun and Sons', '7237 Debra Place', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.', 'http://sphinn.com/quis/orci/eget/orci/vehicula.xml?ipsum=nascetur&primis=ridiculus&in=mus&faucibus=vivamus&orci=vestibulum&luctus=sagittis&et=sapien&ultrices=cum&posuere=sociis&cubilia=natoque&curae=penatibus&mauris=et&viverra=magnis&diam=dis&vitae=parturient&quam=montes&suspendisse=nascetur&potenti=ridiculus&nullam=mus&porttitor=etiam&lacus=vel&at=augue&turpis=vestibulum&donec=rutrum&posuere=rutrum&metus=neque&vitae=aenean&ipsum=auctor&aliquam=gravida&non=sem&mauris=praesent&morbi=id&non=massa&lectus=id&aliquam=nisl&sit=venenatis&amet=lacinia&diam=aenean&in=sit&magna=amet&bibendum=justo&imperdiet=morbi&nullam=ut&orci=odio&pede=cras&venenatis=mi&non=pede&sodales=malesuada&sed=in&tincidunt=imperdiet&eu=et&felis=commodo&fusce=vulputate&posuere=justo&felis=in&sed=blandit&lacus=ultrices&morbi=enim&sem=lorem&mauris=ipsum&laoreet=dolor&ut=sit&rhoncus=amet&aliquet=consectetuer&pulvinar=adipiscing&sed=elit&nisl=proin&nunc=interdum&rhoncus=mauris&dui=non&vel=ligula&sem=pellentesque&sed=ultrices', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Queensland_Gallery_of_Modern_Art_at_dusk%2C_Brisbane%2C_2019.jpg/799px-Queensland_Gallery_of_Modern_Art_at_dusk%2C_Brisbane%2C_2019.jpg?20191007122613', '2022-07-06', '2023-07-06');
INSERT INTO `museum` (`id`, `name`, `location`, `description`, `website_url`, `image_url`, `created_at`, `updated_at`) VALUES (8, 'Green Group', '01 Raven Street', 'Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.', 'https://etsy.com/turpis/integer.js?ultricies=pede&eu=venenatis&nibh=non&quisque=sodales&id=sed&justo=tincidunt&sit=eu&amet=felis&sapien=fusce&dignissim=posuere&vestibulum=felis&vestibulum=sed&ante=lacus&ipsum=morbi&primis=sem', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Modern_art_near_the_plaza_in_CZ.jpg/800px-Modern_art_near_the_plaza_in_CZ.jpg?20230518063934', '2022-07-06', '2023-07-06');
INSERT INTO `museum` (`id`, `name`, `location`, `description`, `website_url`, `image_url`, `created_at`, `updated_at`) VALUES (9, 'Considine-Bednar', '1 Barnett Road', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.', 'http://github.io/interdum/mauris.aspx?et=cubilia&magnis=curae&dis=mauris&parturient=viverra&montes=diam&nascetur=vitae&ridiculus=quam&mus=suspendisse&etiam=potenti&vel=nullam&augue=porttitor&vestibulum=lacus&rutrum=at&rutrum=turpis&neque=donec&aenean=posuere&auctor=metus&gravida=vitae&sem=ipsum&praesent=aliquam&id=non&massa=mauris&id=morbi&nisl=non&venenatis=lectus&lacinia=aliquam&aenean=sit&sit=amet&amet=diam&justo=in&morbi=magna&ut=bibendum&odio=imperdiet&cras=nullam&mi=orci&pede=pede&malesuada=venenatis&in=non&imperdiet=sodales&et=sed&commodo=tincidunt&vulputate=eu&justo=felis&in=fusce&blandit=posuere&ultrices=felis&enim=sed&lorem=lacus', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Asia_Museum_of_Modern_Art_2022.jpg/800px-Asia_Museum_of_Modern_Art_2022.jpg?20230624101504', '2022-07-06', '2023-07-06');
INSERT INTO `museum` (`id`, `name`, `location`, `description`, `website_url`, `image_url`, `created_at`, `updated_at`) VALUES (10, 'Franecki, Toy and Prohaska', '2 Sundown Terrace', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'http://slate.com/varius/nulla/facilisi/cras/non.jpg?massa=massa&tempor=id&convallis=lobortis&nulla=convallis&neque=tortor&libero=risus&convallis=dapibus&eget=augue&eleifend=vel&luctus=accumsan&ultricies=tellus&eu=nisi&nibh=eu&quisque=orci&id=mauris&justo=lacinia&sit=sapien&amet=quis&sapien=libero&dignissim=nullam&vestibulum=sit&vestibulum=amet&ante=turpis&ipsum=elementum&primis=ligula&in=vehicula&faucibus=consequat&orci=morbi&luctus=a&et=ipsum&ultrices=integer&posuere=a&cubilia=nibh&curae=in&nulla=quis&dapibus=justo&dolor=maecenas&vel=rhoncus&est=aliquam&donec=lacus&odio=morbi&justo=quis&sollicitudin=tortor&ut=id&suscipit=nulla&a=ultrices&feugiat=aliquet&et=maecenas&eros=leo&vestibulum=odio&ac=condimentum&est=id&lacinia=luctus&nisi=nec&venenatis=molestie&tristique=sed&fusce=justo&congue=pellentesque&diam=viverra&id=pede&ornare=ac&imperdiet=diam&sapien=cras&urna=pellentesque&pretium=volutpat&nisl=dui&ut=maecenas&volutpat=tristique&sapien=est&arcu=et&sed=tempus&augue=semper&aliquam=est&erat=quam&volutpat=pharetra&in=magna&congue=ac&etiam=consequat&justo=metus&etiam=sapien&pretium=ut', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/San_Francisco_Museum_of_Modern_Art_Full.jpg/800px-San_Francisco_Museum_of_Modern_Art_Full.jpg?20060731083844', '2022-07-06', '2023-07-06');
INSERT INTO `museum` (`id`, `name`, `location`, `description`, `website_url`, `image_url`, `created_at`, `updated_at`) VALUES (11, 'Dada Destiny', '23 Trip Road', 'Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'http://square.com/quis/orci/eget/orci/vehicula.xml?ipsum=nascetur&primis=ridiculus&in=mus&faucibus=vivamus&orci=vestibulum&luctus=sagittis&et=sapien&ultrices=cum&posuere=sociis&cubilia=natoque&curae=penatibus&mauris=et&viverra=magnis&diam=dis&vitae=parturient&quam=montes&suspendisse=nascetur&potenti=ridiculus&nullam=mus&porttitor=etiam&lacus=vel&at=augue&turpis=vestibulum&donec=rutrum&posuere=rutrum&metus=neque&vitae=aenean&ipsum=auctor&aliquam=gravida&non=sem&mauris=praesent&morbi=id&non=massa&lectus=id&aliquam=nisl&sit=venenatis&amet=lacinia&diam=aenean&in=sit&magna=amet&bibendum=justo&imperdiet=morbi&nullam=ut&orci=odio&pede=cras&venenatis=mi&non=pede&sodales=malesuada&sed=in&tincidunt=imperdiet&eu=et&felis=commodo&fusce=vulputate&posuere=justo&felis=in&sed=blandit&lacus=ultrices&morbi=enim&sem=lorem&mauris=ipsum&laoreet=dolor&ut=sit&rhoncus=amet&aliquet=consectetuer&pulvinar=adipiscing&sed=elit&nisl=proin&nunc=interdum&rhoncus=mauris&dui=non&vel=ligula&sem=pellentesque&sed=ultrices', 'https://upload.wikimedia.org/wikipedia/commons/9/91/Asia_Museum_of_Modern_Art_%282%29.jpg?20150618063458', '2023-08-08', '2024-08-09');
INSERT INTO `museum` (`id`, `name`, `location`, `description`, `website_url`, `image_url`, `created_at`, `updated_at`) VALUES (12, 'Proto Art', NULL, 'Bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, , pretium quis, lectus.', 'http://sphinn.com/quis/orci/eget/orci/vehicula.xml?ipsum=nascetur&primis=ridiculus&in=mus&faucibus=vivamus&orci=vestibulum&luctus=sagittis&et=sapien&ultrices=cum&posuere=sociis&cubilia=natoque&curae=penatibus&mauris=et&viverra=magnis&diam=dis&vitae=parturient&quam=montes&suspendisse=nascetur&potenti=ridiculus&nullam=mus&porttitor=etiam&lacus=vel&at=augue&turpis=vestibulum&donec=rutrum&posuere=rutrum&metus=neque&vitae=aenean&ipsum=auctor&aliquam=gravida&non=sem&mauris=praesent&morbi=id&non=massa&lectus=id&aliquam=nisl&sit=venenatis&amet=lacinia&diam=aenean&in=sit&magna=amet&bibendum=justo&imperdiet=morbi&nullam=ut&orci=odio&pede=cras&venenatis=mi&non=pede&sodales=malesuada&sed=in&tincidunt=imperdiet&eu=et&felis=commodo&fusce=vulputate&posuere=justo&felis=in&sed=blandit&lacus=ultrices&morbi=enim&sem=lorem&mauris=ipsum&laoreet=dolor&ut=sit&rhoncus=amet&aliquet=consectetuer&pulvinar=adipiscing&sed=elit&nisl=proin&nunc=interdum&rhoncus=pellentesque&sed=ultrices', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/The_museum_of_modern_art%2C_wakayama03s3200.jpg/800px-The_museum_of_modern_art%2C_wakayama03s3200.jpg?20100503020812', '2023-08-08', '2024-08-09');

COMMIT;


-- -----------------------------------------------------
-- Data for table `exhibition`
-- -----------------------------------------------------
START TRANSACTION;
USE `artworlddb`;
INSERT INTO `exhibition` (`id`, `title`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`, `image_url`, `museum_id`) VALUES (1, 'Submerged', 'Solo art exhibition Submerged', '2024-10-08', '2024-11-09', '2023-05-07', '2024-09-07', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Robert_Standish_Submerged_solo_art_exhibition_at_Shoshana_Wayne_Gallery_in_Santa_Monica%2C_California_in_2004.jpg/800px-Robert_Standish_Submerged_solo_art_exhibition_at_Shoshana_Wayne_Gallery_in_Santa_Monica%2C_California_in_2004.jpg?20240222170440', 1);
INSERT INTO `exhibition` (`id`, `title`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`, `image_url`, `museum_id`) VALUES (2, 'Diego Rivera', 'Universal Artist', '2024-10-08', '2024-11-09', '2023-05-07', '2024-09-07', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Orizaba-_Veracruz_State_Art_Museum-_Diego_Rivera_exhibition.jpg/800px-Orizaba-_Veracruz_State_Art_Museum-_Diego_Rivera_exhibition.jpg?20220806005701', 2);
INSERT INTO `exhibition` (`id`, `title`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`, `image_url`, `museum_id`) VALUES (3, 'Progress and Hygiene', 'Mon mauris artista', '2024-10-08', '2024-11-09', '2023-05-07', '2024-09-07', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Exhibitions_at_Zach%C4%99ta_National_Gallery_of_Art_04.JPG/800px-Exhibitions_at_Zach%C4%99ta_National_Gallery_of_Art_04.JPG?20150205170834', 3);
INSERT INTO `exhibition` (`id`, `title`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`, `image_url`, `museum_id`) VALUES (4, 'Journey', 'Magna ac festa', '2024-10-08', '2024-11-09', '2023-05-07', '2024-09-07', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Journey_Art_Exhibition_by_Stefano_Canturi.jpg/800px-Journey_Art_Exhibition_by_Stefano_Canturi.jpg?20180704065927', 4);
INSERT INTO `exhibition` (`id`, `title`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`, `image_url`, `museum_id`) VALUES (5, 'MIME', 'Dempus semper', '2024-10-08', '2024-11-09', '2023-05-07', '2024-09-07', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/June_2019_exhibitions_at_Queensland_Art_Gallery%2C_Brisbane_04.jpg/800px-June_2019_exhibitions_at_Queensland_Art_Gallery%2C_Brisbane_04.jpg?20190603112619', 5);
INSERT INTO `exhibition` (`id`, `title`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`, `image_url`, `museum_id`) VALUES (6, 'Spectrum', 'Commodo vulputate', '2024-10-08', '2024-11-09', '2023-05-07', '2024-09-07', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Robert_Standish_solo_Spectrum_exhibition_at_Museum_of_Art_and_History_in_Lancaster%2C_California_in_2020.jpg/800px-Robert_Standish_solo_Spectrum_exhibition_at_Museum_of_Art_and_History_in_Lancaster%2C_California_in_2020.jpg?20240222165121', 6);
INSERT INTO `exhibition` (`id`, `title`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`, `image_url`, `museum_id`) VALUES (7, 'A Matter of Conscience', 'Massa id', '2024-10-08', '2024-11-09', '2023-05-07', '2024-09-07', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/A-Matter-of-Conscience-Installation-Addison-Gallerty-of-American-Art-1992-001.jpg/800px-A-Matter-of-Conscience-Installation-Addison-Gallerty-of-American-Art-1992-001.jpg?20200608184906', 4);
INSERT INTO `exhibition` (`id`, `title`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`, `image_url`, `museum_id`) VALUES (8, 'Catching Dreams', 'Ultlat ultrices', '2024-10-08', '2024-11-09', '2023-05-07', '2024-09-07', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Catching_Dreams-254.jpg/1280px-Catching_Dreams-254.jpg', 2);
INSERT INTO `exhibition` (`id`, `title`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`, `image_url`, `museum_id`) VALUES (9, 'Enamel Amor', 'Prulvinar nulla pede ullamcorper augue', '2024-10-08', '2024-11-09', '2023-05-07', '2024-09-07', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Emaljkonstutst%C3%A4llning_Gustavsbergs_porslinsmuseum.JPG/1280px-Emaljkonstutst%C3%A4llning_Gustavsbergs_porslinsmuseum.JPG', 6);
INSERT INTO `exhibition` (`id`, `title`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`, `image_url`, `museum_id`) VALUES (10, 'The Eye', 'Herws neo wqpq poeq', '2024-10-08', '2024-11-09', '2023-05-07', '2024-09-07', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Every_eye_exhibition_at_The_Drawing_Room.jpg/1280px-Every_eye_exhibition_at_The_Drawing_Room.jpg', 7);
INSERT INTO `exhibition` (`id`, `title`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`, `image_url`, `museum_id`) VALUES (11, 'Flag Metamorphoses', 'Commodo polputate', '2024-10-08', '2024-11-09', '2023-05-07', '2024-09-07', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Flagmetamorphoses-hallezehn-cologne-april2010.jpg/1920px-Flagmetamorphoses-hallezehn-cologne-april2010.jpg', 5);
INSERT INTO `exhibition` (`id`, `title`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`, `image_url`, `museum_id`) VALUES (12, 'Lightness and dynamism', 'Skemmodo vulsatute', '2024-10-08', '2024-11-09', '2023-05-07', '2024-09-07', 'https://upload.wikimedia.org/wikipedia/commons/5/5e/Circles_of_Life_sculpture_by_Renn_at_59th_Biennale_Arte_in_Venice_CC%C2%A9Alberta-Cuccia-IMG_1564.jpg', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `artworlddb`;
INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`, `enabled`) VALUES (1, 'gbetterton0', 'plestrange0@mapy.cz', '$2a$10$nShOi5/f0bKNvHB8x0u3qOpeivazbuN0NE4TO0LGvQiTMafaBxLJS', 'user', '2023-08-04', '2024-08-04', 1);
INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`, `enabled`) VALUES (2, 'flavery1', 'ogottschalk1@reverbnation.com', '$2a$10$nShOi5/f0bKNvHB8x0u3qOpeivazbuN0NE4TO0LGvQiTMafaBxLJS', 'user', '2023-08-04', '2024-08-04', 1);
INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`, `enabled`) VALUES (3, 'rmyring2', 'zklimek2@abc.net.au', '$2a$10$nShOi5/f0bKNvHB8x0u3qOpeivazbuN0NE4TO0LGvQiTMafaBxLJS', 'admin', '2023-08-04', '2024-08-04', 1);
INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`, `enabled`) VALUES (4, 'bchatin3', 'mchardin3@google.ca', '$2a$10$nShOi5/f0bKNvHB8x0u3qOpeivazbuN0NE4TO0LGvQiTMafaBxLJS', 'user', '2023-08-04', '2024-08-04', 1);
INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`, `enabled`) VALUES (5, 'bmonteath4', 'kswapp4@smugmug.com', '$2a$10$nShOi5/f0bKNvHB8x0u3qOpeivazbuN0NE4TO0LGvQiTMafaBxLJS', 'user', '2023-08-04', '2024-08-04', 1);
INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`, `enabled`) VALUES (6, 'schadwick5', 'dbeech5@last.fm', '$2a$10$nShOi5/f0bKNvHB8x0u3qOpeivazbuN0NE4TO0LGvQiTMafaBxLJS', 'admin', '2023-08-04', '2024-08-04', 1);
INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`, `enabled`) VALUES (7, 'ekempshall6', 'abellee6@aol.com', '$2a$10$nShOi5/f0bKNvHB8x0u3qOpeivazbuN0NE4TO0LGvQiTMafaBxLJS', 'user', '2023-08-04', '2024-08-04', 1);
INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`, `enabled`) VALUES (8, 'dabbatt7', 'sbettenay7@barnesandnoble.com', '$2a$10$nShOi5/f0bKNvHB8x0u3qOpeivazbuN0NE4TO0LGvQiTMafaBxLJS', 'user', '2023-08-04', '2024-08-04', 1);
INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`, `enabled`) VALUES (9, 'gpelling8', 'cgiovanazzi8@naver.com', '$2a$10$nShOi5/f0bKNvHB8x0u3qOpeivazbuN0NE4TO0LGvQiTMafaBxLJS', 'user', '2023-08-04', '2024-08-04', 1);
INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`, `enabled`) VALUES (10, 'rdegrey9', 'zscraney9@yellowpages.com', '$2a$10$nShOi5/f0bKNvHB8x0u3qOpeivazbuN0NE4TO0LGvQiTMafaBxLJS', 'user', '2023-08-04', '2024-08-04', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `artwork`
-- -----------------------------------------------------
START TRANSACTION;
USE `artworlddb`;
INSERT INTO `artwork` (`id`, `title`, `artist`, `creation_year`, `description`, `image_url`, `created_at`, `updated_at`, `user_id`, `museum_id`) VALUES (1, 'Starry Night', 'Vincent Van Gogh', 2003, 'Distributed eco-centric pricing structure', 'https://upload.wikimedia.org/wikipedia/commons/c/cd/VanGogh-starry_night.jpg', '2023-08-04', '2024-08-04', 1, 3);
INSERT INTO `artwork` (`id`, `title`, `artist`, `creation_year`, `description`, `image_url`, `created_at`, `updated_at`, `user_id`, `museum_id`) VALUES (2, 'Polarised', 'Alla Abry', 2007, 'Networked fresh-thinking data-warehouse', 'https://upload.wikimedia.org/wikipedia/commons/0/0d/Great_Wave_off_Kanagawa2.jpg', '2023-08-04', '2024-08-04', 5, 6);
INSERT INTO `artwork` (`id`, `title`, `artist`, `creation_year`, `description`, `image_url`, `created_at`, `updated_at`, `user_id`, `museum_id`) VALUES (3, 'Re-engineered', 'Courtenay Caramuscia', 2010, 'Devolved exuding architecture', 'https://upload.wikimedia.org/wikipedia/commons/7/7e/Ernst_Ludwig_Kirchner_-_Czardas_dancers_-_Google_Art_Project.jpg', '2023-08-04', '2024-08-04', 6, 2);
INSERT INTO `artwork` (`id`, `title`, `artist`, `creation_year`, `description`, `image_url`, `created_at`, `updated_at`, `user_id`, `museum_id`) VALUES (4, 'Implemented', 'Kristina Pudsall', 2012, 'Inverse client-server utilisation', 'https://upload.wikimedia.org/wikipedia/commons/7/7b/Collage_Art_By_Artist_Vercmagnus_03.png', '2023-08-04', '2024-08-04', 5, 4);
INSERT INTO `artwork` (`id`, `title`, `artist`, `creation_year`, `description`, `image_url`, `created_at`, `updated_at`, `user_id`, `museum_id`) VALUES (5, 'Horizontal', 'Tandie Safont', 2007, 'Synergized contextually-based success', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Edvard_Munch_-_Madonna_-_Google_Art_Project.jpg/454px-Edvard_Munch_-_Madonna_-_Google_Art_Project.jpg?20150102221132', '2023-08-04', '2024-08-04', 6, 3);
INSERT INTO `artwork` (`id`, `title`, `artist`, `creation_year`, `description`, `image_url`, `created_at`, `updated_at`, `user_id`, `museum_id`) VALUES (6, 'projection', 'Lelah Livingston', 2008, 'User-friendly bottom-line projection', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Hans_Holbein_the_Younger_-_The_Ambassadors_-_Google_Art_Project.jpg/608px-Hans_Holbein_the_Younger_-_The_Ambassadors_-_Google_Art_Project.jpg?20121025035624', '2023-08-04', '2024-08-04', 7, 1);
INSERT INTO `artwork` (`id`, `title`, `artist`, `creation_year`, `description`, `image_url`, `created_at`, `updated_at`, `user_id`, `museum_id`) VALUES (7, 'Automated', 'Tiff Rees', 2012, 'Open-source neutral task-force', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/August_Macke_-_Three_girls_in_yellow_straw_hats_I_-_Google_Art_Project.jpg/424px-August_Macke_-_Three_girls_in_yellow_straw_hats_I_-_Google_Art_Project.jpg?20211118115536', '2023-08-04', '2024-08-04', 8, 7);
INSERT INTO `artwork` (`id`, `title`, `artist`, `creation_year`, `description`, `image_url`, `created_at`, `updated_at`, `user_id`, `museum_id`) VALUES (8, 'needs-based', 'Benyamin Tabourier', 1985, 'Ergonomic 24 hour capability', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Mary_Cassatt_-_The_Child%27s_Bath_-_Google_Art_Project.jpg/393px-Mary_Cassatt_-_The_Child%27s_Bath_-_Google_Art_Project.jpg?20121004212826', '2023-08-04', '2024-08-04', 9, 8);
INSERT INTO `artwork` (`id`, `title`, `artist`, `creation_year`, `description`, `image_url`, `created_at`, `updated_at`, `user_id`, `museum_id`) VALUES (9, '24 hour', 'Prissie Teek', 2003, 'Expanded 24/7 database', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Paul_C%C3%A9zanne%2C_French_-_The_Large_Bathers_-_Google_Art_Project.jpg/717px-Paul_C%C3%A9zanne%2C_French_-_The_Large_Bathers_-_Google_Art_Project.jpg?20121003124558', '2023-08-04', '2024-08-04', 4, 4);
INSERT INTO `artwork` (`id`, `title`, `artist`, `creation_year`, `description`, `image_url`, `created_at`, `updated_at`, `user_id`, `museum_id`) VALUES (10, 'asymmetric', 'Electra Bowhey', 2002, 'Open-architected fresh-thinking database', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Frida_Kahlo_by_Magda_Pach%2C_1933%2C_oil_on_canvas%2C_from_the_National_Portrait_Gallery_-_NPG-NPG_2015_136.jpg/481px-Frida_Kahlo_by_Magda_Pach%2C_1933%2C_oil_on_canvas%2C_from_the_National_Portrait_Gallery_-_NPG-NPG_2015_136.jpg?20211031114018', '2023-08-04', '2024-08-04', 4, 9);
INSERT INTO `artwork` (`id`, `title`, `artist`, `creation_year`, `description`, `image_url`, `created_at`, `updated_at`, `user_id`, `museum_id`) VALUES (11, 'Donut by the Sea', 'Noelani Isom', 2023, 'Struggles of diversity in Kreme', 'https://upload.wikimedia.org/wikipedia/commons/c/cb/Angelina_Probst_the_sexiest_gallery_Berlin_Germany_3.jpg?20080323200359', '2023-09-08', '2024-09-01', 5, 7);
INSERT INTO `artwork` (`id`, `title`, `artist`, `creation_year`, `description`, `image_url`, `created_at`, `updated_at`, `user_id`, `museum_id`) VALUES (12, 'Vertigo Strokes', 'Brenda Giesm', 2022, 'Art cycle evolution', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Pop_Art_Gil_Zetbase.jpg/800px-Pop_Art_Gil_Zetbase.jpg?20171209113134', '2023-05-09', '2024-06-03', 3, 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `artwork_review`
-- -----------------------------------------------------
START TRANSACTION;
USE `artworlddb`;
INSERT INTO `artwork_review` (`id`, `rating`, `comment`, `created_at`, `updated_at`, `artwork_id`, `user_id`) VALUES (1, 5, 'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', '2023-05-07', '2024-05-07', 1, 1);
INSERT INTO `artwork_review` (`id`, `rating`, `comment`, `created_at`, `updated_at`, `artwork_id`, `user_id`) VALUES (2, 5, 'Mauris sit amet eros.', '2023-05-07', '2024-05-07', 4, 4);
INSERT INTO `artwork_review` (`id`, `rating`, `comment`, `created_at`, `updated_at`, `artwork_id`, `user_id`) VALUES (3, 4, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.', '2023-05-07', '2024-05-07', 7, 3);
INSERT INTO `artwork_review` (`id`, `rating`, `comment`, `created_at`, `updated_at`, `artwork_id`, `user_id`) VALUES (4, 2, 'Nulla nisl. Nunc nisl.', '2023-05-07', '2024-05-07', 2, 6);
INSERT INTO `artwork_review` (`id`, `rating`, `comment`, `created_at`, `updated_at`, `artwork_id`, `user_id`) VALUES (5, 3, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', '2023-05-07', '2024-05-07', 4, 3);
INSERT INTO `artwork_review` (`id`, `rating`, `comment`, `created_at`, `updated_at`, `artwork_id`, `user_id`) VALUES (6, 3, 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', '2023-05-07', '2024-05-07', 5, 9);
INSERT INTO `artwork_review` (`id`, `rating`, `comment`, `created_at`, `updated_at`, `artwork_id`, `user_id`) VALUES (7, 2, 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', '2023-05-07', '2024-05-07', 3, 6);
INSERT INTO `artwork_review` (`id`, `rating`, `comment`, `created_at`, `updated_at`, `artwork_id`, `user_id`) VALUES (8, 4, 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', '2023-05-07', '2024-05-07', 6, 3);
INSERT INTO `artwork_review` (`id`, `rating`, `comment`, `created_at`, `updated_at`, `artwork_id`, `user_id`) VALUES (9, 3, 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus.', '2023-05-07', '2024-05-07', 7, 2);
INSERT INTO `artwork_review` (`id`, `rating`, `comment`, `created_at`, `updated_at`, `artwork_id`, `user_id`) VALUES (10, 3, 'Aliquam erat volutpat. In congue.', '2023-05-07', '2024-05-07', 1, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `favorite_artwork`
-- -----------------------------------------------------
START TRANSACTION;
USE `artworlddb`;
INSERT INTO `favorite_artwork` (`user_id`, `artwork_id`) VALUES (2, 4);
INSERT INTO `favorite_artwork` (`user_id`, `artwork_id`) VALUES (1, 6);
INSERT INTO `favorite_artwork` (`user_id`, `artwork_id`) VALUES (7, 5);
INSERT INTO `favorite_artwork` (`user_id`, `artwork_id`) VALUES (3, 9);
INSERT INTO `favorite_artwork` (`user_id`, `artwork_id`) VALUES (3, 7);
INSERT INTO `favorite_artwork` (`user_id`, `artwork_id`) VALUES (3, 3);
INSERT INTO `favorite_artwork` (`user_id`, `artwork_id`) VALUES (1, 7);

COMMIT;


-- -----------------------------------------------------
-- Data for table `favorite_exhibitions`
-- -----------------------------------------------------
START TRANSACTION;
USE `artworlddb`;
INSERT INTO `favorite_exhibitions` (`user_id`, `exhibition_id`) VALUES (8, 6);
INSERT INTO `favorite_exhibitions` (`user_id`, `exhibition_id`) VALUES (3, 4);
INSERT INTO `favorite_exhibitions` (`user_id`, `exhibition_id`) VALUES (1, 5);
INSERT INTO `favorite_exhibitions` (`user_id`, `exhibition_id`) VALUES (7, 1);
INSERT INTO `favorite_exhibitions` (`user_id`, `exhibition_id`) VALUES (7, 7);
INSERT INTO `favorite_exhibitions` (`user_id`, `exhibition_id`) VALUES (2, 8);
INSERT INTO `favorite_exhibitions` (`user_id`, `exhibition_id`) VALUES (9, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `exhibition_has_artwork`
-- -----------------------------------------------------
START TRANSACTION;
USE `artworlddb`;
INSERT INTO `exhibition_has_artwork` (`artwork_id`, `exhibition_id`) VALUES (1, 3);
INSERT INTO `exhibition_has_artwork` (`artwork_id`, `exhibition_id`) VALUES (2, 4);
INSERT INTO `exhibition_has_artwork` (`artwork_id`, `exhibition_id`) VALUES (3, 5);
INSERT INTO `exhibition_has_artwork` (`artwork_id`, `exhibition_id`) VALUES (4, 6);
INSERT INTO `exhibition_has_artwork` (`artwork_id`, `exhibition_id`) VALUES (7, 4);
INSERT INTO `exhibition_has_artwork` (`artwork_id`, `exhibition_id`) VALUES (6, 8);

COMMIT;


-- -----------------------------------------------------
-- Data for table `exhibition_review`
-- -----------------------------------------------------
START TRANSACTION;
USE `artworlddb`;
INSERT INTO `exhibition_review` (`id`, `rating`, `comment`, `created_at`, `updated_at`, `exhibition_id`, `user_id`) VALUES (1, 5, NULL, DEFAULT, DEFAULT, 1, 1);

COMMIT;

