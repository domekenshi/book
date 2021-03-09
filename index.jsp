<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン画面</title>
</head>
<body>
<h1>ログイン画面</h1>
<form action="/Bookshelf/Login" method="post">

ユーザー名
<input type="text" name="name"  maxlength='20'required><br>
パスワード
<input type="password" name="pass" maxlength='10' required><br>

<input type="hidden" value="1" name="menu" ><br>
<input type="submit" value="ログイン">
<!--/Bookshelf/NewAccount  -->
</form>
<form action="/Bookshelf/NewAccount" method="get">
<input type="submit"  value="新規登録" ><br></form>
</body>
</html>