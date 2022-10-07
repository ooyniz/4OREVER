-- 데이터베이스 생성
-- DROP DATABASE member_db;
CREATE DATABASE member_db;

-- 데이터베이스 접속
USE member_db;

-- 테이블 생성
CREATE TABLE member (
	mem_num INT NOT NULL AUTO_INCREMENT,
	mem_id VARCHAR(30) NOT NULL UNIQUE,
	mem_pw VARCHAR(30) NOT NULL,
	mem_name VARCHAR(30) NOT NULL,
	mem_email VARCHAR(60),
	mem_phone VARCHAR(30),
	mem_RRN VARCHAR(30) NOT NULL UNIQUE,
	mem_class INT NOT NULL DEFAULT 100,
	mem_regDate TIMESTAMP DEFAULT NOW(),
	PRIMARY KEY (mem_num)
);

-- 기본 계정 생성
INSERT INTO member (mem_id, mem_pw, mem_name, mem_email, mem_phone, mem_RRN, mem_class)
VALUES ('admin', 'admin', 'Admin', '', '', '1234561234567', '300');
INSERT INTO member (mem_id, mem_pw, mem_name, mem_email, mem_phone, mem_RRN, mem_class)
VALUES ('guest', 'guest', 'Guest', '', '', '1234561234568', '100');