// [ like 구문 사용 ] _ 또는 %와 같은 와일드 카드를 사용하여 문자열 찾기
uid=admin" and upw like "p%"-- 

// 특정 위치의 값만 출력되는 경우에 우회법
UNION SELECT NULL, password, NULL from user where uid="admin"#
