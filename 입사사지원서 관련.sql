insert into recruit (seq, name, phone) VALUES (SEQ_RECRUIT.NEXTVAL,'이루다','01022227777'); 

insert into recruit (seq, name, phone) VALUES (SEQ_RECRUIT.NEXTVAL,'이하나','01011115555'); 


update recruit
set submit = 'save'
where name = '이루다';

select * from recruit;

select
count(name)
from recruit
where submit = 'login'
and name = '이루다';



select
count(name)
from recruit
WHERE name = '이하나'
and submit is null
;