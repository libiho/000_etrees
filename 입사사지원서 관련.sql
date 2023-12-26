insert into recruit (seq, name, phone) VALUES (SEQ_RECRUIT.NEXTVAL,'이루다','01022227777'); 

update recruit
set submit = 'login'
where name = '이루다';

select * from recruit;

select
count(name)
from recruit
where submit = 'login'
and name = '이루다';