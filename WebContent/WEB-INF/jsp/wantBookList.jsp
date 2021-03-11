<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ja">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- スタイルシート -->
    <style>
body {

  background: radial-gradient(1.5em 6.28571em at 1.95em, rgba(255, 255, 255, 0) 50%, rgba(255, 255, 255, 0.25) 50%, rgba(255, 255, 255, 0.25) 55%, rgba(255, 255, 255, 0) 55%) 0 0, radial-gradient(1.5em 6.28571em at -0.45em, rgba(255, 255, 255, 0) 50%, rgba(255, 255, 255, 0.25) 50%, rgba(255, 255, 255, 0.25) 55%, rgba(255, 255, 255, 0) 55%) 1.5em 5.5em, radial-gradient(2.3em 4.57143em at 2.99em, rgba(255, 255, 255, 0) 50%, rgba(255, 255, 255, 0.3) 50%, rgba(255, 255, 255, 0.3) 55%, rgba(255, 255, 255, 0) 55%) 0 0, radial-gradient(2.3em 4.57143em at -0.69em, rgba(255, 255, 255, 0) 50%, rgba(255, 255, 255, 0.3) 50%, rgba(255, 255, 255, 0.3) 55%, rgba(255, 255, 255, 0) 55%) 2.3em 4em, radial-gradient(3.5em 6.28571em at 4.55em, rgba(255, 255, 255, 0) 50%, rgba(255, 255, 255, 0.25) 50%, rgba(255, 255, 255, 0.25) 55%, rgba(255, 255, 255, 0) 55%) 0 0, radial-gradient(3.5em 6.28571em at -1.05em, rgba(255, 255, 255, 0) 50%, rgba(255, 255, 255, 0.25) 50%, rgba(255, 255, 255, 0.25) 55%, rgba(255, 255, 255, 0) 55%) 3.5em 5.5em, radial-gradient(#15ffa5, #00ced1);
  background-color: mediumspringgreen;
  background-size: 1.5em 11em, 1.5em 11em, 2.3em 8em, 2.3em 8em, 3.5em 11em, 3.5em 11em, 100% 100%;
  background-repeat: repeat;
}

/* 評価のCSS */
.rating__label {
    cursor: pointer;
    color: gray;
    padding-left: 0.25rem;
    padding-right: 0.25rem;
}
.rating__icon::before {
    content: "★";
}
.rating__input:hover ~.rating__label {
    color: lightgray;
}
.rating__input:checked ~.rating__label {
    color: goldenrod;
}
#star {
    text-align: center;
    font-size: 1.5rem;
    padding: 1rem 0.5rem;
}
input{
text-align:center;
}
/* 編集ボタン */
.button {
  display       : inline-block;
  border-radius : 50%;          /* 角丸       */
  font-size     : 20pt;        /* 文字サイズ */
  text-align    : center;      /* 文字位置   */
  cursor        : pointer;     /* カーソル   */
  padding       : 17px 19px;   /* 余白       */
  background    : rgba(26, 26, 255, 0.81);     /* 背景色     */
  color         : #66ff66;     /* 文字色     */
  line-height   : 1em;         /* 1行の高さ  */
  transition    : .3s;         /* なめらか変化 */
  box-shadow    : 9px 9px 4px #666666;  /* 影の設定 */
  border        : 2px solid rgba(26, 26, 255, 0.81);    /* 枠の指定 */
}
.button:hover {
  box-shadow    : none;        /* カーソル時の影消去 */
  color         : rgba(26, 26, 255, 0.81);     /* 背景色     */
  background    : #66ff66;     /* 文字色     */
}
/* 検索サブ用 */
/* *::-webkit-input-placeholder {
    color: #fff;
}
*:-moz-placeholder {
    color: #fff;
}
*::-moz-placeholder {
    color: #fff;
}
*:-ms-input-placeholder {
    color: #fff;
}
#containter {
  text-align: center;
}
h1 {
  color: #55acee;
  font-family: cursive;
  font-weight: bold;
  font-size: 72px;
  margin-top: 50px;
}
.textbox {
  margin-top: 50px;
  font-family: cursive;
  border: 1px solid #acacac;
  color: #fff;
  opacity: .7;
  border-radius: 10px;
  padding: 20px;
  text-align: center;
  width: 400px;
  transition: all .3s;
  -webkit-transition: all .3s;
  -moz-transition: all .3s;
  font-size: 16px;
  outline: none;
  background-color: #acacac;
}
.textbox:focus {
  width: 500px;
  outline: none;
} */

