select *  FROM Contents.courses_classes_activities_students WHERE id_activity = 1

select * FROM Contents.courses_classes_activities WHERE id_activity = 1

select * from Classes.courses_classes_students where id_course_class = 1 and id_course_class_student = 1

select * from Classes.courses_classes_students


insert into Classes.courses_classes_students (id_course_class, id_user) values (1, 3);
insert into Contents.courses_classes_activities_students (id_activity, id_course_class_student, delivary_date) values (1, 7, '2018-02-10');
delete from Contents.courses_classes_activities_students where id_activity_class_studenty = 7
insert into Contents.courses_classes_activities_students (id_activity, id_course_class_student, delivary_date) values (1, 7, '2018-05-10');
delete from Contents.courses_classes_activities_students where id_activity_class_studenty = 8

update Contents.courses_classes_activities_students set delivary_date = '2018-02-10' where id_activity_class_studenty = 1;