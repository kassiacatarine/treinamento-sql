CREATE DATABASE treinamento;

USE treinamento;

-- schema Persons

-- CREATE SCHEMA Persons;

IF (NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Persons')) 
BEGIN
    EXEC ('CREATE SCHEMA [Persons] AUTHORIZATION [dbo]')
END

CREATE TABLE Persons.users_types(
    id_user_type INT NOT NULL IDENTITY PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    removed INT NOT NULL DEFAULT(0)
);

CREATE TABLE Persons.Users(
    id_user INT NOT NULL IDENTITY PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    removed INT NOT NULL DEFAULT(0),
	id_user_type INT NOT NULL,
    CONSTRAINT fk_Users_users_types FOREIGN KEY(id_user_type) REFERENCES Persons.users_types (id_user_type)
);

CREATE TABLE Persons.users_logins(
    id_user_login INT NOT NULL IDENTITY PRIMARY KEY,
    id_user INT NOT NULL,
    CONSTRAINT fk_users_logins_Users FOREIGN KEY(id_user) REFERENCES Persons.Users (id_user),
    date DATETIME NOT NULL
);

-- Schema Courses

-- CREATE SCHEMA Courses;

IF (NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Courses')) 
BEGIN
    EXEC ('CREATE SCHEMA [Courses] AUTHORIZATION [dbo]')
END

CREATE TABLE Courses.Courses(
    id_course INT NOT NULL IDENTITY PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    removed INT NOT NULL DEFAULT(0)
);

CREATE TABLE Courses.Tutors(
    id_course_tutor INT NOT NULL IDENTITY PRIMARY KEY,
    id_course INT NOT NULL,
    CONSTRAINT fk_Tutors_Courses FOREIGN KEY(id_course) REFERENCES Courses.Courses (id_course),
    id_user INT NOT NULL,
    CONSTRAINT fk_Tutors_Users FOREIGN KEY(id_user) REFERENCES Persons.Users (id_user)
);

-- Schema Classes

-- CREATE SCHEMA Classes;

IF (NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Classes')) 
BEGIN
    EXEC ('CREATE SCHEMA [Classes] AUTHORIZATION [dbo]')
END

CREATE TABLE Classes.courses_classes(
    id_course_class INT NOT NULL IDENTITY PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    removed INT NOT NULL DEFAULT(0),
    id_course INT NOT NULL,
    CONSTRAINT fk_courses_classes_Courses FOREIGN KEY(id_course) REFERENCES Courses.Courses (id_course)
);

CREATE TABLE Classes.courses_classes_schedule(
    id_schedule INT NOT NULL IDENTITY PRIMARY KEY,
    id_course_class INT NOT NULL,
    CONSTRAINT fk_courses_classes_schedule_courses_classes FOREIGN KEY(id_course_class) REFERENCES Classes.courses_classes (id_course_class),
    date DATETIME NOT NULL,
    date_finish DATETIME NOT NULL,
    removed INT NOT NULL DEFAULT(0) 
);

CREATE TABLE Classes.courses_classes_contents(
    id_course_class_contents INT NOT NULL IDENTITY PRIMARY KEY,
    removed INT NOT NULL DEFAULT(0),
    description NVARCHAR(MAX) NOT NULL,
    id_course_class INT NOT NULL,
    CONSTRAINT fk_courses_classes_contents_courses_classes FOREIGN KEY(id_course_class) REFERENCES Classes.courses_classes (id_course_class)
);

CREATE TABLE Classes.courses_classes_tutors(
    id_course_class_tutor INT NOT NULL IDENTITY PRIMARY KEY,
    id_course_class INT NOT NULL,
    CONSTRAINT fk_courses_classes_tutors_courses_classes FOREIGN KEY(id_course_class) REFERENCES Classes.courses_classes (id_course_class),
    id_course_tutor INT NOT NULL,
    CONSTRAINT fk_courses_classes_tutors_Tutors FOREIGN KEY(id_course_tutor) REFERENCES Courses.Tutors (id_course_tutor),
    removed INT NOT NULL DEFAULT(0)
);

CREATE TABLE Classes.courses_classes_students(
    id_course_class_student INT NOT NULL IDENTITY PRIMARY KEY,
    id_course_class INT NOT NULL,
    CONSTRAINT fk_courses_classes_students_courses_classes FOREIGN KEY (id_course_class) REFERENCES Classes.courses_classes (id_course_class),
    id_user INT NOT NULL,
    CONSTRAINT fk_courses_classes_students_Users FOREIGN KEY (id_user) REFERENCES Persons.Users (id_user),
    removed INT NOT NULL DEFAULT(0),
);

-- Schema Contents

-- CREATE SCHEMA Contents;

IF (NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Contents')) 
BEGIN
    EXEC ('CREATE SCHEMA [Contents] AUTHORIZATION [dbo]')
END

CREATE TABLE Contents.courses_classes_activities(
    id_activity INT NOT NULL IDENTITY PRIMARY KEY,
    id_course_class INT NOT NULL,
    CONSTRAINT fk_courses_classes_activities_courses_classes FOREIGN KEY (id_course_class) REFERENCES Classes.courses_classes (id_course_class),
    removed INT NOT NULL DEFAULT(0),
    description NVARCHAR(MAX) NOT NULL,
    scheduled_date DATETIME NOT NULL
);

CREATE TABLE Contents.courses_classes_assessements(
    id_assessement INT NOT NULL IDENTITY PRIMARY KEY,
    id_course_class INT NOT NULL,
    CONSTRAINT fk_courses_classes_assessements_courses_classes  FOREIGN KEY (id_course_class) REFERENCES Classes.courses_classes (id_course_class),
    removed INT NOT NULL DEFAULT(0),
    scheduled_date DATETIME NOT NULL,
    realization_date DATETIME,
    description NVARCHAR(MAX) NOT NULL,
);

CREATE TABLE Contents.assessements_students(
    id_assessement_student INT NOT NULL IDENTITY PRIMARY KEY,
    id_course_class_student INT NOT NULL,
    CONSTRAINT fk_assessements_students_courses_classes_students FOREIGN KEY(id_course_class_student) REFERENCES Classes.courses_classes_students (id_course_class_student),
    id_assessement INT NOT NULL,
    CONSTRAINT fk_assessements_students_courses_classes_assessements FOREIGN KEY(id_assessement) REFERENCES Contents.courses_classes_assessements (id_assessement),
    note DECIMAL(5,1) NOT NULL,
    removed INT NOT NULL DEFAULT(0)
);

CREATE TABLE Contents.courses_classes_activities_students(
    id_activity_class_studenty INT NOT NULL IDENTITY PRIMARY KEY,
    id_activity INT NOT NULL,
    CONSTRAINT fk_courses_classes_activities_students_courses_classes_activities FOREIGN KEY (id_activity) REFERENCES Contents.courses_classes_activities (id_activity),
    id_course_class_student INT NOT NULL,
    CONSTRAINT fk_courses_classes_activities_students_courses_classes_students FOREIGN KEY(id_course_class_student) REFERENCES Classes.courses_classes_students (id_course_class_student),
    removed INT NOT NULL DEFAULT(0),
    delivary_date DATETIME NOT NULL
);