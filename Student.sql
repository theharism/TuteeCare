
----STUDENT LOGIN PROCEDURE-----

create procedure StudentLogin @rollno char(8), @password varchar(20)
AS
BEGIN  
   if @rollno in (select Rollno from Student) 
begin
 if @password in (select [Password] from Student where [Student].Rollno = @rollno)
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

----STUDENT DASHBOARD PROCEDURE-----

create procedure StudentProfile @rollno char(8)
AS
BEGIN
select S.FullName,S.DOB,S.Rollno,S.Email,S.Gender,S.[Address]
from Student as S
where S.Rollno = @rollno
END

GO

----ADD COURSE-----

create procedure StudentAddCourse @rollno char(8), @courseID char(8)
AS
BEGIN
if EXISTS (select C.CourseName from Courses as C where C.CourseID = @courseID)
begin
if NOT EXISTS ( select E.CourseID from Enroll as E where E.Rollno = @rollno and E.CourseID = @courseID )
begin
INSERT INTO Enroll Values (@rollno,@courseID)
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


-----DROP COURSE-----

create procedure StudentDropCourse @rollno char(8), @courseID char(8)
AS
BEGIN
if EXISTS (select C.CourseName from Courses as C where C.CourseID = @courseID)
begin
    DELETE FROM Enroll
    where [Enroll].CourseID = @courseID AND [Enroll].Rollno = @rollno
	select 1
end
else
begin
select 0
end
END
GO

-----ATTENDANCE VIEW-----

create PROCEDURE AttendanceView @rollno char(8), @courseID char(8)
AS
BEGIN
    select A.[Date],A.[status]
    from Attendance as A
    where A.rollno = @rollno AND A.courseID = @courseID
END
GO

-----GRADEBOOK VIEW-----
create PROCEDURE GradeBookView @rollno char(8), @courseID char(8)
AS
BEGIN
    SELECT GB.Result
    from GradeBook as GB
    where GB.rollno = @rollno AND GB.courseID = @courseID
END
GO

-----View Enrolled-----
create procedure ViewEnrolled @CourseID char(8)
As
begin

select S.FullName,S.Rollno
from Student as S
where S.Rollno in (
    select E.Rollno
    from Enroll as E
    where E.CourseID = @CourseID )
end

-----Fees Status View-----


create PROCEDURE FeeStatusView @rollno char(8)
AS
BEGIN
    select F.[Status]
    from Fees as F
    where F.rollno = @rollno
END
GO

GO

-----Announcements-----

create PROCEDURE AnnouncementsView  
AS
BEGIN
    SELECT A.[Date], A.[message]
    from Announcements as A
    ORDER BY A.[Date] DESC
END
GO

GO

-----Registered Courses-----


create PROCEDURE RegisteredCoursesView @rollno char(8)
AS
BEGIN
    select C.CourseName, C.courseID, C.credithours
    from Courses as C       
    where C.courseID IN (select E.CourseID
                        from Enroll as E
                        where E.rollno = @rollno)
END
GO

GO

----Student Profile EDIT PROCEDURE-----

create procedure StudentProfileEdit @rollno char(8),@oldpassword char(8), @newpassword char(8)
AS
BEGIN
    if @oldpassword IN (select S.[Password] from Student as S where S.Rollno = @rollno)
  begin
   select 1
   update Student
  set Student.[Password] = @newpassword
  where Student.rollno  = @rollno
  end
  else select 0
END
GO

GO