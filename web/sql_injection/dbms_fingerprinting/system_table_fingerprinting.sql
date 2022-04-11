[MySQL]

MySQL 초기 데이터 베이스 모습
mysql> show databases;

MySQL 스키마 정보 조회
mysql> select TABLE_SCHEMA from information_schema.tables group by TABLE_SCHEMA;

MySQL 테이블 정보 조회
mysql> select TABLE_SCHEMA, TABLE_NAME from information_schema.TABLES;

MySQL 컬럼 정보 조회
mysql> select TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME from information_schema.COLUMNS;

MySQL 계정 및 실시간 실행 쿼리 조회
mysql> select user,current_statement from sys.session;

MySQL DBMS 계정 정보
mysql> select User, authentication_string from mysql.user;

MySQL DBMS 권한 및 계정 정보
mysql> select GRANTEE,PRIVILEGE_TYPE,IS_GRANTABLE from information_schema.USER_PRIVILEGES;

[MSSQL]

MSSQL 초기 데이터 베이스 모습
SELECT name FROM sys.databases

MSSQL 데이터베이스 정보 조회
SELECT name FROM master..sysdatabases;

MSSQL DB_NAME을 이용한 데이터베이스 정보 조회
SELECT DB_NAME(1);

MSSQL 테이블 정보 조회
SELECT name FROM dreamhack..sysobjects WHERE xtype = 'U';    # xtype='U' 는 이용자 정의 테이블을 의미합니다.
SELECT table_name FROM dreamhack.information_schema.tables;

MSSQL SYSCOLUMNS 컬럼 정보 조회
SELECT name FROM syscolumns WHERE id = (SELECT id FROM sysobjects WHERE name = 'users');

MSSQL INFORMATION_SCHEMA 컬럼 정보 조회
SELECT table_name, column_name FROM dreamhack.information_schema.columns;

MSSQL 계정 정보 조회
SELECT name, password_hash FROM master.sys.sql_logins;
SELECT * FROM master..syslogins;

[PostgreSQL]

PostgreSQL 초기 데이터 베이스 모습
postgres=$ select datname from pg_database;

PostgreSQL 스키마(카탈로그) 정보
postgres=$ select nspname from pg_catalog.pg_namespace;

PostgreSQL 주요 스키마 테이블
postgres=$ select table_name from information_schema.tables where table_schema='pg_catalog';
postgres=# select table_name from information_schema.tables where table_schema='information_schema';

PostgreSQL 계정 정보 조회
postgres=$ select usename, passwd from pg_catalog.pg_shadow;

PostgreSQL 설정 정보
postgres=$ select name, setting from pg_catalog.pg_settings;

PostgreSQL 계정 및 실시간 실행 쿼리 확인
postgres=$ select usename, query from pg_catalog.pg_stat_activity;

PostgreSQL 테이블 정보 확인
postgres=$ select table_schema, table_name from information_schema.tables;

PostgreSQL 컬럼 정보 확인
postgres=$ select table_schema, table_name, column_name from information_schema.columns;

[Oracle]

Oracle 데이터베이스 및 테이블 정보 확인
SELECT DISTINCT owner FROM all_tables
SELECT owner, table_name FROM all_tables

Oracle 컬럼 정보 확인
SELECT column_name FROM all_tab_columns WHERE table_name = 'users'

Oracle DBMS 계정 정보 확인
SELECT * FROM all_users

[SQLite]

SQLite 시스템 테이블
sqlite> .header on    -- 콘솔에서 실행 시 컬럼 헤더를 출력하기 위해 설정합니다.
sqlite> select * from sqlite_master;

