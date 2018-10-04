SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `2016952932`.`categorias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `2016952932`.`categorias` ;

CREATE TABLE IF NOT EXISTS `2016952932`.`categorias` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`)  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `2016952932`.`tenistas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `2016952932`.`tenistas` ;

CREATE TABLE IF NOT EXISTS `2016952932`.`tenistas` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(150) NOT NULL ,
  `data_nascimento` DATETIME NOT NULL ,
  `sexo` BIT NOT NULL ,
  `categorias_id` INT NOT NULL ,
  PRIMARY KEY (`id`)  ,
  INDEX `fk_tenistas_categorias1_idx` (`categorias_id` ASC)  ,
  CONSTRAINT `fk_tenistas_categorias1`
    FOREIGN KEY (`categorias_id`)
    REFERENCES `2016952932`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `2016952932`.`campeonatos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `2016952932`.`campeonatos` ;

CREATE TABLE IF NOT EXISTS `2016952932`.`campeonatos` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(150) NOT NULL ,
  `edicao` VARCHAR(45) NULL ,
  `data_realizacao` DATETIME NOT NULL ,
  `premiacao` DECIMAL(10,2) NOT NULL ,
  PRIMARY KEY (`id`)  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `2016952932`.`jogos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `2016952932`.`jogos` ;

CREATE TABLE IF NOT EXISTS `2016952932`.`jogos` (
  `tenista_01_id` INT NOT NULL ,
  `tenista_02_id` INT NOT NULL ,
  `campeonatos_id` INT NOT NULL ,
  `publico` INT NOT NULL ,
  `pontuacao_tenista_01` INT NOT NULL ,
  `pontuacao_tenista_02` INT NOT NULL ,
  `quadras_id` INT NOT NULL ,
  PRIMARY KEY (`tenista_01_id`, `tenista_02_id`, `campeonatos_id`)  ,
  INDEX `fk_sets_tenistas1_idx` (`tenista_01_id` ASC)  ,
  INDEX `fk_sets_tenistas2_idx` (`tenista_02_id` ASC)  ,
  INDEX `fk_jogos_campeonatos1_idx` (`campeonatos_id` ASC)  ,
  INDEX `fk_jogos_quadras1_idx` (`quadras_id` ASC)  ,
  CONSTRAINT `fk_sets_tenistas1`
    FOREIGN KEY (`tenista_01_id`)
    REFERENCES `2016952932`.`tenistas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sets_tenistas2`
    FOREIGN KEY (`tenista_02_id`)
    REFERENCES `2016952932`.`tenistas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jogos_campeonatos1`
    FOREIGN KEY (`campeonatos_id`)
    REFERENCES `2016952932`.`campeonatos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jogos_quadras1`
    FOREIGN KEY (`quadras_id`)
    REFERENCES `2016952932`.`quadras` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `2016952932`.`quadras`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `2016952932`.`quadras` ;

CREATE TABLE IF NOT EXISTS `2016952932`.`quadras` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `tipo` VARCHAR(45) NOT NULL ,
  `endereco` VARCHAR(45) NOT NULL DEFAULT 'Brasil' ,
  PRIMARY KEY (`id`)  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `2016952932`.`jogos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `2016952932`.`jogos` ;

CREATE TABLE IF NOT EXISTS `2016952932`.`jogos` (
  `tenista_01_id` INT NOT NULL ,
  `tenista_02_id` INT NOT NULL ,
  `campeonatos_id` INT NOT NULL ,
  `publico` INT NOT NULL ,
  `pontuacao_tenista_01` INT NOT NULL ,
  `pontuacao_tenista_02` INT NOT NULL ,
  `quadras_id` INT NOT NULL ,
  PRIMARY KEY (`tenista_01_id`, `tenista_02_id`, `campeonatos_id`)  ,
  INDEX `fk_sets_tenistas1_idx` (`tenista_01_id` ASC)  ,
  INDEX `fk_sets_tenistas2_idx` (`tenista_02_id` ASC)  ,
  INDEX `fk_jogos_campeonatos1_idx` (`campeonatos_id` ASC)  ,
  INDEX `fk_jogos_quadras1_idx` (`quadras_id` ASC)  ,
  CONSTRAINT `fk_sets_tenistas1`
    FOREIGN KEY (`tenista_01_id`)
    REFERENCES `2016952932`.`tenistas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sets_tenistas2`
    FOREIGN KEY (`tenista_02_id`)
    REFERENCES `2016952932`.`tenistas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jogos_campeonatos1`
    FOREIGN KEY (`campeonatos_id`)
    REFERENCES `2016952932`.`campeonatos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jogos_quadras1`
    FOREIGN KEY (`quadras_id`)
    REFERENCES `2016952932`.`quadras` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
