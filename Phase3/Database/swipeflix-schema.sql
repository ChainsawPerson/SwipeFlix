-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP SCHEMA IF EXISTS `swipeflix` ;

CREATE SCHEMA IF NOT EXISTS `swipeflix` DEFAULT CHARACTER SET latin1;
USE `swipeflix` ;

-- ----------------------------------
-- TABLES
-- ----------------------------------

-- Title
CREATE TABLE IF NOT EXISTS `title_basics` (
  `title_id` VARCHAR(255) NOT NULL,
  `title_type` VARCHAR(255) NOT NULL,
  `title_primaryTitle` VARCHAR(255) NOT NULL,
  `title_originalTitle` VARCHAR(255) NOT NULL,
  `title_isAdult` BOOL NOT NULL,
  `title_startYear` INT NOT NULL,
  `title_endYear` INT NULL,
  `title_runtimeMinutes` INT NULL,
  `title_genre` VARCHAR(255) NULL,
  `title_posterURL` VARCHAR(255) NULL,
  PRIMARY KEY (`title_id`));

-- User
CREATE TABLE IF NOT EXISTS `user` (
	`user_id` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`user_id`)
);

-- Watch Later List
CREATE TABLE IF NOT EXISTS `watchLaterList` (
	`watchList_id` VARCHAR(255) NOT NULL,
    `user_user_id` VARCHAR(255) NOT NULL,
    `title_title_id` VARCHAR(255) NOT NULL,
    `watchList_timestamp` DATE NULL,
    PRIMARY KEY (`watchList_id`),
    CONSTRAINT `fk_watchLater_user_id`
    FOREIGN KEY (`user_user_id`) REFERENCES `user` (`user_id`)
    ON DELETE NO ACTION,
    CONSTRAINT `fk_watchLaterList_title_id`
    FOREIGN KEY (`title_title_id`) REFERENCES `title` (`title_id`)    
);

-- Liked List
CREATE TABLE IF NOT EXISTS `likedList` (
	`like_id` VARCHAR(255) NOT NULL,
    `user_user_id` VARCHAR(255) NOT NULL,
    `title_title_id` VARCHAR(255) NOT NULL,
    `like_timestamp` DATE NULL,
    PRIMARY KEY (`like_id`),
    CONSTRAINT `fk_likedList_user_id`
    FOREIGN KEY (`user_user_id`) REFERENCES `user` (`user_id`)
    ON DELETE NO ACTION,
    CONSTRAINT `fk_likedList_title_id`
    FOREIGN KEY (`title_title_id`) REFERENCES `title` (`title_id`)
);

-- Disliked List
CREATE TABLE IF NOT EXISTS `dislikedList` (
	`dislike_id` VARCHAR(255) NOT NULL,
    `user_user_id` VARCHAR(255) NOT NULL,
    `title_title_id` VARCHAR(255) NOT NULL,
    `like_timestamp` DATE NULL,
    PRIMARY KEY (`dislike_id`),
    CONSTRAINT `fk_dislikedList_user_id`
    FOREIGN KEY (`user_user_id`) REFERENCES `user` (`user_id`)
    ON DELETE NO ACTION,
    CONSTRAINT `fk_dislikedList_title_id`
    FOREIGN KEY (`title_title_id`) REFERENCES `title` (`title_id`)
);