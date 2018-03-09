ALTER TABLE Classes.courses_classes_students ADD student_score INT NOT NULL DEFAULT(0);

UPDATE cs
SET student_score = student_score + 1
FROM Classes.courses_classes_students cs
INNER JOIN Contents.courses_classes_activities ca ON ca.id_course_class = cs.id_course_class
INNER JOIN Contents.courses_classes_activities_students cas ON cas.id_course_class_student = cs.id_course_class_student
WHERE CAST(cas.delivary_date as DATE) <= CAST(ca.scheduled_date as DATE);

UPDATE cs
SET student_score = student_score - 1
FROM Classes.courses_classes_students cs
INNER JOIN Contents.courses_classes_activities ca ON ca.id_course_class = cs.id_course_class
INNER JOIN Contents.courses_classes_activities_students cas ON cas.id_course_class_student = cs.id_course_class_student
WHERE CAST(cas.delivary_date as DATE) > CAST(ca.scheduled_date as DATE);

SELECT * FROM Classes.courses_classes_students cs
INNER JOIN Contents.courses_classes_activities ca ON ca.id_course_class = cs.id_course_class
INNER JOIN Contents.courses_classes_activities_students cas ON cas.id_course_class_student = cs.id_course_class_student
WHERE CAST(cas.delivary_date as DATE) = CAST(ca.scheduled_date as DATE);
GO