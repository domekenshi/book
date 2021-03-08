<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css">
<title>編集</title>
</head>
<body>
    <style>
body {
    background-repeat: repeat;
    background-image: url("./img/wood-2045380_1920.jpg");
    text-align: center;
    padding: 2em;
}
</style>
    <jsp:include page="/WEB-INF/jsp/header.jsp" />
    <br>
    <br>
    <h1>本の情報を編集</h1>
    <br>
    <br>
    <div class="container-xl">
        <form action="" method="POST">
            <div class="card mb-3" style="max-width: 1500px;">
                <div class="row g-0">
                    <div class="col-md-3">
                        ${book.imgURL}
                        <!-- <img src="..." alt="..."> -->
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <p>タイトル</p>
                            <h5 class="card-title">
                                <input type="text" name="title" size="80" required>
                            </h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the
                                bulk of the card's content.</p>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">ISBN:${book.isbn}</li>
                            <li class="list-group-item">著者：${book.authors}</li>
                            <li class="list-group-item">出版社：${book.publisher}</li>
                        </ul>
                        <div class="card-body">
                            <a href="#" class="card-link">更新</a> <a href="#" class="card-link">削除</a>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>





    <hr>
    <jsp:include page="/WEB-INF/jsp/footer.jsp" />
</body>
</html>