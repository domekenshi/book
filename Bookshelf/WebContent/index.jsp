<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./css/index.css" />
<title>ログイン画面</title>
</head>
<body>
<br>
<br>

<center><img src="./img/top.jpg" class="img-fluid"></center>
<br>
<div>
<form action="/Bookshelf/Login" method="post">
<dl><center>
<div  class="contaner">
<p class="title">ユーザー名</p>
<dd><input type="text"  name="name" size="30" maxlength='20'required><br></dd>
<p class="title">パスワード</p>
<dd><input type="passward" name="pass" size="30"  maxlength='10' required><br>
</center></dd>
</dl>
<input type="hidden" value="1" name="menu" ><br>
<center><input type="submit" value="ログイン" style="background-color:#ffff99" onmouseover="this.style.background='#99ccff'" onmouseout="this.style.background='#ffff99'"></center>
<!--/Bookshelf/NewAccount  -->
</div>
</form>
<br>
<form action="/Bookshelf/NewAccount" method="GET">
<center><input type="submit"  formmethod="GET" value="新規登録" style="background-color:#ffff99" onmouseover="this.style.background='#99ccff'" onmouseout="this.style.background='#ffff99'"><center><br>
</form>
</div>
</body>
</html>