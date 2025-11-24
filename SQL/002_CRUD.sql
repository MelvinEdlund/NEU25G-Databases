
--insert into Students values ( 1, 'Mel', 'EDlu');
--insert into Students values ( 2, 'HUgo', 'Kindefors');
--insert into Students values ( 3, 'SEb', 'Brek');
--insert into Students values ( 4, 'vendy', 'Cat');

select * from Students;

--DROP TABLE IF EXISTS newStudents;

--select 
--	id, 
--	firstName + ' ' + lastName as 'Name' 
--into 
--	newStudents 
--from 
--	Students 
--where 
--	id < 7;

select * from newStudents;

--insert into newStudents (id, name)
--select id, firstName from Students where id > 8;