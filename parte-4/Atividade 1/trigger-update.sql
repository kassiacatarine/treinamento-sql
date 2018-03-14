USE treinamento;

-- TRIGGER INSERT INCREMENT

GO
IF OBJECT_ID ('Contents.TGR_Score_AU','TR') IS NOT NULL
    DROP TRIGGER Contents.TGR_Score_AU;
GO

CREATE TRIGGER Contents.TGR_Score_AU
ON Contents.courses_classes_activities_students
AFTER UPDATE AS
BEGIN
    DECLARE
    @ID_Class_Student  INT,
	@ID_Activity INT,
	@ID_Course_Class INT,
	@Date_Scheduled DATETIME,
    @Data_Delivary DATETIME,
    @Data_Delivary_Old DATETIME

    SELECT @Data_Delivary = delivary_date, @ID_Class_Student = id_course_class_student, @ID_Activity = id_activity FROM INSERTED
    SELECT @Data_Delivary_Old = delivary_date FROM DELETED
    
	SELECT @Date_Scheduled = scheduled_date, @ID_Course_Class = id_course_class FROM Contents.courses_classes_activities WHERE id_activity = @ID_Activity

    IF (UPDATE (delivary_date))
    BEGIN
        UPDATE Classes.courses_classes_students
        SET student_score = CASE
            WHEN @Data_Delivary_Old <= @Date_Scheduled AND @Data_Delivary > @Data_Delivary_Old AND @Data_Delivary > @Date_Scheduled THEN student_score - 2
            WHEN @Data_Delivary_Old > @Date_Scheduled AND @Data_Delivary <= @Data_Delivary_Old AND @Data_Delivary <= @Date_Scheduled THEN student_score + 2
        END
        WHERE id_course_class = @ID_Course_Class AND id_course_class_student = @ID_Class_Student
    END
END