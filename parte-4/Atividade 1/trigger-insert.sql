USE treinamento;

-- TRIGGER INSERT INCREMENT

GO
IF OBJECT_ID ('Contents.TGR_Score_AI','TR') IS NOT NULL
    DROP TRIGGER Contents.TGR_Score_AI;
GO

CREATE TRIGGER Contents.TGR_Score_AI
ON Contents.courses_classes_activities_students
AFTER INSERT AS
BEGIN
    DECLARE
    @ID_Class_Student  INT,
	@ID_Activity INT,
	@ID_Course_Class INT,
	@Date_Scheduled DATETIME,
    @Data_Delivary DATETIME

    SELECT @Data_Delivary = delivary_date, @ID_Class_Student = id_course_class_student, @ID_Activity = id_activity FROM INSERTED

	SELECT @Date_Scheduled = scheduled_date, @ID_Course_Class = id_course_class FROM Contents.courses_classes_activities WHERE id_activity = @ID_Activity

	UPDATE Classes.courses_classes_students
	SET student_score = CASE
		WHEN @Data_Delivary <= @Date_Scheduled THEN student_score + 1
		WHEN @Data_Delivary > @Date_Scheduled THEN student_score - 1
	END
	WHERE id_course_class = @ID_Course_Class AND id_course_class_student = @ID_Class_Student

END