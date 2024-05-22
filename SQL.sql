CREATE DATABASE SQL;
use SQL;

-- 1.	Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
 CREATE FUNCTION format_seconds(seconds INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  DECLARE days INT;
  DECLARE hours INT;
  DECLARE minutes INT;
  DECLARE seconds_remaining INT;

  SET days = seconds DIV 86400;
  SET hours = (seconds MOD 86400) DIV 3600;
  SET minutes = (seconds MOD 3600) DIV 60;
  SET seconds_remaining = seconds MOD 60;

  RETURN CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds_remaining, ' seconds');
END;

CALL second_counter(123456);


-- 2.	Выведите только четные числа от 1 до 10 включительно.
-- Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)

SELECT number
FROM (
  SELECT number
  FROM (
SELECT n AS number
    FROM (
      SELECT t.n
      FROM (
        SELECT ROW_NUMBER() OVER (ORDER BY n) AS n
        FROM t
      ) AS t
    ) AS t
    WHERE t.n <= 10
  ) AS t
  WHERE t.number % 2 = 0
) AS t;

CALL get_even(1, 10);


 