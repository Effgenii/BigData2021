select avg ((unix_timestamp(now()) - unix_timestamp(birthday_at)) / 31536000) as avg_age FROM homework3.users;

-- еще можно было делать через timestampdiff(YEAR, birthday_at, now())