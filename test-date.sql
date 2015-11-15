Create database IF NOT EXISTS test;

CREATE  TABLE IF NOT EXISTS `test`.`user` (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  `age` INT,
  `admin` BIT,
  `createdDate` DATE ,
  PRIMARY KEY (`id`) );

INSERT INTO `test`.`user` (`id`, `name`, `age`, `admin`, `createdDate`) VALUES ('1', 'Dima Ivanov', 23, 0, now());
INSERT INTO `test`.`user` (`id`, `name`, `age`, `admin`, `createdDate`) VALUES ('2', 'Pavel Dudch', 27, 1, now());
INSERT INTO `test`.`user` (`id`, `name`, `age`, `admin`, `createdDate`) VALUES ('3', 'Taras Gupanov', 34, 0, now());
INSERT INTO `test`.`user` (`id`, `name`, `age`, `admin`, `createdDate`) VALUES ('4', 'Ivan Ivanovich', 23, 1, now());
INSERT INTO `test`.`user` (`id`, `name`, `age`, `admin`, `createdDate`) VALUES ('5', 'Oleg Petrenko', 23, 0, now());
INSERT INTO `test`.`user` (`id`, `name`, `age`, `admin`, `createdDate`) VALUES ('6', 'Max Korg', 22, 0, now());
INSERT INTO `test`.`user` (`id`, `name`, `age`, `admin`, `createdDate`) VALUES ('7', 'Filip Kirkorov', 32, 0, now());
INSERT INTO `test`.`user` (`id`, `name`, `age`, `admin`, `createdDate`) VALUES ('8', 'Angela Merkel', 23, 0, now());
INSERT INTO `test`.`user` (`id`, `name`, `age`, `admin`, `createdDate`) VALUES ('9', 'Vavan Putler', 45, 0, now());
INSERT INTO `test`.`user` (`id`, `name`, `age`, `admin`, `createdDate`) VALUES ('10', 'Vitya Yanyk', 34, 0, now());
INSERT INTO `test`.`user` (`id`, `name`, `age`, `admin`, `createdDate`) VALUES ('11', 'Lyonya Kosmos', 23, 1, now());
INSERT INTO `test`.`user` (`id`, `name`, `age`, `admin`, `createdDate`) VALUES ('12', 'Mxim Galkin', 85, 0, now());
INSERT INTO `test`.`user` (`id`, `name`, `age`, `admin`, `createdDate`) VALUES ('13', 'Alla Popugacheva', 25, 0, now());
INSERT INTO `test`.`user` (`id`, `name`, `age`, `admin`, `createdDate`) VALUES ('14', 'Baba Slavka', 45, 0, now());
INSERT INTO `test`.`user` (`id`, `name`, `age`, `admin`, `createdDate`) VALUES ('15', 'Sergey Veloceraptor', 54, 0, now());
INSERT INTO `test`.`user` (`id`, `name`, `age`, `admin`, `createdDate`) VALUES ('16', 'Andriy Nasrunyk', 11, 0, now());
INSERT INTO `test`.`user` (`id`, `name`, `age`, `admin`, `createdDate`) VALUES ('17', 'Vadim Ivanov', 12, 0, now());
INSERT INTO `test`.`user` (`id`, `name`, `age`, `admin`, `createdDate`) VALUES ('18', 'Sasha Grey', 22, 1, now());
INSERT INTO `test`.`user` (`id`, `name`, `age`, `admin`, `createdDate`) VALUES ('19', 'Pere Wudman', 47, 0, now());
INSERT INTO `test`.`user` (`id`, `name`, `age`, `admin`, `createdDate`) VALUES ('20', 'Pierre Woodman', 34, 0, now());
INSERT INTO `test`.`user` (`id`, `name`, `age`, `admin`, `createdDate`) VALUES ('21', 'Sophie Paris', 22, 0, now());
INSERT INTO `test`.`user` (`id`, `name`, `age`, `admin`, `createdDate`) VALUES ('22', 'Dan Ballan', 69, 0, now());