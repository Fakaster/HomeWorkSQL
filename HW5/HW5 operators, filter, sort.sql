use vk_test;

-- ���������, ����������, ���������� � �����������
-- 1. ����� � ������� users ���� created_at � updated_at ��������� ��������������. ��������� �� �������� ����� � ��������
update users set created_at = now(), updated_at = now(); 

-- 2. ���������� ������������� ���� � ���� DATETIME, �������� �������� ����� ��������
update users set created_at = str_to_date(created_at, '%d.%m.%Y %k:%i');
update users set updated_at = str_to_date(updated_at, '%d.%m.%Y %k:%i');

alter table users modify  created_at datetime;
alter table users modify  updated_at datetime;

-- 3. ������������� ������ �� �����������, �� ������� ������ ������ ���������� � �����
select  * from storehouses_products
order by value = 0 asc, value asc;

-- 4. ������� �������������, ���������� � ������� � ���.
select  * from profiles p
where date_format(birthday, '%M') in ('may', 'august')
;

