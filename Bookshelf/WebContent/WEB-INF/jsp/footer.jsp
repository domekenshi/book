<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ja">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<style>
html {
  position: relative;
  min-height: 100%;
}
body {
  /* Margin bottom by footer height */
  margin-bottom: 60px;
  text-align:center;
  pdding-top:20px;
}
.footer {
  position: absolute;
  bottom: 0;
  width: 100%;
  /* Set the fixed height of the footer here */
  height: 100px;
  background-color: #f5f5f5;
}
/* Custom page CSS
-------------------------------------------------- */
/* Not required for template or sticky footer method. */
.container {
  width: auto;
  max-width: 680px;
  padding: 0 15px;
}
.container .text-muted {
  margin: 20px 0;
}
small{
margin-right:50px;
}
</style>
<title>footer</title>
</head>
<body>
<footer class="footer">
<div class="container">
  <div class="text-muted">My Bookshelf　制作委員会</div>
  <small>Copyright © 2021 toy</small>
  <a href="/Bookshelf/Menu?menu=logout">ログアウト</a>
  </div>

</footer>

</body>
