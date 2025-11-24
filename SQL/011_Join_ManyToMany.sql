
--drop table Students;
--drop table Courses;

--create table Students
--(
--	Id int,
--	Name nvarchar(max)
--)

--insert into Students values(1, 'Anders');
--insert into Students values(2, 'Johan');
--insert into Students values(3, 'Emma');
--insert into Students values(4, 'Johanna');
--insert into Students values(5, 'Melvin');
--insert into Students values(6, 'Sebbe');
--insert into Students values(7, 'Hugo');

--create table Courses
--(
--	Id int,
--	Name nvarchar(max)
--)

--insert into Courses values(1, 'C#');
--insert into Courses values(2, 'Databaser');
--insert into Courses values(3, 'Webutveckling');
--insert into Courses values(4, 'Javascript');
--insert into Courses values(5, 'Java');
--insert into Courses values(6, 'SQL');

--create table StudentsCourses
--(
--	StudentId int,
--	CourseId int,
--)

--insert into StudentsCourses values (1, 1);
--insert into StudentsCourses values (1, 3);
--insert into StudentsCourses values (1, 5);
--insert into StudentsCourses values (2, 1);
--insert into StudentsCourses values (3, 2);
--insert into StudentsCourses values (3, 3);
--insert into StudentsCourses values (4, 1);
--insert into StudentsCourses values (4, 2);
--insert into StudentsCourses values (4, 3);
--insert into StudentsCourses values (4, 6);
--insert into StudentsCourses values (5, 2);
--insert into StudentsCourses values (5, 4);
--insert into StudentsCourses values (6, 4);
--insert into StudentsCourses values (6, 5);

/*
select * from Students;
select * from Courses;
select * from StudentsCourses;
*/

select 
	c.Name as 'Courses',
	string_agg(s.Name, ', ') as 'Courses'
from 
	Students s
	join StudentsCourses sc on s.Id = sc.StudentId
	join Courses c on c.Id = sc.CourseId
group by
	c.Name


