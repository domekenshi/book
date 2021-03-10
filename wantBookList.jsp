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
                    });
                </script>





<!-- ヘッダー -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />
    <br>
    <h1>ほしいものリスト</h1>
    <br>
    <br>
    <br>
    <!-- 検索窓 -->
    <div class="wrapper">
        <div class="search-area">
            <form>
                <input type="text" id="search-text" placeholder="検索ワードを入力">
            </form>
            <div class="search-result">
                <div class="search-result__hit-num"></div>
                <div id="search-result__list"></div>
            </div>
        </div>
        <div class="container-xxl">
            <table class="table table-bordered border-success padding-left:20px; text-align:center;">

                <thead class="p-3 mb-2 bg-primary border-dark text-white">
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
                        <th></th>
                    </tr>
                </thead>
                <!-- テーブルのデータを繰り返し入力 -->
                <c:forEach var="book" items="${bookList}">
                    <tbody class="target-area bg-light">
                        <tr>
                            <th><c:out value="${book.isbn}" /></th>
                            <td>${book.imgURL}</td>
                            <td><c:out value="${book.title}" /></td>
                            <td><c:out value="${book.authors}" /></td>
                            <td><c:out value="${book.publisher}" /></td>
                            <td><c:out value="${book.price}" /></td>
                            <!-- ☆レビュー -->
                            <td><div class="rating" id="star">
                                        <input class="rating__input hidden--visually" type="radio" id="5-star"
                                            name="evaluation" value="5" /> <label class="rating__label" for="5-star"
                                            title="5 out of 5 rating"> <span class="rating__icon"></span> <span
                                            class="hidden--visually">5 out of 5 rating</span>
                                        </label> <input class="rating__input hidden--visually" type="radio" id="4-star"
                                            name="evaluation" value="4" /> <label class="rating__label" for="4-star"
                                            title="4 out of 5 rating"> <span class="rating__icon"></span> <span
                                            class="hidden--visually">4 out of 5 rating</span>
                                        </label> <input class="rating__input hidden--visually" type="radio" id="3-star"
                                            name="evaluation" value="3" /> <label class="rating__label" for="3-star"
                                            title="3 out of 5 rating"> <span class="rating__icon"></span> <span
                                            class="hidden--visually">3 out of 5 rating</span>
                                        </label> <input class="rating__input hidden--visually" type="radio" id="2-star"
                                            name="evaluation" value="2" /> <label class="rating__label" for="2-star"
                                            title="2 out of 5 rating"> <span class="rating__icon"></span> <span
                                            class="hidden--visually">2 out of 5 rating</span>
                                        </label> <input class="rating__input hidden--visually" type="radio" id="1-star"
                                            name="evaluation" value="1" /> <label class="rating__label" for="1-star"
                                            title="1 out of 5 rating"> <span class="rating__icon"></span> <span
                                            class="hidden--visually">1 out of 5 rating</span>
                                        </label>
                                    </div></td>
                            <td><c:out value="${book.progress}" /></td>
                            <td><c:out value="${book.publishDate}" /></td>
                            <td><c:out value="${book.getDate}" /></td>
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