-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema isimm
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `isimm` DEFAULT CHARACTER SET utf8 ;
USE `isimm` ;

-- -----------------------------------------------------
-- Table `isimm`.`section`
-- -----------------------------------------------------
-- Create Role Table
CREATE TABLE IF NOT EXISTS `isimm`.`role` (
  `roleId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`roleId`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB COMMENT='Table storing user roles';

CREATE TABLE IF NOT EXISTS `isimm`.`permission` (
  `permissionId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`permissionId`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB COMMENT='Table storing permissions';

-- Add a Many-to-Many Relationship between Role and Permission
CREATE TABLE IF NOT EXISTS `isimm`.`role_permission` (
  `roleId` INT NOT NULL,
  `permissionId` INT NOT NULL,
  PRIMARY KEY (`roleId`, `permissionId`),
  INDEX `fk_role_permission_permission_idx` (`permissionId` ASC) VISIBLE,
  CONSTRAINT `fk_role_permission_role`
    FOREIGN KEY (`roleId`)
    REFERENCES `isimm`.`role` (`roleId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_role_permission_permission`
    FOREIGN KEY (`permissionId`)
    REFERENCES `isimm`.`permission` (`permissionId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB COMMENT='Table storing role-to-permission relationships';



-- Modify User Table to Include Role
CREATE TABLE IF NOT EXISTS `isimm`.`user` (
  `userId` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `roleId` INT NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_user_role_idx` (`roleId` ASC) VISIBLE,
  CONSTRAINT `fk_user_role`
    FOREIGN KEY (`roleId`)
    REFERENCES `isimm`.`role` (`roleId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB COMMENT='Table storing user information';

CREATE TABLE IF NOT EXISTS `isimm`.`student` (
  `userId` INT NOT NULL,
  `additionalStudentInfo` VARCHAR(100),
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_student_user`
    FOREIGN KEY (`userId`)
    REFERENCES `isimm`.`user` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB COMMENT='Table storing student-specific information';



-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isimm`.`teacher` (
  `userId` INT NOT NULL,
  `additionalTeacherInfo` VARCHAR(100),
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_teacher_user`
    FOREIGN KEY (`userId`)
    REFERENCES `isimm`.`user` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB COMMENT='Table storing teacher-specific information';

CREATE TABLE IF NOT EXISTS `isimm`.`admin` (
  `userId` INT NOT NULL,
  `additionalAdminInfo` VARCHAR(100),
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_admin_user`
    FOREIGN KEY (`userId`)
    REFERENCES `isimm`.`user` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB COMMENT='Table storing admin-specific information';



-- -----------------------------------------------------
-- Table `isimm`.`subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isimm`.`subject` (
  `subjectId` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`subjectId`),
  UNIQUE INDEX `subjectId_UNIQUE` (`subjectId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `isimm`.`subject_has_section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isimm`.`subject_has_section` (
  `subject_subjectId` INT NOT NULL,
  `section_sectioinId` INT NOT NULL,
  PRIMARY KEY (`subject_subjectId`, `section_sectioinId`),
  INDEX `fk_subject_has_section_section1_idx` (`section_sectioinId` ASC) VISIBLE,
  INDEX `fk_subject_has_section_subject1_idx` (`subject_subjectId` ASC) VISIBLE,
  CONSTRAINT `fk_subject_has_section_subject1`
    FOREIGN KEY (`subject_subjectId`)
    REFERENCES `isimm`.`subject` (`subjectId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject_has_section_section1`
    FOREIGN KEY (`section_sectioinId`)
    REFERENCES `isimm`.`section` (`sectioinId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `isimm`.`teacher`
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `isimm`.`teacher_has_subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isimm`.`teacher_has_subject` (
  `teacher_teacherId` VARCHAR(8) NOT NULL,
  `subject_subjectId` INT NOT NULL,
  PRIMARY KEY (`teacher_teacherId`, `subject_subjectId`),
  INDEX `fk_teacher_has_subject_subject1_idx` (`subject_subjectId` ASC) VISIBLE,
  INDEX `fk_teacher_has_subject_teacher1_idx` (`teacher_teacherId` ASC) VISIBLE,
  CONSTRAINT `fk_teacher_has_subject_teacher1`
    FOREIGN KEY (`teacher_teacherId`)
    REFERENCES `isimm`.`teacher` (`teacherId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teacher_has_subject_subject1`
    FOREIGN KEY (`subject_subjectId`)
    REFERENCES `isimm`.`subject` (`subjectId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `isimm`.`classroom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isimm`.`classroom` (
  `classroomId` INT NOT NULL,
  `num` VARCHAR(45) NULL,
  `capacity` INT NULL,
  PRIMARY KEY (`classroomId`),
  UNIQUE INDEX `classroomId_UNIQUE` (`classroomId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `isimm`.`schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isimm`.`schedule` (
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
    REFERENCES `isimm`.`classroom` (`classroomId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_schedule_teacher1`
    FOREIGN KEY (`teacher_teacherId`)
    REFERENCES `isimm`.`teacher` (`teacherId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_schedule_subject1`
    FOREIGN KEY (`subject_subjectId`)
    REFERENCES `isimm`.`subject` (`subjectId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_schedule_section1`
    FOREIGN KEY (`section_sectioinId`)
    REFERENCES `isimm`.`section` (`sectioinId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `isimm`.`teacher_has_section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isimm`.`teacher_has_section` (
  `teacher_teacherId` VARCHAR(8) NOT NULL,
  `section_sectioinId` INT NOT NULL,
  PRIMARY KEY (`teacher_teacherId`, `section_sectioinId`),
  INDEX `fk_teacher_has_section_section1_idx` (`section_sectioinId` ASC) VISIBLE,
  INDEX `fk_teacher_has_section_teacher1_idx` (`teacher_teacherId` ASC) VISIBLE,
  CONSTRAINT `fk_teacher_has_section_teacher1`
    FOREIGN KEY (`teacher_teacherId`)
    REFERENCES `isimm`.`teacher` (`teacherId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teacher_has_section_section1`
    FOREIGN KEY (`section_sectioinId`)
    REFERENCES `isimm`.`section` (`sectioinId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
