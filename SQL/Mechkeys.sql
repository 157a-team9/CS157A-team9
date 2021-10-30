CREATE TABLE `157a_team9`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(50) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password_hash` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE);
  
  CREATE TABLE `157a_team9`.`address` (
  `address_id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(45) NOT NULL,
  `address2` VARCHAR(45) NULL,
  `city_name` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `zipcode` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`address_id`),
  UNIQUE INDEX `idaddress_id_UNIQUE` (`address_id` ASC) VISIBLE);
  
  CREATE TABLE `157a_team9`.`listing` (
  `listing_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(256) NOT NULL,
  `price` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`listing_id`),
  UNIQUE INDEX `listing_id_UNIQUE` (`listing_id` ASC) VISIBLE);

CREATE TABLE `157a_team9`.`brand` (
  `brand_id` INT NOT NULL AUTO_INCREMENT,
  `brand_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`brand_id`),
  UNIQUE INDEX `brand_id_UNIQUE` (`brand_id` ASC) VISIBLE);

CREATE TABLE `157a_team9`.`category` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`category_id`));
  
CREATE TABLE `157a_team9`.`saves` (
  `user_id` INT NOT NULL,
  `listing_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `listing_id`),
  INDEX `fk_saved_listing_id_idx` (`listing_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `157a_team9`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_saved_listing_id`
    FOREIGN KEY (`listing_id`)
    REFERENCES `157a_team9`.`listing` (`listing_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `157a_team9`.`seller` (
  `user_id` INT NOT NULL,
  `validated` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_sellers_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `157a_team9`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `157a_team9`.`sells` (
  `user_id` INT NOT NULL,
  `listing_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `listing_id`),
  INDEX `fk_listing_id_idx` (`listing_id` ASC) VISIBLE,
  CONSTRAINT `fk_seller_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `157a_team9`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_listing_id`
    FOREIGN KEY (`listing_id`)
    REFERENCES `157a_team9`.`listing` (`listing_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);

CREATE TABLE `157a_team9`.`has_category` (
  `category_id` INT NOT NULL,
  `listing_id` INT NOT NULL,
  PRIMARY KEY (`category_id`, `listing_id`));

CREATE TABLE `157a_team9`.`has_brand` (
  `brand_id` INT NOT NULL,
  `listing_id` INT NOT NULL,
  PRIMARY KEY (`brand_id`, `listing_id`),
  INDEX `fk_brand_listing_id_idx` (`listing_id` ASC) VISIBLE,
  CONSTRAINT `fk_brand_brand_id`
    FOREIGN KEY (`brand_id`)
    REFERENCES `157a_team9`.`brand` (`brand_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_brand_listing_id`
    FOREIGN KEY (`listing_id`)
    REFERENCES `157a_team9`.`listing` (`listing_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);
    
INSERT INTO `157a_team9`.`user` (`email`, `username`, `password_hash`) VALUES ('sjkchang@gmail.com', 'sjkchang', '$2b$10$5MmB65AVlOouAQw800hj9.KMCM0dfThwLKujH1vxeXRCE2vbyA6T.');
INSERT INTO `157a_team9`.`user` (`email`, `username`, `password_hash`) VALUES ('testemail@gmail.com', 'testing', '$2b$10$5MmB65AVlOouAQw800hj9.KMCM0dfThwLKujH1vxeXRCE2vbyA6T.');
INSERT INTO `157a_team9`.`user` (`email`, `username`, `password_hash`) VALUES ('ssearek@gmail.com', 'ssearek', '$2b$10$5MmB65AVlOouAQw800hj9.KMCM0dfThwLKujH1vxeXRCE2vbyA6T.');
INSERT INTO `157a_team9`.`user` (`email`, `username`, `password_hash`) VALUES ('tester@gmail.com', 'tester', '$2b$10$5MmB65AVlOouAQw800hj9.KMCM0dfThwLKujH1vxeXRCE2vbyA6T.');
INSERT INTO `157a_team9`.`user` (`email`, `username`, `password_hash`) VALUES ('steven@yahoo.com', 'steven', '$2b$10$5MmB65AVlOouAQw800hj9.KMCM0dfThwLKujH1vxeXRCE2vbyA6T.');
INSERT INTO `157a_team9`.`user` (`email`, `username`, `password_hash`) VALUES ('justin@gmail.com', 'justin', '$2b$10$5MmB65AVlOouAQw800hj9.KMCM0dfThwLKujH1vxeXRCE2vbyA6T.');
INSERT INTO `157a_team9`.`user` (`email`, `username`, `password_hash`) VALUES ('sayeed@sjsu.edu', 'sayeed', '$2b$10$5MmB65AVlOouAQw800hj9.KMCM0dfThwLKujH1vxeXRCE2vbyA6T.');
INSERT INTO `157a_team9`.`user` (`email`, `username`, `password_hash`) VALUES ('steven.chang@sjsu.edu', 'stchang', '$2b$10$5MmB65AVlOouAQw800hj9.KMCM0dfThwLKujH1vxeXRCE2vbyA6T.');
INSERT INTO `157a_team9`.`user` (`email`, `username`, `password_hash`) VALUES ('justin.lo@sjsu.edu', 'jlo', '$2b$10$5MmB65AVlOouAQw800hj9.KMCM0dfThwLKujH1vxeXRCE2vbyA6T.');
INSERT INTO `157a_team9`.`user` (`email`, `username`, `password_hash`) VALUES ('fakeemail@protonmail.com', 'faker', '$2b$10$5MmB65AVlOouAQw800hj9.KMCM0dfThwLKujH1vxeXRCE2vbyA6T.');
INSERT INTO `157a_team9`.`user` (`email`, `username`, `password_hash`) VALUES ('cassidychu@yahoo.com', 'cassidy', '$2b$10$5MmB65AVlOouAQw800hj9.KMCM0dfThwLKujH1vxeXRCE2vbyA6T.');
INSERT INTO `157a_team9`.`user` (`email`, `username`, `password_hash`) VALUES ('superman@yahoo.com', 'supes', '$2b$10$5MmB65AVlOouAQw800hj9.KMCM0dfThwLKujH1vxeXRCE2vbyA6T.');
INSERT INTO `157a_team9`.`user` (`email`, `username`, `password_hash`) VALUES ('batman@wayne.com', 'batman', '$2b$10$5MmB65AVlOouAQw800hj9.KMCM0dfThwLKujH1vxeXRCE2vbyA6T.');
INSERT INTO `157a_team9`.`user` (`email`, `username`, `password_hash`) VALUES ('tony.stark@gmail.com', 'ironman', '$2b$10$5MmB65AVlOouAQw800hj9.KMCM0dfThwLKujH1vxeXRCE2vbyA6T.');
INSERT INTO `157a_team9`.`user` (`email`, `username`, `password_hash`) VALUES ('notspiderman@gmail.com', 'peterparker', '$2b$10$5MmB65AVlOouAQw800hj9.KMCM0dfThwLKujH1vxeXRCE2vbyA6T.');

INSERT INTO `157a_team9`.`brand` (`brand_name`) VALUES ('razer');
INSERT INTO `157a_team9`.`brand` (`brand_name`) VALUES ('cherry');
INSERT INTO `157a_team9`.`brand` (`brand_name`) VALUES ('logitech');
INSERT INTO `157a_team9`.`brand` (`brand_name`) VALUES ('apple');
INSERT INTO `157a_team9`.`brand` (`brand_name`) VALUES ('keychron');
INSERT INTO `157a_team9`.`brand` (`brand_name`) VALUES ('ducky');
INSERT INTO `157a_team9`.`brand` (`brand_name`) VALUES ('asus');
INSERT INTO `157a_team9`.`brand` (`brand_name`) VALUES ('corsair');
INSERT INTO `157a_team9`.`brand` (`brand_name`) VALUES ('drop');
INSERT INTO `157a_team9`.`brand` (`brand_name`) VALUES ('kinesis');
INSERT INTO `157a_team9`.`brand` (`brand_name`) VALUES ('das');
INSERT INTO `157a_team9`.`brand` (`brand_name`) VALUES ('microsoft');
INSERT INTO `157a_team9`.`brand` (`brand_name`) VALUES ('xenta');
INSERT INTO `157a_team9`.`brand` (`brand_name`) VALUES ('knewkey');
INSERT INTO `157a_team9`.`brand` (`brand_name`) VALUES ('other');

INSERT INTO `157a_team9`.`listing` (`title`, `description`, `price`) VALUES ('MX Keys', 'I am selling a used logitech mx keys from SF', '10000');
INSERT INTO `157a_team9`.`listing` (`title`, `description`, `price`) VALUES ('Custome keyboard', 'Selling a custom keyboard', '10000');
INSERT INTO `157a_team9`.`listing` (`title`, `description`, `price`) VALUES ('Custom Keyboard build service', 'I will build you a custom keyboard for $50 plus cost of parts', '5000');
INSERT INTO `157a_team9`.`listing` (`title`, `description`, `price`) VALUES ('Razer Huntsman', 'I am selling a used razer huntsman', '10000');
INSERT INTO `157a_team9`.`listing` (`title`, `description`, `price`) VALUES ('Stargaze Keycaps', 'I will sell you my stargaze groupby keycas when they ship', '30000');
INSERT INTO `157a_team9`.`listing` (`title`, `description`, `price`) VALUES ('KBDFANS 67Rev2', 'Selling kbdfans 67 rev2 pcb', '8000');
INSERT INTO `157a_team9`.`listing` (`title`, `description`, `price`) VALUES ('low profile aluminum case', 'used low profile aluminium case. Color: grey', '5000');
INSERT INTO `157a_team9`.`listing` (`title`, `description`, `price`) VALUES ('low profile aluminum case', 'used low profile aluminum case. Color: chocolate', '5000');
INSERT INTO `157a_team9`.`listing` (`title`, `description`, `price`) VALUES ('low profile aluminum case', 'used low profile aluminum case. Color: blue', '5000');
INSERT INTO `157a_team9`.`listing` (`title`, `description`, `price`) VALUES ('GMK moomin keycaps', 'Selling my spot in the GMK moomin group buy', '20000');
INSERT INTO `157a_team9`.`listing` (`title`, `description`, `price`) VALUES ('Brass Plate osi', 'Selling a standard brass plate compatible with KBD 67 Rev 2', '1000');
INSERT INTO `157a_team9`.`listing` (`title`, `description`, `price`) VALUES ('Polycarb Plate', 'Selling used polycarb plate, some scuffs.', '500');
INSERT INTO `157a_team9`.`listing` (`title`, `description`, `price`) VALUES ('Fake Olives', 'Selling a knockoff GMK olive keycaps', '5000');
INSERT INTO `157a_team9`.`listing` (`title`, `description`, `price`) VALUES ('MX Keys + MX master', 'Selling used pair of logitech mx master and mx keys', '20000');
INSERT INTO `157a_team9`.`listing` (`title`, `description`, `price`) VALUES ('Telios 65g Switches', 'Selling telios switches. $0.70 per switch', '70');

INSERT INTO `157a_team9`.`address` (`address`, `city_name`, `state`, `phone`, `zipcode`) VALUES ('123 fakeaddress Dr', 'San Francisco', 'CA', '4151234567', '94127');
INSERT INTO `157a_team9`.`address` (`address`, `city_name`, `state`, `phone`, `zipcode`) VALUES ('34 Robinhood Way', 'San Jose', 'CA', '4152341234', '94132');
INSERT INTO `157a_team9`.`address` (`address`, `city_name`, `state`, `phone`, `zipcode`) VALUES ('35 12th ave', 'Los Angeles', 'CA', '8182341234', '43243');
INSERT INTO `157a_team9`.`address` (`address`, `city_name`, `state`, `phone`, `zipcode`) VALUES ('123 Car Ave', 'Sacremento', 'CA', '7121124234', '42674');
INSERT INTO `157a_team9`.`address` (`address`, `city_name`, `state`, `phone`, `zipcode`) VALUES ('13 19th st', 'Boston', 'MA', '4124237535', '94126');
INSERT INTO `157a_team9`.`address` (`address`, `city_name`, `state`, `phone`, `zipcode`) VALUES ('16 Hill Dr', 'Bellvue', 'WA', '1234567890', '95112');
INSERT INTO `157a_team9`.`address` (`address`, `city_name`, `state`, `phone`, `zipcode`) VALUES ('16 Bad Way', 'Tacoma', 'WA', '0987654321', '95113');
INSERT INTO `157a_team9`.`address` (`address`, `city_name`, `state`, `phone`, `zipcode`) VALUES ('32 2nd st', 'Houston', 'TX', '1238904567', '95123');
INSERT INTO `157a_team9`.`address` (`address`, `city_name`, `state`, `phone`, `zipcode`) VALUES ('31 irving', 'Houston', 'TX', '231223465', '93423');
INSERT INTO `157a_team9`.`address` (`address`, `city_name`, `state`, `phone`, `zipcode`) VALUES ('423 Carlsbad st', 'Sacremento', 'CA', '1234577643', '43532');
INSERT INTO `157a_team9`.`address` (`address`, `city_name`, `state`, `phone`, `zipcode`) VALUES ('75 1st St', 'San Jose', 'CA', '1234567879', '13423');
INSERT INTO `157a_team9`.`address` (`address`, `city_name`, `state`, `phone`, `zipcode`) VALUES ('96 Washington St', 'San Francisco', 'CA', '1266424112', '41234');
INSERT INTO `157a_team9`.`address` (`address`, `city_name`, `state`, `phone`, `zipcode`) VALUES ('45 Carlson Dr', 'San Jose', 'CA', '7893451234', '98765');
INSERT INTO `157a_team9`.`address` (`address`, `city_name`, `state`, `phone`, `zipcode`) VALUES ('12 Bellmont Dr', 'Seattle', 'WA', '123444523', '12345');
INSERT INTO `157a_team9`.`address` (`address`, `city_name`, `state`, `phone`, `zipcode`) VALUES ('98 Forester Way', 'New York', 'NY', '1321112222', '13532');

INSERT INTO `157a_team9`.`category` (`category_name`) VALUES ('Used');
INSERT INTO `157a_team9`.`category` (`category_name`) VALUES ('New');
INSERT INTO `157a_team9`.`category` (`category_name`) VALUES ('Full Keyboard');
INSERT INTO `157a_team9`.`category` (`category_name`) VALUES ('Custom Keyboard');
INSERT INTO `157a_team9`.`category` (`category_name`) VALUES ('Switches');
INSERT INTO `157a_team9`.`category` (`category_name`) VALUES ('PCB');
INSERT INTO `157a_team9`.`category` (`category_name`) VALUES ('Plate');
INSERT INTO `157a_team9`.`category` (`category_name`) VALUES ('Case');
INSERT INTO `157a_team9`.`category` (`category_name`) VALUES ('Key Caps');
INSERT INTO `157a_team9`.`category` (`category_name`) VALUES ('Service');
INSERT INTO `157a_team9`.`category` (`category_name`) VALUES ('Accesories');
INSERT INTO `157a_team9`.`category` (`category_name`) VALUES ('Tools');
INSERT INTO `157a_team9`.`category` (`category_name`) VALUES ('Stabilizers');
INSERT INTO `157a_team9`.`category` (`category_name`) VALUES ('Artisan');
INSERT INTO `157a_team9`.`category` (`category_name`) VALUES ('Other');

INSERT INTO `157a_team9`.`sells` (`user_id`, `listing_id`) VALUES ('1', '7');
INSERT INTO `157a_team9`.`sells` (`user_id`, `listing_id`) VALUES ('1', '8');
INSERT INTO `157a_team9`.`sells` (`user_id`, `listing_id`) VALUES ('1', '9');
INSERT INTO `157a_team9`.`sells` (`user_id`, `listing_id`) VALUES ('2', '1');
INSERT INTO `157a_team9`.`sells` (`user_id`, `listing_id`) VALUES ('2', '4');
INSERT INTO `157a_team9`.`sells` (`user_id`, `listing_id`) VALUES ('15', '11');
INSERT INTO `157a_team9`.`sells` (`user_id`, `listing_id`) VALUES ('15', '12');
INSERT INTO `157a_team9`.`sells` (`user_id`, `listing_id`) VALUES ('15', '15');
INSERT INTO `157a_team9`.`sells` (`user_id`, `listing_id`) VALUES ('3', '10');
INSERT INTO `157a_team9`.`sells` (`user_id`, `listing_id`) VALUES ('3', '2');
INSERT INTO `157a_team9`.`sells` (`user_id`, `listing_id`) VALUES ('4', '3');
INSERT INTO `157a_team9`.`sells` (`user_id`, `listing_id`) VALUES ('4', '5');
INSERT INTO `157a_team9`.`sells` (`user_id`, `listing_id`) VALUES ('2', '6');
INSERT INTO `157a_team9`.`sells` (`user_id`, `listing_id`) VALUES ('11', '13');
INSERT INTO `157a_team9`.`sells` (`user_id`, `listing_id`) VALUES ('13', '14');

INSERT INTO `157a_team9`.`saves` (`user_id`, `listing_id`) VALUES ('1', '15');
INSERT INTO `157a_team9`.`saves` (`user_id`, `listing_id`) VALUES ('1', '14');
INSERT INTO `157a_team9`.`saves` (`user_id`, `listing_id`) VALUES ('1', '13');
INSERT INTO `157a_team9`.`saves` (`user_id`, `listing_id`) VALUES ('2', '14');
INSERT INTO `157a_team9`.`saves` (`user_id`, `listing_id`) VALUES ('2', '13');
INSERT INTO `157a_team9`.`saves` (`user_id`, `listing_id`) VALUES ('2', '2');
INSERT INTO `157a_team9`.`saves` (`user_id`, `listing_id`) VALUES ('14', '1');
INSERT INTO `157a_team9`.`saves` (`user_id`, `listing_id`) VALUES ('14', '2');
INSERT INTO `157a_team9`.`saves` (`user_id`, `listing_id`) VALUES ('14', '3');
INSERT INTO `157a_team9`.`saves` (`user_id`, `listing_id`) VALUES ('14', '4');
INSERT INTO `157a_team9`.`saves` (`user_id`, `listing_id`) VALUES ('14', '5');
INSERT INTO `157a_team9`.`saves` (`user_id`, `listing_id`) VALUES ('4', '2');
INSERT INTO `157a_team9`.`saves` (`user_id`, `listing_id`) VALUES ('4', '3');
INSERT INTO `157a_team9`.`saves` (`user_id`, `listing_id`) VALUES ('5', '2');
INSERT INTO `157a_team9`.`saves` (`user_id`, `listing_id`) VALUES ('1', '4');

INSERT INTO `157a_team9`.`seller` (`user_id`, `validated`) VALUES ('1', '1');
INSERT INTO `157a_team9`.`seller` (`user_id`, `validated`) VALUES ('2', '0');
INSERT INTO `157a_team9`.`seller` (`user_id`, `validated`) VALUES ('3', '0');
INSERT INTO `157a_team9`.`seller` (`user_id`, `validated`) VALUES ('4', '0');
INSERT INTO `157a_team9`.`seller` (`user_id`, `validated`) VALUES ('5', '1');
INSERT INTO `157a_team9`.`seller` (`user_id`, `validated`) VALUES ('6', '0');
INSERT INTO `157a_team9`.`seller` (`user_id`, `validated`) VALUES ('7', '0');
INSERT INTO `157a_team9`.`seller` (`user_id`, `validated`) VALUES ('8', '0');
INSERT INTO `157a_team9`.`seller` (`user_id`, `validated`) VALUES ('9', '0');
INSERT INTO `157a_team9`.`seller` (`user_id`, `validated`) VALUES ('10', '0');
INSERT INTO `157a_team9`.`seller` (`user_id`, `validated`) VALUES ('11', '0');
INSERT INTO `157a_team9`.`seller` (`user_id`, `validated`) VALUES ('12', '0');
INSERT INTO `157a_team9`.`seller` (`user_id`, `validated`) VALUES ('13', '0');
INSERT INTO `157a_team9`.`seller` (`user_id`, `validated`) VALUES ('14', '0');
INSERT INTO `157a_team9`.`seller` (`user_id`, `validated`) VALUES ('15', '1');

INSERT INTO `157a_team9`.`has_brand` (`brand_id`, `listing_id`) VALUES ('3', '1');
INSERT INTO `157a_team9`.`has_brand` (`brand_id`, `listing_id`) VALUES ('3', '14');
INSERT INTO `157a_team9`.`has_brand` (`brand_id`, `listing_id`) VALUES ('1', '4');
INSERT INTO `157a_team9`.`has_brand` (`brand_id`, `listing_id`) VALUES ('15', '2');
INSERT INTO `157a_team9`.`has_brand` (`brand_id`, `listing_id`) VALUES ('15', '3');
INSERT INTO `157a_team9`.`has_brand` (`brand_id`, `listing_id`) VALUES ('15', '5');
INSERT INTO `157a_team9`.`has_brand` (`brand_id`, `listing_id`) VALUES ('15', '6');
INSERT INTO `157a_team9`.`has_brand` (`brand_id`, `listing_id`) VALUES ('15', '7');
INSERT INTO `157a_team9`.`has_brand` (`brand_id`, `listing_id`) VALUES ('15', '8');
INSERT INTO `157a_team9`.`has_brand` (`brand_id`, `listing_id`) VALUES ('15', '9');
INSERT INTO `157a_team9`.`has_brand` (`brand_id`, `listing_id`) VALUES ('15', '10');
INSERT INTO `157a_team9`.`has_brand` (`brand_id`, `listing_id`) VALUES ('15', '11');
INSERT INTO `157a_team9`.`has_brand` (`brand_id`, `listing_id`) VALUES ('15', '12');
INSERT INTO `157a_team9`.`has_brand` (`brand_id`, `listing_id`) VALUES ('15', '13');
INSERT INTO `157a_team9`.`has_brand` (`brand_id`, `listing_id`) VALUES ('15', '15');

INSERT INTO `157a_team9`.`has_category` (`category_id`, `listing_id`) VALUES ('1', '1');
INSERT INTO `157a_team9`.`has_category` (`category_id`, `listing_id`) VALUES ('3', '1');
INSERT INTO `157a_team9`.`has_category` (`category_id`, `listing_id`) VALUES ('2', '2');
INSERT INTO `157a_team9`.`has_category` (`category_id`, `listing_id`) VALUES ('3', '2');
INSERT INTO `157a_team9`.`has_category` (`category_id`, `listing_id`) VALUES ('4', '2');
INSERT INTO `157a_team9`.`has_category` (`category_id`, `listing_id`) VALUES ('2', '3');
INSERT INTO `157a_team9`.`has_category` (`category_id`, `listing_id`) VALUES ('3', '3');
INSERT INTO `157a_team9`.`has_category` (`category_id`, `listing_id`) VALUES ('4', '3');
INSERT INTO `157a_team9`.`has_category` (`category_id`, `listing_id`) VALUES ('10', '3');
INSERT INTO `157a_team9`.`has_category` (`category_id`, `listing_id`) VALUES ('1', '4');
INSERT INTO `157a_team9`.`has_category` (`category_id`, `listing_id`) VALUES ('3', '4');
INSERT INTO `157a_team9`.`has_category` (`category_id`, `listing_id`) VALUES ('9', '5');
INSERT INTO `157a_team9`.`has_category` (`category_id`, `listing_id`) VALUES ('6', '6');
INSERT INTO `157a_team9`.`has_category` (`category_id`, `listing_id`) VALUES ('8', '7');
INSERT INTO `157a_team9`.`has_category` (`category_id`, `listing_id`) VALUES ('8', '8');
INSERT INTO `157a_team9`.`has_category` (`category_id`, `listing_id`) VALUES ('8', '9');

