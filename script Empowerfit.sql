-- MySQL Workbench Synchronization
-- Generated: 2024-11-08 02:56
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Santi

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `empowerfit`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

ALTER TABLE `empowerfit`.`user_has_privilege` 
DROP FOREIGN KEY `fk_user`;

ALTER TABLE `empowerfit`.`Orders` 
DROP FOREIGN KEY `fk_Orders_address1`;

ALTER TABLE `empowerfit`.`sizes_has_product_properties` 
DROP FOREIGN KEY `fk_sizes_has_product_properties_sizes1`;

ALTER TABLE `empowerfit`.`products` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `category` `category` VARCHAR(80) NULL DEFAULT NULL ;

ALTER TABLE `empowerfit`.`users` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `empowerfit`.`product_properties` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `empowerfit`.`privileges` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `empowerfit`.`user_has_privilege` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `empowerfit`.`Orders` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `empowerfit`.`address` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `empowerfit`.`Payment` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `empowerfit`.`Orders_has_products` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `empowerfit`.`Status` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `empowerfit`.`sizes` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `empowerfit`.`colors` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `empowerfit`.`categories` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `empowerfit`.`colors_has_product_properties` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `empowerfit`.`sizes_has_product_properties` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `empowerfit`.`products` 
ADD CONSTRAINT `fk_products_categories1`
  FOREIGN KEY (`categories_id_category`)
  REFERENCES `empowerfit`.`categories` (`id_category`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `empowerfit`.`user_has_privilege` 
ADD CONSTRAINT `fk_user`
  FOREIGN KEY (`user_id`)
  REFERENCES `empowerfit`.`users` (`user_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_privilege`
  FOREIGN KEY (`privilege_id`)
  REFERENCES `empowerfit`.`privileges` (`privilege_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `empowerfit`.`Orders` 
ADD CONSTRAINT `fk_Orders_Payment1`
  FOREIGN KEY (`Payment_id_payment`)
  REFERENCES `empowerfit`.`Payment` (`id_payment`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Orders_Status1`
  FOREIGN KEY (`Status_id_status`)
  REFERENCES `empowerfit`.`Status` (`id_status`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Orders_address1`
  FOREIGN KEY (`address_id_address` , `address_users_user_id`)
  REFERENCES `empowerfit`.`address` (`id_address` , `users_user_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `empowerfit`.`address` 
ADD CONSTRAINT `fk_address_users1`
  FOREIGN KEY (`users_user_id`)
  REFERENCES `empowerfit`.`users` (`user_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `empowerfit`.`Payment` 
ADD CONSTRAINT `fk_Payment_Status1`
  FOREIGN KEY (`Status_id_status`)
  REFERENCES `empowerfit`.`Status` (`id_status`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `empowerfit`.`Orders_has_products` 
ADD CONSTRAINT `fk_Orders_has_products_Orders1`
  FOREIGN KEY (`Orders_id_orders` , `Orders_Payment_id_payment`)
  REFERENCES `empowerfit`.`Orders` (`id_orders` , `Payment_id_payment`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Orders_has_products_products1`
  FOREIGN KEY (`products_id_product`)
  REFERENCES `empowerfit`.`products` (`id_product`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `empowerfit`.`colors_has_product_properties` 
ADD CONSTRAINT `fk_colors_has_product_properties_colors1`
  FOREIGN KEY (`colors_id_colour`)
  REFERENCES `empowerfit`.`colors` (`id_colour`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_colors_has_product_properties_product_properties1`
  FOREIGN KEY (`product_properties_product_property_id`)
  REFERENCES `empowerfit`.`product_properties` (`product_property_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `empowerfit`.`sizes_has_product_properties` 
ADD CONSTRAINT `fk_sizes_has_product_properties_sizes1`
  FOREIGN KEY (`sizes_id_size`)
  REFERENCES `empowerfit`.`sizes` (`id_size`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_sizes_has_product_properties_product_properties1`
  FOREIGN KEY (`product_properties_product_property_id`)
  REFERENCES `empowerfit`.`product_properties` (`product_property_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
