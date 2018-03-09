SELECT u.id_user, u.name, ca.description, ca.scheduled_date, cas.delivary_date FROM Persons.Users u
INNER JOIN Classes.courses_classes_students cs ON cs.id_user = u.id_user
INNER JOIN Contents.courses_classes_activities ca ON ca.id_course_class = cs.id_course_class
INNER JOIN Contents.courses_classes_activities_students cas ON cas.id_course_class_student = cs.id_course_class_student
WHERE u.id_user_type = 2 and CAST(cas.delivary_date as DATE) = CAST(ca.scheduled_date as DATE);

SELECT u.id_user, u.name, ca.description, ca.scheduled_date, cas.delivary_date FROM Persons.Users u
INNER JOIN Classes.courses_classes_students cs ON cs.id_user = u.id_user
INNER JOIN Contents.courses_classes_activities ca ON ca.id_course_class = cs.id_course_class
INNER JOIN Contents.courses_classes_activities_students cas ON cas.id_course_class_student = cs.id_course_class_student
WHERE u.id_user_type = 2 and CAST(cas.delivary_date as DATE) > CAST(ca.scheduled_date as DATE);

SELECT u.id_user, u.name, ca.description, ca.scheduled_date, cas.delivary_date FROM Persons.Users u
INNER JOIN Classes.courses_classes_students cs ON cs.id_user = u.id_user
INNER JOIN Contents.courses_classes_activities ca ON ca.id_course_class = cs.id_course_class
INNER JOIN Contents.courses_classes_activities_students cas ON cas.id_course_class_student = cs.id_course_class_student
WHERE u.id_user_type = 2 and CAST(cas.delivary_date as DATE) < CAST(ca.scheduled_date as DATE);