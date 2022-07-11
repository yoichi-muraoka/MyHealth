-- 初期データの投入
-- パスワードは「abcd」をBCryptでハッシュ化したもの
TRUNCATE users;

INSERT INTO users VALUES
(1, '山田太郎', 167.5, 'taro@example.com', '$2a$08$UjCV2F7VCaAcYkOfxlQJBON0FZtzvor9q4L3Uf8f4oKujWkpyoGi.');

INSERT INTO users VALUES
(2, '鈴木次郎', 170.3, 'jiro@example.com', '$2a$08$UjCV2F7VCaAcYkOfxlQJBON0FZtzvor9q4L3Uf8f4oKujWkpyoGi.');