-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`section` (
  `sectioinId` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`sectioinId`),
  UNIQUE INDEX `sectioinId_UNIQUE` (`sectioinId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`student` (
  `studentId` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `prenom` VARCHAR(45) NULL,
  `email` VARCHAR(100) NULL,
  `password` VARCHAR(45) NULL,
  `section_sectioinId` INT NOT NULL,
  PRIMARY KEY (`studentId`),
  UNIQUE INDEX `studentId_UNIQUE` (`studentId` ASC) VISIBLE,
  INDEX `fk_student_section_idx` (`section_sectioinId` ASC) VISIBLE,
  CONSTRAINT `fk_student_section`
    FOREIGN KEY (`section_sectioinId`)
    REFERENCES `mydb`.`section` (`sectioinId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`subject` (
  `subjectId` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`subjectId`),
  UNIQUE INDEX `subjectId_UNIQUE` (`subjectId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`subject_has_section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`subject_has_section` (
  `subject_subjectId` INT NOT NULL,
  `section_sectioinId` INT NOT NULL,
  PRIMARY KEY (`subject_subjectId`, `section_sectioinId`),
  INDEX `fk_subject_has_section_section1_idx` (`section_sectioinId` ASC) VISIBLE,
  INDEX `fk_subject_has_section_subject1_idx` (`subject_subjectId` ASC) VISIBLE,
  CONSTRAINT `fk_subject_has_section_subject1`
    FOREIGN KEY (`subject_subjectId`)
    REFERENCES `mydb`.`subject` (`subjectId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject_has_section_section1`
    FOREIGN KEY (`section_sectioinId`)
    REFERENCES `mydb`.`section` (`sectioinId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`teacher` (
  `teacherId` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `email` VARCHAR(100) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`teacherId`),
  UNIQUE INDEX `teacherId_UNIQUE` (`teacherId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`teacher_has_subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`teacher_has_subject` (
  `teacher_teacherId` INT NOT NULL,
  `subject_subjectId` INT NOT NULL,
  PRIMARY KEY (`teacher_teacherId`, `subject_subjectId`),
  INDEX `fk_teacher_has_subject_subject1_idx` (`subject_subjectId` ASC) VISIBLE,
  INDEX `fk_teacher_has_subject_teacher1_idx` (`teacher_teacherId` ASC) VISIBLE,
  CONSTRAINT `fk_teacher_has_subject_teacher1`
    FOREIGN KEY (`teacher_teacherId`)
    REFERENCES `mydb`.`teacher` (`teacherId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teacher_has_subject_subject1`
    FOREIGN KEY (`subject_subjectId`)
    REFERENCES `mydb`.`subject` (`subjectId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`classroom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`classroom` (
  `classroomId` INT NOT NULL,
  `num` VARCHAR(45) NULL,
  `capacity` INT NULL,
  PRIMARY KEY (`classroomId`),
  UNIQUE INDEX `classroomId_UNIQUE` (`classroomId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`schedule` (
  `id` INT NOT NULL,
  `timeSlot` INT NULL,
  `classroom_classroomId` INT NOT NULL,
  `teacher_teacherId` INT NOT NULL,
  `subject_subjectId` INT NOT NULL,
  `section_sectioinId` INT NOT NULL,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  PRIMARY KEY (`id`, `classroom_classroomId`),
  INDEX `fk_schedule_classroom1_idx` (`classroom_classroomId` ASC) VISIBLE,
  INDEX `fk_schedule_teacher1_idx` (`teacher_teacherId` ASC) VISIBLE,
  INDEX `fk_schedule_subject1_idx` (`subject_subjectId` ASC) VISIBLE,
  INDEX `fk_schedule_section1_idx` (`section_sectioinId` ASC) VISIBLE,
  CONSTRAINT `fk_schedule_classroom1`
    FOREIGN KEY (`classroom_classroomId`)
    REFERENCES `mydb`.`classroom` (`classroomId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_schedule_teacher1`
    FOREIGN KEY (`teacher_teacherId`)
    REFERENCES `mydb`.`teacher` (`teacherId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_schedule_subject1`
    FOREIGN KEY (`subject_subjectId`)
    REFERENCES `mydb`.`subject` (`subjectId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_schedule_section1`
    FOREIGN KEY (`section_sectioinId`)
    REFERENCES `mydb`.`section` (`sectioinId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`teacher_has_section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`teacher_has_section` (
  `teacher_teacherId` INT NOT NULL,
  `section_sectioinId` INT NOT NULL,
  PRIMARY KEY (`teacher_teacherId`, `section_sectioinId`),
  INDEX `fk_teacher_has_section_section1_idx` (`section_sectioinId` ASC) VISIBLE,
  INDEX `fk_teacher_has_section_teacher1_idx` (`teacher_teacherId` ASC) VISIBLE,
  CONSTRAINT `fk_teacher_has_section_teacher1`
    FOREIGN KEY (`teacher_teacherId`)
    REFERENCES `mydb`.`teacher` (`teacherId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teacher_has_section_section1`
    FOREIGN KEY (`section_sectioinId`)
    REFERENCES `mydb`.`section` (`sectioinId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
