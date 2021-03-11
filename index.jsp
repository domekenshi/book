<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="index1.css" />
<title>ログイン画面</title>
</head>
<body>
<center><h2>ログイン画面</h2></center>
<form action="/Bookshelf/Login" method="post">
<dl><center>
ユーザー名
<dd><input type="text"  name="name" size="30" maxlength='20'required><br></dd>
パスワード
<dd><input type="passward" name="pass" size="30"  maxlength='10' required><br>
</center></dd>
</dl>
<input type="hidden" value="1" name="menu" ><br>
<center><input type="submit" value="ログイン" style="background-color:#ffff99" onmouseover="this.style.background='#99ccff'" onmouseout="this.style.background='#ffff99'"></center>
<!--/Bookshelf/NewAccount  -->
</form>
<br>
<form action="/Bookshelf" method="post">
<center><input type="submit"  formmethod="post" value="新規登録" style="background-color:#ffff99" onmouseover="this.style.background='#99ccff'" onmouseout="this.style.background='#ffff99'"><center><br>
</form>
</body>
</html>