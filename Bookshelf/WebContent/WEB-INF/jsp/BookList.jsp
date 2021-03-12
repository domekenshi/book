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

    overflow: visible !important;
    background: -webkit-linear-gradient(45deg, #085078 10%, #85d8ce 90%);
    background: -moz-linear-gradient(45deg, #085078 10%, #85d8ce 90%);
    background: -ms-linear-gradient(45deg, #085078 10%, #85d8ce 90%);
    background: -o-linear-gradient(45deg, #085078 10%, #85d8ce 90%);
    background: linear-gradient(45deg, #085078 10%, #85d8ce 90%);
}



/* 検索 */
.search-area input[type="text"] {
    padding: 5px 5px 3px;
    font-size: 16px;
    border: 1px solid #D6D6D6;
}
.search-area input[type="text"]:focus {
    background: #F9F9F9;
}
.search-result {
    margin-top: 20px;
}
.hit-num__text span {
    font-weight: bold;
}
#search-result__list {
    margin-top: 15px;
}
#search-result__list span {
    display: inline-block;
    margin-right: 15px;
    padding: 5px;
    background: #F2F2F2;
}
.target-area {
    margin-top: 50px;
}
.target-area .hidden {
    display: none
}
.rating {
    display: inline-flex;
    flex-direction: row-reverse;
}
.hidden--visually {
    border: 0;
    clip: rect(1px, 1px, 1px, 1px);
    clip: rect(1px, 1px, 1px, 1px);
    height: 1px;
    margin: -1px;
    overflow: hidden;
    padding: 0;
    position: absolute;
    width: 1px;
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

td{
text-align:center}
}

span {
 width: 180px;
 height: 180px;
 border: 1px solid #ccc;
 vertical-align: middle; /* 「vertical-align」を指定してもテキストは縦方向中央揃いにならない */
 text-align: center;
}
</style>

<title>My Bookshelf</title>
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

    <h1>MyBookshelf</h1>
    <br>
    <br>
    <br>
<p>${msg.result}</p>
    <!-- 検索窓 -->
    <form action="/Bookshelf/BookList" method="GET">
<input type="text" name="search"  placeholder="検索ワードを入力">
<input type="submit" name="search" value="検索">
</form>


<br>
        <div class="container-xxl center-block">
            <table class="table table-bordered border-success padding-left:20px; sorttbl" id="myTable">

                <thead class="p-3 mb-2 bg-primary border-dark text-white align-middle">
                    <!-- テーブルの要素 -->
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
                        <th>　</th>
                    </tr>

                </thead>
                <!-- テーブルのデータを繰り返し入力 -->
                <c:forEach var="book" items="${bookList}">
                    <tbody class="target-area bg-light align-middle">
                        <tr class="item">
                            <th><c:out value="${book.isbn}" /></th>
                            <td>${book.imgURL}</td>
                            <td><span style="vertical-ali"><c:out value="${book.title}" /></span></td>
                            <td><c:out value="${book.authors}" /></td>
                            <td><c:out value="${book.publisher}" /></td>
                            <td><c:out value="${book.price}" /></td>
                            <!-- ☆レビュー -->
                            <td><c:forEach var="i" begin="1" end="${book.evaluation}" step="1">
                           ★
                             </c:forEach></td>
                            <td><c:out value="${book.progress}" /></td>
                            <td><c:out value="${book.publishDate}" /></td>
                            <td><c:out value="${book.getDate}" /></td>
                            <td><c:out value="${book.memo}" /></td>
                            <td>
                                <!-- action後で入力 -->
                                <form action="/Bookshelf/BookList" method="post">
                                    <input type="hidden" name="menu" value="bookinfo"> <input type="hidden"
                                        name="isbn" value="${book.isbn}"> <input type="submit" value="編集" class="button">
                                </form>

                            </td>
                        </tr>
                    </tbody>
                </c:forEach>
            </table>
        </div>
<div class="container">
<br>
<br>
<br>

</div>




    <div style="text-align: right;">
        <a href="https://icons8.com/icon/13029/買い物かご">買い物かご icon by Icons8</a> <a
            href="https://icons8.com/icon/23664/本棚">本棚 icon by Icons8</a> <a
            href="https://icons8.com/icon/13280/名前を付けて保存">名前を付けて保存 icon by Icons8</a> <a
            href="https://icons8.com/icon/V4c6yYlvXtzy/いいね">いいね icon by Icons8</a>
    </div>




    <!-- /.wrapper -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

</body>
<footer><jsp:include page="/WEB-INF/jsp/footer.jsp" /></footer>
</html>