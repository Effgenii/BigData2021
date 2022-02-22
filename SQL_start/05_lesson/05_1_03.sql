ALTER TABLE `homework3`.`catalogs` 
ADD COLUMN `group_id` VARCHAR(45) NULL AFTER `name`;

UPDATE `homework3`.`catalogs` SET `group_id` = '5' WHERE (`id` = '1');
UPDATE `homework3`.`catalogs` SET `group_id` = '4' WHERE (`id` = '2');
UPDATE `homework3`.`catalogs` SET `group_id` = '3' WHERE (`id` = '3');
UPDATE `homework3`.`catalogs` SET `group_id` = '0' WHERE (`id` = '4');
UPDATE `homework3`.`catalogs` SET `group_id` = '0' WHERE (`id` = '5');
INSERT INTO `homework3`.`catalogs` (`group_id`) VALUES ('');

DELETE FROM `homework3`.`catalogs` WHERE (`id` = '6');

SELECT * FROM homework3.catalogs
order by group_id = 0, group_id;
