use vk_test;

-- ��������� ������
-- 1. ����������� ������� ������� �������������.
select avg((TIMESTAMPDIFF(year, birthday, now()))) as avg_age from profiles p ;

-- 2. ����������� ���������� ���� ��������, ������� ���������� �� ������ �� ���� ������. 
select dayofweek(concat(year (now()), '-', date_format(birthday, '%m-%d'))) as days, count(*) from profiles p2 
group by days 
order by days is null, days asc;
