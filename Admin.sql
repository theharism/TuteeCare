

----ADMIN LOGIN PROCEDURE-----

create procedure AdminLogin @AdminID char(8) , @password varchar(20)
AS
BEGIN
if @AdminID in (select ADMINID from [Admin] ) 
begin
 if @password in (select [Password] from [Admin] where [Admin].ADMINID = @AdminID)
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

----Admin DASHBOARD PROCEDURE-----
create procedure AdminProfile @AdminID char(8)
AS
BEGIN
select A.FullName,A.DOB,A.ADMINID,A.Email,A.Gender,A.[Address]
from [Admin] as A
where A.ADMINID = @AdminID
END
GO


----Admin Profile Edit PROCEDURE-----

create procedure AdminProfileEdit @AdminID char(8),@oldpassword varchar(20), @newpassword varchar(20)
AS
BEGIN
  if @oldpassword IN (select A.[Password] from [Admin] as A where A.ADMINID = @AdminID)
  begin
   select 1
   update [Admin]
  set [Admin].[Password] = @newpassword
  where [Admin].ADMINID  = @AdminID
  end
  else select 0
END
go

GO

-----------ADD STUDENT----------

create procedure addstudent @FullName varchar(30), @DOB date,@Rollno char(8),@Email varchar(30),@Gender char(1),@Phoneno char(11),@Address varchar(100),@Password varchar (20)  
as
BEGIN
if NOT exists(select rollno from Student where rollno=@rollno)
    begin
	    if Not Exists (select email from Student where email=@Email)
		begin
	    select 1
        insert into Student values(@FUllName,@DOB,@Rollno,@Email,@Gender,@Phoneno,@Address,@Password)
		insert into Fees values(@Rollno,'Spring 2022','UnPaid')
		end
		else select 0
    end
	else select -1
END

GO
----------------------ADD TEACHER-------------
create procedure addteacher
@FullName varchar(30), 
@DOB	date, 
@TeacherID char(8), 
@Email varchar(30),
@Gender char(1),
@Phoneno char(11),
@Address varchar(100), 
@Availability char(1),
@Password varchar (20)
as
BEGIN
if NOT exists(select TeacherID from Teacher where TeacherID=@TeacherID)
    begin
	    if Not Exists (select email from Teacher where email=@Email)
		begin
	    select 1
        insert into Teacher values(@FUllName,@DOB,@TeacherID,@Email,@Gender,@Phoneno,@Address,@Availability,@Password)
		end
		else select 0
    end
	else select -1
end


GO

-------------------ADD COURSE---------------

create procedure addcourse
@CourseName varchar(50), 
@CourseID char(8), 
@CreditHours char(1)
as
BEGIN
if not exists(select Courseid from Courses where courseid=@CourseID)
begin
 if not exists(select CourseName from Courses where CourseName=@CourseName)
 begin
 insert into Courses values(@CourseName,@CourseID,@CreditHours)
 select 1
 end
 else
  begin
  select 0
  end
end
else
BEGIN
select -1
end
end
GO

GO

--------------DROP STUDENT---------------
create procedure dropstudent
@rollno char(8)
as
BEGIN
if exists(select rollno from student where rollno= @rollno)
BEGIN
select 1
delete from Student where rollno=@rollno
end
else
begin
select 0
end
end
GO

GO

--------------------DROP TEACHER-------------------
create procedure dropteacher
@teacherid char(8)
as
BEGIN
if exists(select teacherid from Teacher where teacherid=@teacherid)
BEGIN
select 1
delete from Teacher where teacherid=@teacherid
end
else
begin
select 0
end
end
GO

GO

--------------DROP COURSE-----------------

create procedure dropcourse
@courseid char(8)
as
BEGIN
if exists(select courseid from Courses where @courseid=courseid)
BEGIN
select 1
delete from Courses where courseid=@courseid
end
else
begin
select 0
end
end
GO

----------------UPDATE FEES---------------------

create procedure updatefees
@rollno char(8),
@status varchar(10) output
as
BEGIN
if exists(select rollno from fees where rollno=@rollno)
begin
    select 1
    update Fees
    set Fees.[status] = @Status
    where Fees.rollno = @rollno
END
ELSE
BEGIN
select 0
END
END
GO


-------------Edit Student--------
create procedure EditStudent @FullName varchar(30), @DOB date,@Rollno char(8),@Gender char(1),@Phoneno char(11),@Address varchar(100),@Password varchar (20)  
as
begin

if(@FullName != '')
begin
select 1
update Student
set [Student].FullName = @FullName
where [Student].Rollno=@Rollno
end

if(@DOB != '')
begin
select 1
update Student
set [Student].DOB = @DOB
where [Student].Rollno=@Rollno
end

if(@Gender != '')
begin
select 1
update Student
set [Student].Gender = @Gender
where [Student].Rollno=@Rollno
end

if(@Phoneno != '')
begin
select 1
update Student
set [Student].Phoneno = @Phoneno
where [Student].Rollno=@Rollno
end

if(@Address != '')
begin
select 1
update Student
set [Student].Address = @Address
where [Student].Rollno=@Rollno
end

if(@Password != '')
begin
select 1
update Student
set [Student].Password = @Password
where [Student].Rollno=@Rollno
end

end
GO

-------------Edit Teacher--------

create procedure EditTeacher @FullName varchar(30), @DOB date,@TeacherID char(8),@Gender char(1),@Phoneno char(11),@Address varchar(100),@Password varchar (20),@Availability char(1)  
as
begin

if(@FullName != '')
begin
select 1
update Teacher
set [Teacher].FullName = @FullName
where [Teacher].TeacherID=@TeacherID
end

if(@DOB != '')
begin
select 1
update Teacher
set [Teacher].DOB = @DOB
where [Teacher].TeacherID=@TeacherID
end

if(@Gender != '')
begin
select 1
update Teacher
set [Teacher].Gender = @Gender
where [Teacher].TeacherID=@TeacherID
end

if(@Phoneno != '')
begin
select 1
update Teacher
set [Teacher].Phoneno = @Phoneno
where [Teacher].TeacherID=@TeacherID
end

if(@Address != '')
begin
select 1
update Teacher
set [Teacher].Address = @Address
where [Teacher].TeacherID=@TeacherID
end

if(@Password != '')
begin
select 1
update Teacher
set [Teacher].Password = @Password
where [Teacher].TeacherID=@TeacherID
end

end
GO

----------Edit Course--------------

create procedure EditCourse
@CourseName varchar(50), 
@CourseID char(8), 
@CreditHours char(1)
as
BEGIN

if(@CourseName != '')
begin
 select 1
 update Courses
 set [Courses].CourseName = @CourseName
 where [Courses].CourseID = @CourseID
end

if(@CreditHours != '')
begin
 select 1
 update Courses
 set [Courses].CreditHours = @CreditHours
 where [Courses].CourseID = @CourseID
end

end
GO
