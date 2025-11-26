select * from newUsers order by firstName;

begin tran
update newUsers set password = 'hemlig' where firstname = 'Milla';

delete from newUsers where firstName like 'a%';
delete from newUsers where firstName like 'b%';

commit


rollback

