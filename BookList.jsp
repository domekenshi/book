<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ja">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./css/style.css">
<title>MｙBookshelf</title>
</head>
<body>
    <style>
body {
    /* background-repeat: repeat;
    background-image: url("./img/book-wall-1151405_1920.jpg");
    text-align: center;
    padding: 2em; */
    overflow: visible !important;
    background: -webkit-linear-gradient(45deg, #085078 10%, #85d8ce 90%);
    background: -moz-linear-gradient(45deg, #085078 10%, #85d8ce 90%);
    background: -ms-linear-gradient(45deg, #085078 10%, #85d8ce 90%);
    background: -o-linear-gradient(45deg, #085078 10%, #85d8ce 90%);
    background: linear-gradient(45deg, #085078 10%, #85d8ce 90%);
}
</style>
    <jsp:include page="/WEB-INF/jsp/header.jsp" />
    <br>
    <h1>MyBookshelf</h1>
    <br>
    <br>
    <br>
    <div class="container-xxl bg-white">
        <table class="table table-bordered border-success padding-left:20px;">

            <thead>
                <tr>

                    <th>ISBN</th>
                    <th>画像</th>
                    <th>タイトル</th>
                    <th>作者</th>
                    <th>出版社</th>
                    <th>値段</th>
                    <th>評価</th>
                    <th>進捗状況</th>
                    <th>出版日</th>
                    <th>購入日</th>
                    <th>メモ</th>
                </tr>
            </thead>
            <c:forEach var="book" items="${bookList}">
                <tbody>
                    <tr>
                        <th>${book.isbn}</th>
                        <td>${book.imgURL}</td>
                        <td>${book.title}</td>
                        <td>${book.authors}</td>
                        <td>${book.publisher}</td>
                        <td>${book.price}</td>
                        <td>${book.evaluation}</td>
                        <td>${book.progress}</td>
                        <td>${book.publishDate}</td>
                        <td>${book.getDate}</td>
                        <td>${book.memo}</td>
                    </tr>
                </tbody>
            </c:forEach>
        </table>
    </div>










    <jsp:include page="/WEB-INF/jsp/footer.jsp" />

</body>
</html>