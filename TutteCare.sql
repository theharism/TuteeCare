use master
GO

CREATE DATABASE TuteeCare
GO

USE TuteeCare
GO

CREATE TABLE Student
(
FullName varchar(30) NOT NULL,	
DOB	date NOT NULL,
Rollno char(8) primary key,	
Email varchar(30) UNIQUE NOT NULL,	
Gender char(1) NOT NULL,
Phoneno char(11) NOT NULL,
[Address] varchar(100) NOT NULL,
[Password] varchar (20) NOT NULL 
)

go

create table Teacher
(
FullName varchar(30) NOT NULL,	
DOB	date NOT NULL,
TeacherID char(8) primary key,	
Email varchar(30) UNIQUE NOT NULL,	
Gender char(1) NOT NULL,
Phoneno char(11) NOT NULL,
[Address] varchar(100) NOT NULL,
[Availability] char(1) NOT NULL, 
[Password] varchar (20) NOT NULL
)

go

create table [Admin]
(
FullName varchar(30) NOT NULL,	
DOB	date NOT NULL,
ADMINID char(8) primary key,	
Email varchar(20) UNIQUE NOT NULL,	
Gender char(1) NOT NULL,
[Address] varchar(100) NOT NULL,
[Password] varchar (20) NOT NULL
)

go

create table Courses
(
CourseName varchar(50) NOT NULL,
CourseID char(8) primary key,
CreditHours char(1) NOT NULL
)

go

create table TeacherCourse
(
TeacherID char(8) foreign key references Teacher(TeacherID)
ON UPDATE CASCADE ON DELETE CASCADE,
CourseID char(8) foreign key references Courses(CourseID)
ON UPDATE CASCADE ON DELETE CASCADE,
primary key (TeacherID,CourseID)
)

go

create table Enroll
(
Rollno char(8) foreign key references Student(Rollno)
ON UPDATE CASCADE ON DELETE CASCADE,
CourseID char(8) foreign key references Courses(CourseID)
ON UPDATE CASCADE ON DELETE CASCADE
primary key (Rollno,CourseID)
)

go

create table Attendance
(
Rollno char(8) foreign key references Student(Rollno)
ON UPDATE CASCADE ON DELETE CASCADE,
CourseID char(8) foreign key references Courses(CourseID)
ON UPDATE CASCADE ON DELETE CASCADE,
[Date] datetime  NOT NULL,
[Status] char(1)  NOT NULL Default 'A'
primary key ([Date],CourseID)
)

go

create table GradeBook
(
Rollno char(8) foreign key references Student(Rollno)
ON UPDATE CASCADE ON DELETE CASCADE,
CourseID char(8) foreign key references Courses(CourseID)
ON UPDATE CASCADE ON DELETE CASCADE,
Result	char(1)  NOT NULL
)

insert into Gradebook values ('20L-1099','87654321','A','Quiz')


go

create table Fees
(
Rollno char(8) foreign key references Student(Rollno)
ON UPDATE CASCADE ON DELETE CASCADE,
[Session] varchar(50) foreign key references sessiontable([description])
ON UPDATE CASCADE ON DELETE CASCADE,	
[Status] varchar(10) NOT NULL
primary key (Rollno,[Session])
)

go


create table Announcements
(
 [message] varchar(1000),
 [Date] datetime
 primary key ([message],[Date])
)

go
