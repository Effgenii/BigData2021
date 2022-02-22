CREATE TABLE `homework3`.`new_users` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` VARCHAR(45) NOT NULL DEFAULT '20.10.2017 8:10',
  PRIMARY KEY (`id`));

INSERT INTO `homework3`.`new_users` (`id`) VALUES ('1');
INSERT INTO `homework3`.`new_users` (`id`) VALUES ('2');
INSERT INTO `homework3`.`new_users` (`id`) VALUES ('3');
INSERT INTO `homework3`.`new_users` (`id`) VALUES ('4');
INSERT INTO `homework3`.`new_users` (`id`) VALUES ('5');


update homework3.new_users set date = str_to_date(`date`, '%d.%m.%Y %H:%i');

SELECT * FROM homework3.new_users;

ALTER TABLE `homework3`.`new_users` 
CHANGE COLUMN `date` `date` DATETIME NOT NULL ;
