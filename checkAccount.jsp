<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<style>
body {
text-align:center;
padding-top:50px;
background-image:
background-repeat: repeat;
    background-image: url("./img/01-fabric-shirt.png");
}
.btn--orange,
a.btn--orange {
  color: #fff;
  background-color: #eb6100;
  font-size:30px;
}
.btn--orange:hover,
a.btn--orange:hover {
  color: #fff;
  background: #008000;
}

a.btn--radius {
   border-radius: 100vh;
}
a {
font-size:30px;
}

span {
font-size:50px;
font-weight: bold;
background:white;
border-radius:10px;
}
</style>

<title>登録決定画面</title>
</head>
<body>
<div class="container-md">
    <h1>登録決定画面</h1>
    <br>
    <br>
    <span>${user.userName}
    <br> ${user.address}</span>
    <br>
    <br>
    <form action="/NewAccount" method="post">

        <input type="hidden" name="menu" value="2"> <input type="submit" class="btn btn--orange" value="O K">

    </form>
    <br>
    <br>
    <br>
    <br>
    <a href="/Bookshelf/NewAccount">戻る</a>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>
</html>