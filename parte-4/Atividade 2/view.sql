USE treinamento;

IF OBJECT_ID ('detail_course_view', 'V') IS NOT NULL
    DROP VIEW detail_course_view;
GO
CREATE VIEW detail_course_view AS 
SELECT 
    c.name NomeCurso, u.name as NomeTutorsCurso, cc.name NomeClasse
FROM Classes.courses_classes cc, Persons.Users u, Classes.courses_classes_tutors ct, Courses.Courses c
JOIN Courses.Tutors AS t ON c.id_course = t.id_course
WHERE 
	t.id_user = u.id_user AND 
	cc.id_course = c.id_course AND 
	ct.id_course_tutor = t.id_course_tutor AND
	ct.id_course_class = cc.id_course_class;