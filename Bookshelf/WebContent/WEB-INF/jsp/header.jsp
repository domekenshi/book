<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

<title>header</title>
</head>
<body>




<header class="sticky-top">
<!-- リンクは調整する -->
    <nav class="navbar navbar-expand-lg navbar-light bg-success fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand text-white" href="/Bookshelf/Menu">
    <img src="https://img.icons8.com/color/48/000000/book-shelf.png" width="30" height="24">　本棚　　</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active text-white" aria-current="page" href="/Bookshelf/Menu?menu=add">
          <img src="https://img.icons8.com/color/48/000000/save-as.png" width="30" height="24"/>追加・登録　　</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="/Bookshelf/Menu?menu=want">
          <img src="https://img.icons8.com/color/48/000000/like--v3.png" width="30" height="24"/>ほしいものリスト　　</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-white" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
          <img src="https://img.icons8.com/color/48/000000/shopping-basket.png" width="30" height="24"/>
            購入
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="https://www.amazon.co.jp/book/s?k=book" target="_blank">Amazon</a></li>
            <li><a class="dropdown-item" href="https://honto.jp/" target="_blank">honto</a></li>
            <li><a class="dropdown-item" href="https://books.rakuten.co.jp/" target="_blank">楽天books</a></li>
            <li><a class="dropdown-item" href="https://shop.tsutaya.co.jp/book.html" target="_blank">蔦屋書店</a></li>
            <li><a class="dropdown-item" href="https://www.kinokuniya.co.jp/" target="_blank">紀伊国屋</a></li>
          </ul>
          <li>　　
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="/Bookshelf/Menu?menu=info">
          <img src="https://img.icons8.com/color/48/000000/gender-neutral-user.png" width="30" height="24"/>ユーザー設定　　</a>
        </li>
      </ul>
      <!-- <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-info text-white" type="submit">search</button>
      </form> -->
      <img alt="logo" src="./img/logo.png" width="30" height="24">
    </div>
  </div>
</nav>
<br>
<br>
<br>



    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
    -->
    </header>
</body>
</html>