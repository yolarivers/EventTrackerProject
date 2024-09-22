-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema artworlddb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS artworlddb ;
CREATE SCHEMA IF NOT EXISTS artworlddb ;
USE artworlddb ;

-- -----------------------------------------------------
-- Table user
-- -----------------------------------------------------
DROP TABLE IF EXISTS user ;

CREATE TABLE IF NOT EXISTS user (
  id INT NOT NULL AUTO_INCREMENT,
  username VARCHAR(100) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  role VARCHAR(50) NULL DEFAULT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Table museum
-- -----------------------------------------------------
DROP TABLE IF EXISTS museum ;

CREATE TABLE IF NOT EXISTS museum (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  location VARCHAR(255) NULL DEFAULT NULL,
  description TEXT NULL DEFAULT NULL,
  website_url VARCHAR(255) NULL DEFAULT NULL,
  image VARCHAR(255) NULL DEFAULT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Table exhibition
-- -----------------------------------------------------
DROP TABLE IF EXISTS exhibition ;

CREATE TABLE IF NOT EXISTS exhibition (
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  museum_id INT NOT NULL,
  description TEXT NULL DEFAULT NULL,
  start_date DATE NULL DEFAULT NULL,
  end_date DATE NULL DEFAULT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  INDEX (museum_id ASC),
  CONSTRAINT fk_exhibition_museum
    FOREIGN KEY (museum_id)  -- Specify foreign key column in exhibition table
    REFERENCES museum (id)  -- Reference the primary key of museum table
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table artwork
-- -----------------------------------------------------
DROP TABLE IF EXISTS artwork ;

CREATE TABLE IF NOT EXISTS artwork (
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  artist VARCHAR(255) NULL DEFAULT NULL,
  exhibition_id INT NOT NULL,
  museum_id INT NOT NULL,
  creation_year INT NULL DEFAULT NULL,
  description TEXT NULL DEFAULT NULL,
  image VARCHAR(255) NULL DEFAULT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  CONSTRAINT fk_artwork_exhibition
    FOREIGN KEY (exhibition_id)  -- Specify foreign key column in artwork table
    REFERENCES exhibition (id)  -- Reference the primary key of exhibition table
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_artwork_museum
    FOREIGN KEY (museum_id)  -- Specify foreign key column in artwork table
    REFERENCES museum (id)  -- Reference the primary key of museum table
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table review
-- -----------------------------------------------------
DROP TABLE IF EXISTS review ;

CREATE TABLE IF NOT EXISTS review (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  exhibition_id INT NOT NULL,
  artwork_id INT NOT NULL,
  rating INT NULL DEFAULT NULL,
  comment TEXT NULL DEFAULT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  INDEX (user_id ASC),
  INDEX (exhibition_id ASC),
  INDEX (artwork_id ASC),
  CONSTRAINT fk_review_user
    FOREIGN KEY (user_id)  -- Specify foreign key column in review table
    REFERENCES user (id)  -- Reference the primary key of user table
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_review_exhibition
    FOREIGN KEY (exhibition_id)  -- Specify foreign key column in review table
    REFERENCES exhibition (id)  -- Reference the primary key of exhibition table
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_review_artwork
    FOREIGN KEY (artwork_id)  -- Specify foreign key column in review table
    REFERENCES artwork (id)  -- Reference the primary key of artwork table
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table favorite
-- -----------------------------------------------------
DROP TABLE IF EXISTS favorite ;

CREATE TABLE IF NOT EXISTS favorite (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  exhibition_id INT NOT NULL,
  artwork_id INT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  INDEX (user_id ASC),
  INDEX (exhibition_id ASC),
  INDEX (artwork_id ASC),
  CONSTRAINT fk_favorite_user
    FOREIGN KEY (user_id)  -- Specify foreign key column in favorite table
    REFERENCES user (id)  -- Reference the primary key of user table
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_favorite_exhibition
    FOREIGN KEY (exhibition_id)  -- Specify foreign key column in favorite table
    REFERENCES exhibition (id)  -- Reference the primary key of exhibition table
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_favorite_artwork
    FOREIGN KEY (artwork_id)  -- Specify foreign key column in favorite table
    REFERENCES artwork (id)  -- Reference the primary key of artwork table
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- Resetting SQL modes and checks
SET SQL_MODE = '';
DROP USER IF EXISTS curator;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'curator' IDENTIFIED BY 'curator';

GRANT ALL ON * TO 'curator';
GRANT ALL ON TABLE artworlddb.artwork TO 'curator';
GRANT SELECT, INSERT, TRIGGER ON TABLE * TO 'curator';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'curator';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `artworlddb`;
INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES (1, 'gbetterton0', 'plestrange0@mapy.cz', 'gY9>?#o<Zn', 'Media Manager II', '1-22-2024', '5-4-2024');
INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES (2, 'flavery1', 'ogottschalk1@reverbnation.com', 'gF9\\l$1z%\"w.+', 'Librarian', '10-15-2023', '1-28-2024');
INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES (3, 'rmyring2', 'zklimek2@abc.net.au', 'eB6&%%+@pxSaWc', 'Physical Therapy Assistant', '7-9-2024', '5-15-2024');
INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES (4, 'bchatin3', 'mchardin3@google.ca', 'oK6#Jtxt7Hd', 'Assistant Media Planner', '1-26-2024', '7-18-2024');
INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES (5, 'bmonteath4', 'kswapp4@smugmug.com', 'nK2\'+b0Lj0/b', 'Quality Control Specialist', '10-3-2023', '11-22-2023');
INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES (6, 'schadwick5', 'dbeech5@last.fm', 'kZ8|03+LuCHEcXX\"', 'Staff Accountant IV', '3-1-2024', '2-26-2024');
INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES (7, 'ekempshall6', 'abellee6@aol.com', 'tT2,7KpUOG,\"!w', 'Automation Specialist IV', '8-22-2024', '6-23-2024');
INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES (8, 'dabbatt7', 'sbettenay7@barnesandnoble.com', 'mG8.~@Ac\"ejvcw=N', 'Civil Engineer', '3-15-2024', '11-16-2023');
INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES (9, 'gpelling8', 'cgiovanazzi8@naver.com', 'nR2{NxSE*', 'Project Manager', '5-9-2024', '5-26-2024');
INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES (10, 'rdegrey9', 'zscraney9@yellowpages.com', 'xG5=o\'JTQL', 'Data Coordinator', '5-15-2024', '7-18-2024');

COMMIT;


-- -----------------------------------------------------
-- Data for table `museum`
-- -----------------------------------------------------
START TRANSACTION;
USE `artworlddb`;
INSERT INTO `museum` (`id`, `name`, `location`, `description`, `website_url`, `image`, `created_at`, `updated_at`) VALUES (1, 'Waters-Effertz', '57 Portage Alley', 'Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 'https://google.es/ultrices/aliquet/maecenas/leo/odio.xml?montes=pellentesque&nascetur=at&ridiculus=nulla&mus=suspendisse&etiam=potenti&vel=cras&augue=in&vestibulum=purus&rutrum=eu&rutrum=magna&neque=vulputate&aenean=luctus&auctor=cum&gravida=sociis&sem=natoque&praesent=penatibus&id=et&massa=magnis&id=dis&nisl=parturient&venenatis=montes&lacinia=nascetur&aenean=ridiculus&sit=mus&amet=vivamus&justo=vestibulum&morbi=sagittis&ut=sapien', 'http://dummyimage.com/118x100.png/ff4444/ffffff', '5-5-2024', '10-10-2023');
INSERT INTO `museum` (`id`, `name`, `location`, `description`, `website_url`, `image`, `created_at`, `updated_at`) VALUES (2, 'Collins-Bode', '15349 Waywood Circle', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', 'http://dummyimage.com/171x100.png/5fa2dd/ffffff', 'http://dummyimage.com/115x100.png/ff4444/ffffff', '10-4-2023', '7-17-2024');
INSERT INTO `museum` (`id`, `name`, `location`, `description`, `website_url`, `image`, `created_at`, `updated_at`) VALUES (3, 'Gleichner-Braun', '62 Thierer Way', 'Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti.', 'https://nature.com/pulvinar/nulla/pede/ullamcorper/augue/a/suscipit.html?aliquam=sed&lacus=justo&morbi=pellentesque&quis=viverra&tortor=pede&id=ac&nulla=diam&ultrices=cras&aliquet=pellentesque&maecenas=volutpat&leo=dui&odio=maecenas&condimentum=tristique&id=est&luctus=et&nec=tempus&molestie=semper&sed=est&justo=quam&pellentesque=pharetra&viverra=magna&pede=ac&ac=consequat&diam=metus&cras=sapien&pellentesque=ut&volutpat=nunc&dui=vestibulum&maecenas=ante&tristique=ipsum&est=primis&et=in&tempus=faucibus&semper=orci&est=luctus&quam=et&pharetra=ultrices&magna=posuere&ac=cubilia&consequat=curae&metus=mauris&sapien=viverra&ut=diam&nunc=vitae&vestibulum=quam&ante=suspendisse&ipsum=potenti&primis=nullam&in=porttitor&faucibus=lacus&orci=at&luctus=turpis&et=donec&ultrices=posuere&posuere=metus&cubilia=vitae&curae=ipsum&mauris=aliquam&viverra=non&diam=mauris&vitae=morbi&quam=non&suspendisse=lectus&potenti=aliquam&nullam=sit&porttitor=amet&lacus=diam&at=in&turpis=magna&donec=bibendum&posuere=imperdiet&metus=nullam&vitae=orci&ipsum=pede&aliquam=venenatis&non=non&mauris=sodales&morbi=sed&non=tincidunt&lectus=eu&aliquam=felis&sit=fusce&amet=posuere&diam=felis&in=sed&magna=lacus&bibendum=morbi&imperdiet=sem&nullam=mauris&orci=laoreet&pede=ut&venenatis=rhoncus&non=aliquet', 'http://dummyimage.com/115x100.png/5fa2dd/ffffff', '8-7-2024', '3-14-2024');
INSERT INTO `museum` (`id`, `name`, `location`, `description`, `website_url`, `image`, `created_at`, `updated_at`) VALUES (4, 'Fritsch-Schaefer', '746 Starling Street', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', 'http://google.co.jp/lorem/id/ligula.jsp?turpis=libero&nec=ut&euismod=massa&scelerisque=volutpat&quam=convallis&turpis=morbi&adipiscing=odio&lorem=odio&vitae=elementum&mattis=eu&nibh=interdum&ligula=eu&nec=tincidunt&sem=in&duis=leo&aliquam=maecenas&convallis=pulvinar', 'http://dummyimage.com/162x100.png/cc0000/ffffff', '11-12-2023', '8-28-2024');
INSERT INTO `museum` (`id`, `name`, `location`, `description`, `website_url`, `image`, `created_at`, `updated_at`) VALUES (5, 'Beer-Hayes', '6 Straubel Center', 'Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 'https://arizona.edu/pulvinar/nulla/pede/ullamcorper.jsp?donec=faucibus&dapibus=orci&duis=luctus&at=et&velit=ultrices&eu=posuere&est=cubilia&congue=curae&elementum=nulla&in=dapibus&hac=dolor&habitasse=vel&platea=est&dictumst=donec&morbi=odio&vestibulum=justo&velit=sollicitudin&id=ut&pretium=suscipit&iaculis=a&diam=feugiat&erat=et&fermentum=eros&justo=vestibulum&nec=ac&condimentum=est&neque=lacinia&sapien=nisi&placerat=venenatis&ante=tristique&nulla=fusce&justo=congue&aliquam=diam&quis=id&turpis=ornare&eget=imperdiet&elit=sapien&sodales=urna&scelerisque=pretium&mauris=nisl&sit=ut&amet=volutpat&eros=sapien&suspendisse=arcu&accumsan=sed&tortor=augue&quis=aliquam&turpis=erat&sed=volutpat&ante=in&vivamus=congue&tortor=etiam&duis=justo&mattis=etiam&egestas=pretium&metus=iaculis&aenean=justo&fermentum=in&donec=hac&ut=habitasse&mauris=platea&eget=dictumst&massa=etiam&tempor=faucibus&convallis=cursus&nulla=urna&neque=ut&libero=tellus&convallis=nulla&eget=ut&eleifend=erat&luctus=id&ultricies=mauris&eu=vulputate&nibh=elementum', 'http://dummyimage.com/124x100.png/5fa2dd/ffffff', '9-7-2024', '2-5-2024');
INSERT INTO `museum` (`id`, `name`, `location`, `description`, `website_url`, `image`, `created_at`, `updated_at`) VALUES (6, 'Monahan Group', '85 Springs Drive', 'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 'http://godaddy.com/porttitor/pede/justo.xml?non=feugiat&sodales=et&sed=eros&tincidunt=vestibulum&eu=ac&felis=est&fusce=lacinia&posuere=nisi&felis=venenatis&sed=tristique&lacus=fusce&morbi=congue', 'http://dummyimage.com/197x100.png/dddddd/000000', '7-8-2024', '9-26-2023');
INSERT INTO `museum` (`id`, `name`, `location`, `description`, `website_url`, `image`, `created_at`, `updated_at`) VALUES (7, 'Braun and Sons', '7237 Debra Place', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.', 'http://sphinn.com/quis/orci/eget/orci/vehicula.xml?ipsum=nascetur&primis=ridiculus&in=mus&faucibus=vivamus&orci=vestibulum&luctus=sagittis&et=sapien&ultrices=cum&posuere=sociis&cubilia=natoque&curae=penatibus&mauris=et&viverra=magnis&diam=dis&vitae=parturient&quam=montes&suspendisse=nascetur&potenti=ridiculus&nullam=mus&porttitor=etiam&lacus=vel&at=augue&turpis=vestibulum&donec=rutrum&posuere=rutrum&metus=neque&vitae=aenean&ipsum=auctor&aliquam=gravida&non=sem&mauris=praesent&morbi=id&non=massa&lectus=id&aliquam=nisl&sit=venenatis&amet=lacinia&diam=aenean&in=sit&magna=amet&bibendum=justo&imperdiet=morbi&nullam=ut&orci=odio&pede=cras&venenatis=mi&non=pede&sodales=malesuada&sed=in&tincidunt=imperdiet&eu=et&felis=commodo&fusce=vulputate&posuere=justo&felis=in&sed=blandit&lacus=ultrices&morbi=enim&sem=lorem&mauris=ipsum&laoreet=dolor&ut=sit&rhoncus=amet&aliquet=consectetuer&pulvinar=adipiscing&sed=elit&nisl=proin&nunc=interdum&rhoncus=mauris&dui=non&vel=ligula&sem=pellentesque&sed=ultrices', 'http://dummyimage.com/242x100.png/cc0000/ffffff', '5-22-2024', '4-20-2024');
INSERT INTO `museum` (`id`, `name`, `location`, `description`, `website_url`, `image`, `created_at`, `updated_at`) VALUES (8, 'Green Group', '01 Raven Street', 'Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.', 'https://etsy.com/turpis/integer.js?ultricies=pede&eu=venenatis&nibh=non&quisque=sodales&id=sed&justo=tincidunt&sit=eu&amet=felis&sapien=fusce&dignissim=posuere&vestibulum=felis&vestibulum=sed&ante=lacus&ipsum=morbi&primis=sem', 'http://dummyimage.com/202x100.png/cc0000/ffffff', '3-11-2024', '4-22-2024');
INSERT INTO `museum` (`id`, `name`, `location`, `description`, `website_url`, `image`, `created_at`, `updated_at`) VALUES (9, 'Considine-Bednar', '1 Barnett Road', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.', 'http://github.io/interdum/mauris.aspx?et=cubilia&magnis=curae&dis=mauris&parturient=viverra&montes=diam&nascetur=vitae&ridiculus=quam&mus=suspendisse&etiam=potenti&vel=nullam&augue=porttitor&vestibulum=lacus&rutrum=at&rutrum=turpis&neque=donec&aenean=posuere&auctor=metus&gravida=vitae&sem=ipsum&praesent=aliquam&id=non&massa=mauris&id=morbi&nisl=non&venenatis=lectus&lacinia=aliquam&aenean=sit&sit=amet&amet=diam&justo=in&morbi=magna&ut=bibendum&odio=imperdiet&cras=nullam&mi=orci&pede=pede&malesuada=venenatis&in=non&imperdiet=sodales&et=sed&commodo=tincidunt&vulputate=eu&justo=felis&in=fusce&blandit=posuere&ultrices=felis&enim=sed&lorem=lacus', 'http://dummyimage.com/196x100.png/cc0000/ffffff', '12-6-2023', '5-19-2024');
INSERT INTO `museum` (`id`, `name`, `location`, `description`, `website_url`, `image`, `created_at`, `updated_at`) VALUES (10, 'Franecki, Toy and Prohaska', '2 Sundown Terrace', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'http://slate.com/varius/nulla/facilisi/cras/non.jpg?massa=massa&tempor=id&convallis=lobortis&nulla=convallis&neque=tortor&libero=risus&convallis=dapibus&eget=augue&eleifend=vel&luctus=accumsan&ultricies=tellus&eu=nisi&nibh=eu&quisque=orci&id=mauris&justo=lacinia&sit=sapien&amet=quis&sapien=libero&dignissim=nullam&vestibulum=sit&vestibulum=amet&ante=turpis&ipsum=elementum&primis=ligula&in=vehicula&faucibus=consequat&orci=morbi&luctus=a&et=ipsum&ultrices=integer&posuere=a&cubilia=nibh&curae=in&nulla=quis&dapibus=justo&dolor=maecenas&vel=rhoncus&est=aliquam&donec=lacus&odio=morbi&justo=quis&sollicitudin=tortor&ut=id&suscipit=nulla&a=ultrices&feugiat=aliquet&et=maecenas&eros=leo&vestibulum=odio&ac=condimentum&est=id&lacinia=luctus&nisi=nec&venenatis=molestie&tristique=sed&fusce=justo&congue=pellentesque&diam=viverra&id=pede&ornare=ac&imperdiet=diam&sapien=cras&urna=pellentesque&pretium=volutpat&nisl=dui&ut=maecenas&volutpat=tristique&sapien=est&arcu=et&sed=tempus&augue=semper&aliquam=est&erat=quam&volutpat=pharetra&in=magna&congue=ac&etiam=consequat&justo=metus&etiam=sapien&pretium=ut', 'http://dummyimage.com/178x100.png/ff4444/ffffff', '9-15-2024', '11-13-2023');

COMMIT;


-- -----------------------------------------------------
-- Data for table `exhibition`
-- -----------------------------------------------------
START TRANSACTION;
USE `artworlddb`;
INSERT INTO `exhibition` (`id`, `title`, `museum_id`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES (1, 'installationEXPO', 4524, 'accumsan odio', '1-16-2024', '4-15-2024', '6-27-2023', ' 5-19-2024');
INSERT INTO `exhibition` (`id`, `title`, `museum_id`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES (2, 'function', 4975, 'aliquam sit amet diam in', '1-16-2024', '4-15-2024', '6-27-2023', '5-19-2024');
INSERT INTO `exhibition` (`id`, `title`, `museum_id`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES (3, 'Switchable', 3794, 'non mauris', '1-16-2024', '4-15-2024', '6-27-2023', '5-19-2024');
INSERT INTO `exhibition` (`id`, `title`, `museum_id`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES (4, 'project', 3228, 'magna ac', '1-16-2024', '4-15-2024', '6-27-2023', '5-19-2024');
INSERT INTO `exhibition` (`id`, `title`, `museum_id`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES (5, 'client-server', 3214, 'et tempus semper', '1-16-2024', '4-15-2024', '6-27-2023', '5-19-2024');
INSERT INTO `exhibition` (`id`, `title`, `museum_id`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES (6, 'clear-thinking', 3103, 'et commodo vulputate', '1-16-2024', '4-15-2024', '6-27-2023', '5-19-2024');
INSERT INTO `exhibition` (`id`, `title`, `museum_id`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES (7, 'Stand-alone', 3464, 'massa id', '1-16-2024', '4-15-2024', '6-27-2023', '5-19-2024');
INSERT INTO `exhibition` (`id`, `title`, `museum_id`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES (8, 'Organic', 3247, 'ut ultrices', '1-16-2024', '4-15-2024', '6-27-2023', '5-19-2024');
INSERT INTO `exhibition` (`id`, `title`, `museum_id`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES (9, 'Devolved', 3380, 'pulvinar nulla pede ullamcorper augue', '1-16-2024', '4-15-2024', '6-27-2023', '5-19-2024');
INSERT INTO `exhibition` (`id`, `title`, `museum_id`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES (10, 'Shocker X', 3252, 'piws neo wqpq poeq', '1-16-2024', '4-15-2024', '6-27-2023', '5-19-2024');

COMMIT;


-- -----------------------------------------------------
-- Data for table `artwork`
-- -----------------------------------------------------
START TRANSACTION;
USE `artworlddb`;
INSERT INTO `artwork` (`id`, `title`, `artist`, `exhibition_id`, `museum_id`, `creation_year`, `description`, `image`, `created_at`, `updated_at`) VALUES (1, 'intranet', 'Riobard Ivins', 4974, 5119, 2003, 'Distributed eco-centric pricing structure', 'http://dummyimage.com/171x100.png/5fa2dd/ffffff', '1-15-2024', ' 6-12-2024');
INSERT INTO `artwork` (`id`, `title`, `artist`, `exhibition_id`, `museum_id`, `creation_year`, `description`, `image`, `created_at`, `updated_at`) VALUES (2, 'Polarised', 'Alla Abry', 4483, 2439, 2007, 'Networked fresh-thinking data-warehouse', 'http://dummyimage.com/170x100.png/cc0000/ffffff', '1-15-2024', '6-12-2024');
INSERT INTO `artwork` (`id`, `title`, `artist`, `exhibition_id`, `museum_id`, `creation_year`, `description`, `image`, `created_at`, `updated_at`) VALUES (3, 'Re-engineered', 'Courtenay Caramuscia', 3777, 7608, 2010, 'Devolved exuding architecture', 'http://dummyimage.com/190x100.png/dddddd/000000', '1-15-2024', '6-12-2024');
INSERT INTO `artwork` (`id`, `title`, `artist`, `exhibition_id`, `museum_id`, `creation_year`, `description`, `image`, `created_at`, `updated_at`) VALUES (4, 'Implemented', 'Kristina Pudsall', 4774, 5110, 2012, 'Inverse client-server utilisation', 'http://dummyimage.com/182x100.png/dddddd/000000', '1-15-2024', '6-12-2024');
INSERT INTO `artwork` (`id`, `title`, `artist`, `exhibition_id`, `museum_id`, `creation_year`, `description`, `image`, `created_at`, `updated_at`) VALUES (5, 'Horizontal', 'Tandie Safont', 4410, 7541, 2007, 'Synergized contextually-based success', 'http://dummyimage.com/115x100.png/5fa2dd/ffffff', '1-15-2024', '6-12-2024');
INSERT INTO `artwork` (`id`, `title`, `artist`, `exhibition_id`, `museum_id`, `creation_year`, `description`, `image`, `created_at`, `updated_at`) VALUES (6, 'projection', 'Lelah Livingston', 4379, 7407, 2008, 'User-friendly bottom-line projection', 'http://dummyimage.com/234x100.png/dddddd/000000', '1-15-2024', '6-12-2024');
INSERT INTO `artwork` (`id`, `title`, `artist`, `exhibition_id`, `museum_id`, `creation_year`, `description`, `image`, `created_at`, `updated_at`) VALUES (7, 'Automated', 'Tiff Rees', 3076, 3121, 2012, 'Open-source neutral task-force', 'http://dummyimage.com/180x100.png/5fa2dd/ffffff', '1-15-2024', '6-12-2024');
INSERT INTO `artwork` (`id`, `title`, `artist`, `exhibition_id`, `museum_id`, `creation_year`, `description`, `image`, `created_at`, `updated_at`) VALUES (8, 'needs-based', 'Benyamin Tabourier', 4714, 4794, 1985, 'Ergonomic 24 hour capability', 'http://dummyimage.com/188x100.png/ff4444/ffffff', '1-15-2024', '6-12-2024');
INSERT INTO `artwork` (`id`, `title`, `artist`, `exhibition_id`, `museum_id`, `creation_year`, `description`, `image`, `created_at`, `updated_at`) VALUES (9, '24 hour', 'Prissie Teek', 4527, 6137, 2003, 'Expanded 24/7 database', 'http://dummyimage.com/207x100.png/5fa2dd/ffffff', '1-15-2024', '6-12-2024');
INSERT INTO `artwork` (`id`, `title`, `artist`, `exhibition_id`, `museum_id`, `creation_year`, `description`, `image`, `created_at`, `updated_at`) VALUES (10, 'asymmetric', 'Electra Bowhey', 3248, 688, 2002, 'Open-architected fresh-thinking database', 'http://dummyimage.com/205x100.png/ff4444/ffffff', '1-15-2024', '6-12-2024');

COMMIT;


-- -----------------------------------------------------
-- Data for table `review`
-- -----------------------------------------------------
START TRANSACTION;
USE `artworlddb`;
INSERT INTO `review` (`id`, `user_id`, `exhibition_id`, `artwork_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES (1, 1678, 3710, 4408, 2, 'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', '5-19-2024', '6-27-2024');
INSERT INTO `review` (`id`, `user_id`, `exhibition_id`, `artwork_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES (2, 837, 4403, 4011, 3, 'Mauris sit amet eros.', '5-19-2024', '6-27-2024');
INSERT INTO `review` (`id`, `user_id`, `exhibition_id`, `artwork_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES (3, 1731, 4315, 4650, 4, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.', '5-19-2024', '6-27-2024');
INSERT INTO `review` (`id`, `user_id`, `exhibition_id`, `artwork_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES (4, 1966, 3594, 3911, 2, 'Nulla nisl. Nunc nisl.', '5-19-2024', '6-27-2024');
INSERT INTO `review` (`id`, `user_id`, `exhibition_id`, `artwork_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES (5, 1373, 3572, 4010, 3, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', '5-19-2024', '6-27-2024');
INSERT INTO `review` (`id`, `user_id`, `exhibition_id`, `artwork_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES (6, 577, 4402, 4480, 3, 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', '5-19-2024', '6-27-2024');
INSERT INTO `review` (`id`, `user_id`, `exhibition_id`, `artwork_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES (7, 1601, 4145, 4610, 2, 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', '5-19-2024', '6-27-2024');
INSERT INTO `review` (`id`, `user_id`, `exhibition_id`, `artwork_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES (8, 548, 4496, 4956, 4, 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', '5-19-2024', '6-27-2024');
INSERT INTO `review` (`id`, `user_id`, `exhibition_id`, `artwork_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES (9, 1360, 3547, 4692, 3, 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus.', '5-19-2024', '6-27-2024');
INSERT INTO `review` (`id`, `user_id`, `exhibition_id`, `artwork_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES (10, 1255, 3848, 4059, 3, 'Aliquam erat volutpat. In congue.', '5-19-2024', '6-27-2024');

COMMIT;


-- -----------------------------------------------------
-- Data for table `favorite`
-- -----------------------------------------------------
START TRANSACTION;
USE `artworlddb`;
INSERT INTO `favorite` (`id`, `user_id`, `exhibition_id`, `artwork_id`, `created_at`) VALUES (1, 3109, 1385, 8003, '2-17-2024');
INSERT INTO `favorite` (`id`, `user_id`, `exhibition_id`, `artwork_id`, `created_at`) VALUES (2, 4463, 1671, 3755, '2-17-2024');
INSERT INTO `favorite` (`id`, `user_id`, `exhibition_id`, `artwork_id`, `created_at`) VALUES (3, 1543, 1447, 8077, '2-17-2024');
INSERT INTO `favorite` (`id`, `user_id`, `exhibition_id`, `artwork_id`, `created_at`) VALUES (4, 4124, 1116, 8525, '2-17-2024');
INSERT INTO `favorite` (`id`, `user_id`, `exhibition_id`, `artwork_id`, `created_at`) VALUES (5, 595, 1249, 5361, '2-17-2024');
INSERT INTO `favorite` (`id`, `user_id`, `exhibition_id`, `artwork_id`, `created_at`) VALUES (6, 331, 1917, 936, '2-17-2024');
INSERT INTO `favorite` (`id`, `user_id`, `exhibition_id`, `artwork_id`, `created_at`) VALUES (7, 4125, 1584, 6016, '2-17-2024');
INSERT INTO `favorite` (`id`, `user_id`, `exhibition_id`, `artwork_id`, `created_at`) VALUES (8, 1516, 1524, 5411, '2-17-2024');
INSERT INTO `favorite` (`id`, `user_id`, `exhibition_id`, `artwork_id`, `created_at`) VALUES (9, 2939, 1512, 6000, '2-17-2024');
INSERT INTO `favorite` (`id`, `user_id`, `exhibition_id`, `artwork_id`, `created_at`) VALUES (10, 2005, 1808, 6947, '2-17-2024');

COMMIT;

