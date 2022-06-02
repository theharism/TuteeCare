
----TEACHER LOGIN PROCEDURE-----

create procedure TeacherLogin @TeacherID char(8) , @password varchar(20)
AS
BEGIN
    if @TeacherID in (select T.TeacherID from Teacher as T) 
begin
 if @password in (select [Password] from Teacher where [Teacher].TeacherID = @TeacherID)
  begin
   select 1
  end
 else
  begin
   select -1 
  end
end
else
begin
select -2
end
END
GO

GO

----Teacher DASHBOARD PROCEDURE-----

create procedure TeacherProfile @TeacherID char(8)
AS
BEGIN
    select  T.FullName,T.DOB,T.TeacherID,T.Email,T.Gender,T.[Address]
    from Teacher as T
    where T.TeacherID = @TeacherID
END
GO
EXEC TeacherProfile @teacherID = ''

GO

-----Teacher OPT COURSE-----

create PROCEDURE TeacherOptCourse @TeacherID char(8), @CourseID char(8)
AS
BEGIN
if EXISTS (select C.CourseName from Courses as C where C.CourseID = @courseID)
begin
if NOT EXISTS ( select TC.CourseID from TeacherCourse as TC where TC.TeacherID = @TeacherID and TC.CourseID = @courseID )
begin
 INSERT INTO TeacherCourse VALUES (@TeacherID,@CourseID)
select 1
end
else 
begin
select 0
end
end
else 
begin
select -1
end
END
GO

GO

-----Teacher Drop Course COURSE-----

create PROCEDURE TeacherDropCourse @TeacherID char(8), @CourseID char(8)
AS
BEGIN
    if EXISTS (select C.CourseName from Courses as C where C.CourseID = @courseID)
begin
    Delete FROM TeacherCourse
    where [TeacherCourse].TeacherID = @TeacherID AND [TeacherCourse].CourseID = @CourseID
	select 1
end
else
begin
select 0
end
END
GO

GO

-----AddAnnouncement-----

create procedure AddAnnouncement @message varchar(1000)
AS
BEGIN
    if(len(@message) < 1000)
	begin
	select 1
	 INSERT INTO Announcements VALUES (@message,getdate())
	end
    else
	begin
	 select 0
	end
END
GO

GO

-----Add Attendance-----

create PROCEDURE AddAttendance @rollno char(8), @courseID char(8), @status char(1)
AS
BEGIN
    INSERT INTO Attendance Values (@rollno,@courseID,getdate() ,@status)
END
GO
EXEC AddAttendance @TeacherID = '', @coursename = '', @attdate = '', @status = '', @session = ''

GO
drop table GradeBook
-----Add Grades-----

create PROCEDURE AddGrades @rollno char(8), @courseID char(8), @result VARChar(2), @examtype VARCHAR(10) 
AS
BEGIN
    INSERT INTO GradeBook VALUES (@rollno,@CourseID,@result)
END
GO
EXEC AddGrades @TeacherID = '', @coursename = '',@result = '', @session = '', @examtype = ''

GO


-----Registered Courses-----


create PROCEDURE TeacherRegisteredCoursesView @TeacherID char(8)
AS
BEGIN
    select C.CourseName, C.courseID, C.credithours
    from Courses as C       
    where C.courseID IN (select TC.CourseID
                        from TeacherCourse as TC
                        where TC.TeacherID = @TeacherID)
END
GO
EXEC RegisteredCoursesView @rollno = '20L-1099'

GO

----Teacher Profile Edit PROCEDURE-----

create procedure TeacherProfileEdit @TeacherID char(8),@oldpassword char(8), @newpassword char(8)
AS
BEGIN
if @oldpassword IN (select T.[Password] from Teacher as T where T.TeacherID = @TeacherID)
  begin
   select 1
   update Teacher
  set Teacher.[Password] = @newpassword
  where Teacher.TeacherID  = @TeacherID
  end
  else select 0
END
GO
EXEC TeacherProfileEdit @teacherID = '',@oldpassword = '', @newpassword = '' 

GO