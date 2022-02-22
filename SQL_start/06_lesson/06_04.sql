SELECT 
(select `gender` from profile where profile. user_id = likes.user_id) as gender,
count(*)
FROM homework6.likes
group by gender;