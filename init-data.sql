-- 初期データの投入
-- パスワードは「abcd」をBCryptでハッシュ化したもの
TRUNCATE users;

INSERT INTO users VALUES
(1, '山田太郎', 167.5, 'taro@example.com', '$2a$08$UjCV2F7VCaAcYkOfxlQJBON0FZtzvor9q4L3Uf8f4oKujWkpyoGi.');

INSERT INTO users VALUES
(2, '鈴木次郎', 170.3, 'jiro@example.com', '$2a$08$UjCV2F7VCaAcYkOfxlQJBON0FZtzvor9q4L3Uf8f4oKujWkpyoGi.');


TRUNCATE daily_records;

INSERT INTO daily_records VALUES
(1, 1, '2022-07-03', 67.5, 50, 0, 0, 30, 0, 0),
(2, 1, '2022-07-04', 68.3, 0, 0, 30, 0, 0, 20),
(3, 2, '2022-07-04', 71.2, 0, 30, 0, 0, 60, 0),
(4, 1, '2022-07-05', 67.9, 50, 0, 0, 30, 0, 10),
(5, 1, '2022-07-06', 67.5, 50, 0, 0, 30, 0, 0),
(6, 2, '2022-07-08', 72.1, 0, 30, 0, 30, 100, 0),
(7, 2, '2022-07-09', 71.9, 0, 0, 30, 30, 0, 25),
(8, 1, '2022-07-09', 66.8, 50, 0, 0, 30, 0, 0),
(9, 2, '2022-07-11', 71.3, 0, 30, 0, 30, 0, 0),
(10, 1, '2022-07-12', 67.2, 50, 0,40, 30, 0, 0);