</style>

<title>ほしいものリスト</title>
</head>
<body>
    <!--JS  -->
    <script>
                    $(function() {
                        searchWord = function() {
                            var searchText = $(this).val(), // 検索ボックスに入力された値
                            targetText;
                            $('.target-area li').each(function() {
                                targetText = $(this).text();
                                // 検索対象となるリストに入力された文字列が存在するかどうかを判断
                                if (targetText.indexOf(searchText) != -1) {
                                    $(this).removeClass('hidden');
                                } else {
                                    $(this).addClass('hidden');
                                }
                            });
                        };
                        // searchWordの実行
                        $('#search-text').on('input', searchWord);
                        /* 検索サブ */
                        function send() {
                            document.form.submit()
                            }
                    });
                </script>



<!-- ヘッダー -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />
    <br>

    <h1>ほしいものリスト</h1>
    <br>
    <br>
    <br>
    <p>${msg.result}</p>
<form action="/Bookshelf/WantBook" method="GET">
<input type="text" name="search"  placeholder="検索ワードを入力">
<input type="submit" name="search" value="検索">
</form>
<br>

        <div class="container-xxl center-block">
            <table class="table table-bordered border-success padding-left:20px; sorttbl" id="myTable">

                <thead class="p-3 mb-2 bg-primary border-dark text-white">
                    <!-- テーブルの要素 -->


                    <tr>
                        <th>ISBN</th>
                        <th>画像</th>
                        <th>タイトル</th>
                        <th>作者</th>
                        <th>出版社</th>
                        <th>値段</th>
                        <th>進捗状況</th>
                        <th>出版日</th>
                        <th>メモ</th>
                        <th></th>
                    </tr>

                </thead>
                <!-- テーブルのデータを繰り返し入力 -->
                <c:forEach var="book" items="${bookList}">
                    <tbody class="target-area bg-light">
                        <tr class="item">
                            <th><c:out value="${book.isbn}" /></th>
                            <td>${book.imgURL}</td>
                            <td><c:out value="${book.title}" /></td>
                            <td><c:out value="${book.authors}" /></td>
                            <td><c:out value="${book.publisher}" /></td>
                            <td><c:out value="${book.price}" /></td>
                            <td><c:out value="${book.progress}" /></td>
                            <td><c:out value="${book.publishDate}" /></td>
                            <td><c:out value="${book.memo}" /></td>
                            <td>
                                <!-- action後で入力 -->
                                <form action="/Bookshelf/WantBook" method="post">
                                    <input type="hidden" name="menu" value="bookinfo"> <input type="hidden"
                                        name="isbn" value="${book.isbn}"> <input type="submit" value="編集" class="button">
                                </form>

                            </td>
                        </tr>
                    </tbody>
                </c:forEach>
            </table>
        </div>






    <div style="text-align: right;">
        <a href="https://icons8.com/icon/13029/買い物かご">買い物かご icon by Icons8</a> <a
            href="https://icons8.com/icon/23664/本棚">本棚 icon by Icons8</a> <a
            href="https://icons8.com/icon/13280/名前を付けて保存">名前を付けて保存 icon by Icons8</a> <a
            href="https://icons8.com/icon/V4c6yYlvXtzy/いいね">いいね icon by Icons8</a>
    </div>



    <jsp:include page="/WEB-INF/jsp/footer.jsp" />
    <!-- /.wrapper -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

</body>
</html>