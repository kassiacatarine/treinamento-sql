USE [treinamento]
GO

-- ADD USERS_TYPES
INSERT INTO Persons.users_types
           ([name],[removed])
     VALUES
           ('Tutor', 0), 
		   ('Aluno', 0);


-- ADD USERS
INSERT INTO Persons.Users([name],[removed],[id_user_type]) 
	VALUES
		('Porter',1,2),
		('Seth',0,2),
		('Tatyana',0,2),
		('May',0,2),
		('Eric',1,1),
		('Uta',0,1),
		('Latifah',0,1),
		('Herman',1,2),
		('Dorian',0,1),
		('Iola',0,1);


-- ADD COURSES
INSERT INTO Courses.Courses
           ([name],[removed])
     VALUES
           ('Manjar dos Paranaue', 0), 
		   ('Adoração a arvore 1', 0),
		   ('Adoração a arvore 2', 0);


-- ADD COURSES_CLASSES
INSERT INTO Classes.courses_classes
		([name],[removed],[id_course]) 
	VALUES
		('IF29C',0,3),
		('EC62P',0,1),
		('AB86E',0,2),
		('EC62P',1,3);


-- ADD COURSES_CLASSES_STUDENTS
INSERT INTO Classes.courses_classes_students
		([id_course_class], [id_user], [removed])
	VALUES
		(1, 2, 0),
		(2, 3, 0),
		(3, 4, 1),
		(2, 5, 0),
		(1, 4, 0),
		(2, 9, 0);


-- ADD TUTORS
INSERT INTO Courses.Tutors
		([id_course], [id_user])
	VALUES
		(1, 6),
		(1, 7),
		(1, 8),
		(2, 10),
		(3, 11),
		(3, 10);


-- ADD COURSE_CLASSES_TUTORS
INSERT INTO Classes.courses_classes_tutors
		([id_course_class], [id_course_tutor], [removed])
	VALUES
		(2, 1, 0),
		(2, 2, 0),
		(2, 3, 1),
		(3, 4, 0),
		(1, 5, 0),
		(4, 6, 1);



-- ADD COURSES_CLASSES_CONTENTS
INSERT INTO Classes.courses_classes_contents
		([removed], [description], [id_course_class])
	VALUES
		(0, 'A sabedoria abençoada pela natureza', 2),
		(0, 'A natureza acima de tudo', 3),
		(0, 'Estudo aprofundado sobre a natureza e os significados da arvore', 1);


-- ADD COURSES_CLASSES_ACTIVITIES
INSERT INTO Contents.courses_classes_activities
		([id_course_class], [removed], [description], [scheduled_date])
	VALUES
		(1, 0, 'Seminário', GETDATE()),
		(2, 1, 'Prova', GETDATE()),
		(3, 0, 'APS', GETDATE()),
		(3, 1, 'Lista', GETDATE());


-- ADD COURSES_ACTIVITIES_STUDENTS
INSERT INTO Contents.courses_classes_activities_students
		([id_activity], [id_course_class_student], [removed], [delivary_date])
	VALUES
		(1, 1, 0, GETDATE()),
		(1, 5, 0, GETDATE()),
		(2, 2, 0, GETDATE()),
		(2, 4, 0, GETDATE()),
		(2, 6, 0, GETDATE()),
		(3, 3, 0, GETDATE());


