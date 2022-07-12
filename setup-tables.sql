-- DBの作成
CREATE DATABASE myhealth_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

-- テーブルの作成
USE myhealth_db;

CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  height DOUBLE NOT NULL,
  email VARCHAR(255) UNIQUE KEY NOT NULL,
  pass CHAR(60) NOT NULL
);

CREATE TABLE daily_records (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  registered DATETIME NOT NULL,
  weight DOUBLE NOT NULL,
  walk INT DEFAULT 0,
  jogging INT DEFAULT 0,
  pool INT DEFAULT 0,
  training INT DEFAULT 0,
  ball INT DEFAULT 0,
  other INT DEFAULT 0
);