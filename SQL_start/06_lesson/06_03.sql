select sum(sended_message)
from (select *, TIMESTAMPDIFF(YEAR, birthday, NOW()) as age,  
(select count(*) from message where message.to_user_id = profile.user_id) as sended_message
FROM profile order by age limit 10) t;

