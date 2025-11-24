

declare @name nvarchar(MAX) = 'Melvin';
declare @email nvarchar(MAX);

print @name;

set @name = 'Sebbe';

print @name;

set @name = (select top 1 FirstName from users order by FirstName);

print @name;

--Glöm inte top 1, annars hämtar den alla rader och skriver @name och @email så många gånger.
select top 1 @name = FirstName, @email = Email from users;

print concat(@name, ' - ', @email);

-- ... Eventuellt kan man använda += som ett trick för att konkatenera alla.
select @name += FirstName from Users;

print @name;

set @name = 'My';
select @email = email from users where FirstName = @name;

print '----';
print @email;