CREATE DATABASE tfleamarket;

USE tfleamarket;

CREATE TABLE kuser(id int PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(20) NOT NULL,
password VARCHAR(300) NOT NULL,
username VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL,
address VARCHAR(300),
tel VARCHAR(20),
regdate DATETIME DEFAULT CURRENT_TIMESTAMP,
lev VARCHAR(20) DEFAULT 'USER',
act VARCHAR(20) DEFAULT 'JOIN', 
CONSTRAINT key_name UNIQUE(NAME)
);

-- 더미 데이터
INSERT INTO kuser VALUES (DEFAULT, 'seo', '1234', '서광', 'seo@gmail.com', '서울 목동', '010-1234-1234', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO kuser VALUES (DEFAULT, 'shin', '1234', '신수현', 'shin@gmail.com', '서울 목동', '010-1111-1111', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO kuser VALUES (DEFAULT, 'admin', '1234', '관리자', 'admin@gmail.com', '구로', '010-0000-0000', DEFAULT, DEFAULT, DEFAULT);

UPDATE kuser SET lev='ADMIN' WHERE NAME='admin';
UPDATE kuser SET lev='TEACHER' WHERE NAME='shin';

SELECT * FROM kuser;

UPDATE kuser SET PASSWORD='1234';

SELECT * FROM kuser WHERE id=1;


COMMIT;

DROP TABLE kuser;

DESC kuser;



######################################################


GRANT ALL PRIVILEGES ON test1.* TO 'test1'@'%';

SELECT CURRENT_TIMESTAMP();

COMMIT;

CREATE TABLE tb_authorities (
  auth_idx int NOT NULL AUTO_INCREMENT COMMENT '인덱스',
  user_id varchar(45) DEFAULT NULL COMMENT '사용자 아이디',
  authority varchar(45) DEFAULT NULL COMMENT '권한',
  PRIMARY KEY (auth_idx)
);

CREATE TABLE tb_code (
  code_idx int NOT NULL AUTO_INCREMENT COMMENT '인덱스',
  code_no varchar(45) NOT NULL COMMENT '코드번호',
  code_name varchar(45) DEFAULT NULL,
  code_exp varchar(45) DEFAULT NULL COMMENT '코드명',
  PRIMARY KEY (code_idx,code_no)
);

CREATE TABLE tb_grp_code (
  grp_code_idx int NOT NULL AUTO_INCREMENT COMMENT '인덱스',
  grp_cd_no varchar(20) DEFAULT NULL COMMENT '그룹코드 번호',
  grp_cd_exp varchar(45) DEFAULT NULL COMMENT '그룹 코드명',
  PRIMARY KEY (grp_code_idx)
);

CREATE TABLE tb_users (
  user_idx int NOT NULL AUTO_INCREMENT COMMENT '인덱스',
  user_id varchar(45) NOT NULL COMMENT '사용자 아이디',
  passwd varchar(100) NOT NULL COMMENT '패스워드',
  user_name varchar(20) DEFAULT NULL COMMENT '사용자 이름',
  email varchar(45) DEFAULT NULL COMMENT '이메일',
  tel varchar(45) DEFAULT NULL COMMENT '핸드폰번호',
  use_yn varchar(45) DEFAULT NULL COMMENT '사용여부',
  regdate DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '가입일시',
  pt INT DEFAULT 0, 
  PRIMARY KEY (user_idx)
);

INSERT INTO tb_grp_code VALUES (DEFAULT, 200, '권한');

INSERT INTO tb_code VALUES (DEFAULT, '200', 'ADMIN', '관리자');
INSERT INTO tb_code VALUES (DEFAULT, '200', 'USER', '사용자');

##################################################