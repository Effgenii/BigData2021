SELECT dayofweek(birthday_at), count(*) FROM homework3.users group by dayofweek(birthday_at);