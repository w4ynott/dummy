[MySQL]

MySQL 진법을 이용한 문자열 검사 우회
mysql> select 0x6162, 0b110000101100010;

MySQL 함수를 이용한 문자열 검사 우회
mysql> select char(0x61, 0x62);
mysql> select concat(char(0x61), char(0x62));

MySQL 개행을 이용한 공백 검사 우회
mysql> select
      -> 1;

MySQL 주석을 이용한 공백 검사 우회
mysql> select/**/1;

MySQL 기능을 이용한 코드 실행
mysql> select 1 /*!union*/ select 2;

[PostgreSQL]

PostgreSQL 함수를 이용한 문자열 검사 우회
postgres=> select chr(65);
postgres=> select concat(chr(65), chr(66));

PostgreSQL 가젯을 이용한 문자열 검사 우회
postgres=> select substring(version(),23,1);

PostgreSQL 개행을 이용한 공백 검사 우회
postgres=> select
1;

PostgreSQL 주석을 이용한 공백 검사 우회
postgres=> select/**/1;

[MSSQL]

MSSQL 함수를 이용한 문자열 검사 우회
> select char(0x61);
> select concat(char(0x61), char(0x62));
> select substring(@@version,134,1);

MSSQL 개행을 이용한 공백 검사 우회
> select
1;

MSSQL 주석을 이용한 공백 검사 우회
> select/**/1;

[SQLite]

SQLite 함수를 이용한 문자열 검사 우회
sqlite> select char(0x61);
sqlite> select char(0x61)||char(0x62);

SQLite 개행을 이용한 공백 검사 우회
sqlite> select
   ...> 1;

SQLite 주석을 이용한 공백 검사 우회
sqlite> select/**/1;

SQLite 구문 검사 우회
sqlite> select 1 union values(2);
