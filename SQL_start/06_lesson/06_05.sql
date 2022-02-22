-- Считаем сумму добавлений в друзья, постов и лайков для каждого пользователя. Тот у которого сумма трех столбцов максимальна - самый активный

SELECT user_id, firstname, lastname, gender,
(select count(*) from homework6.friend_request where 
(from_user_id = `profile`.user_id or to_user_id = `profile`.user_id) and `status` = 1) + 
(select count(*) FROM homework6.post where `post`.user_id = `profile`.user_id) +
(select count(*) from homework6.likes where `likes`.user_id = `profile`.user_id) as sum
from  homework6.profile order by sum desc;

