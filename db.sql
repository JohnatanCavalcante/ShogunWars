SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `shogunwars` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `shogunwars`.`nation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shogunwars`.`nation` ;

CREATE  TABLE IF NOT EXISTS `shogunwars`.`nation` (
  `id_nation` INT NOT NULL AUTO_INCREMENT ,
  `name_nation` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_nation`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shogunwars`.`trainingcamp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shogunwars`.`trainingcamp` ;

CREATE  TABLE IF NOT EXISTS `shogunwars`.`trainingcamp` (
  `id_training` INT NOT NULL AUTO_INCREMENT ,
  `duration_training` INT NOT NULL ,
  `reward_training` INT NOT NULL ,
  PRIMARY KEY (`id_training`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shogunwars`.`character`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shogunwars`.`character` ;

CREATE  TABLE IF NOT EXISTS `shogunwars`.`character` (
  `id_character` INT NOT NULL AUTO_INCREMENT ,
  `name_character` VARCHAR(45) NOT NULL ,
  `gender_character` VARCHAR(45) NOT NULL ,
  `nation_character` VARCHAR(45) NOT NULL ,
  `level_character` INT NOT NULL ,
  `hpMax_character` INT NOT NULL ,
  `hpCurrent_character` INT NOT NULL ,
  `expMax_character` INT NOT NULL ,
  `expCurrent_character` INT NOT NULL ,
  `trainingPoints_character` INT NOT NULL ,
  `strength_character` INT NOT NULL ,
  `defense_character` INT NOT NULL ,
  `resistence_character` INT NOT NULL ,
  `nation_id_nation` INT NOT NULL ,
  `trainingcamp_id_training` INT NOT NULL ,
  PRIMARY KEY (`id_character`) ,
  INDEX `fk_character_nation1` (`nation_id_nation` ASC) ,
  INDEX `fk_character_trainingcamp1` (`trainingcamp_id_training` ASC) ,
  CONSTRAINT `fk_character_nation1`
    FOREIGN KEY (`nation_id_nation` )
    REFERENCES `mydb`.`nation` (`id_nation` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_character_trainingcamp1`
    FOREIGN KEY (`trainingcamp_id_training` )
    REFERENCES `mydb`.`trainingcamp` (`id_training` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shogunwars`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shogunwars`.`user` ;

CREATE  TABLE IF NOT EXISTS `shogunwars`.`user` (
  `id_user` INT NOT NULL AUTO_INCREMENT ,
  `email_user` VARCHAR(45) NOT NULL ,
  `password_user` INT NOT NULL ,
  `character_id_character` INT NOT NULL ,
  PRIMARY KEY (`id_user`) ,
  INDEX `fk_user_character` (`character_id_character` ASC) ,
  CONSTRAINT `fk_user_character`
    FOREIGN KEY (`character_id_character` )
    REFERENCES `mydb`.`character` (`id_character` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
