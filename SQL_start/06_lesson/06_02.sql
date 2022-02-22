select to_user_id, count(*) from homework6.message where from_user_id = 12 group by to_user_id order by count(*) desc;

-- первая строчка - пользователь, которому заданный пользователь (user_id = 12) написал больше всего сообщений