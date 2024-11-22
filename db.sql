
create database crudApp;

use crudApp;

CREATE TABLE student (
  studentId int(5) NOT NULL AUTO_INCREMENT,
  firstName varchar(25) DEFAULT NULL,
  lastName varchar(25) DEFAULT NULL,
  course varchar(15) DEFAULT NULL,
  year int(2) DEFAULT NULL,
 PRIMARY KEY (studentId));

CREATE TABLE student (
    studentId int NOT NULL AUTO_INCREMENT,
    firstName varchar(25) DEFAULT NULL,
    lastName varchar(25) DEFAULT NULL,
    course varchar(15) DEFAULT NULL,
    year int DEFAULT NULL,
    PRIMARY KEY (studentId)
);
