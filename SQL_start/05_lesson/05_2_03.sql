CREATE TABLE `homework3`.`new_table` (
  `Number` INT NOT NULL,
  PRIMARY KEY (`Number`
  
  INSERT INTO `homework3`.`new_table` (`Number`) VALUES ('1');
INSERT INTO `homework3`.`new_table` (`Number`) VALUES ('2');
INSERT INTO `homework3`.`new_table` (`Number`) VALUES ('3');
INSERT INTO `homework3`.`new_table` (`Number`) VALUES ('4');
INSERT INTO `homework3`.`new_table` (`Number`) VALUES ('5');

-- экспонента суммы логарифмов равна произведению + округляем для красоты ответа, 
select round(exp(sum(ln(Number)))) from new_table;