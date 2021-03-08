<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="./css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- <script src="/WEB-INF/js/addBook.js"></script> -->
<title>検索と追加</title>
</head>
<script>
$(function () {
    // フォームID [isbn] に入力があった場合、jQueryの関数 [change] を使ってISBNコードを取得。
    // Google Books APIへ問い合わせを行う。
    // もしGoogle Books APIに書籍が存在しない(totalItemsが0の場合)、入力欄に表示されたデータをすべて消去し、該当書籍がないとメッセージを表示する
    $("#isbn").change(() => {
      const isbn = $("#isbn").val();
      let url = "https://www.googleapis.com/books/v1/volumes?q=isbn:" + isbn;
      $.getJSON(url, function (data) {
        if (!data.totalItems) {
          $("#isbn").val("");
          $("#BookTitle").text("");
          $("#BookAuthor").text("");
          $("#isbn10").text("");
          // $("#isbn13").text("");
          $("publisher").val("");
          $("#PublishedDate").val("");
          $("#BookThumbnail").text("");
          $("#BookDescription").text("");
          $("#BookMemo").val("");
//エラーメッセージ
          $("#message").html('<p class="bg-warning" id="warning">該当する書籍がありません。</p>');
          $('#message > p').fadeOut(3000);
        } else {
          // 該当書籍が存在した場合、JSONをパースして入力項目のデータを取得する
          //タイトル検索用に一文追加
          $("#isbn").val(data.items[0].volumeInfo.industryIdentifiers[0].identifier);
          $("#BookTitle").val(data.items[0].volumeInfo.title);
          // $("#isbn13").text(data.items[0].volumeInfo.industryIdentifiers[0].identifier);
          $("#isbn10").text(data.items[0].volumeInfo.industryIdentifiers[1].identifier);
          $("#BookAuthor").val(data.items[0].volumeInfo.authors[0]);
          $("#Publisher").val(data.items[0].volumeInfo.publisher);
          $("#PublishedDate").val(data.items[0].volumeInfo.publishedDate);
          $("#BookDescription").text(data.items[0].volumeInfo.description);
          $("#BookThumbnail").html('<img src=\"' + data.items[0].volumeInfo.imageLinks.smallThumbnail + '\" />');
          $("#BookThumbnail2").val('<img src=\"' + data.items[0].volumeInfo.imageLinks.smallThumbnail + '\" />');
        }
      });
    });
  // タイトルが変更された時の処理
  $("#BookTitle").change(() => {
      const intitle = $("#BookTitle").val();
      let url = "https://www.googleapis.com/books/v1/volumes?q=intitle:" + intitle;
      $.getJSON(url, function (data) {
        if (!data.totalItems) {
          $("#isbn").val("");
          $("#BookTitle").text("");
          $("#BookAuthor").text("");
          $("#isbn10").text("");
          // $("#isbn13").text("");
          $("publisher").val("");
          $("#PublishedDate").val("");
          $("#BookThumbnail").text("");
          $("#BookDescription").val("");
          $("#BookMemo").val("");
          $("#message").html('<p class="bg-warning" id="warning">該当する書籍がありません。</p>');
          $('#message > p').fadeOut(3000);
        } else {
          // 該当書籍が存在した場合、JSONをパースして入力項目のデータを取得する
          $("#isbn").val(data.items[0].volumeInfo.industryIdentifiers[0].identifier);
          $("#BookTitle").val(data.items[0].volumeInfo.title);
          // $("#isbn13").text(data.items[0].volumeInfo.industryIdentifiers[0].identifier);
          $("#isbn10").text(data.items[0].volumeInfo.industryIdentifiers[1].identifier);
          $("#BookAuthor").val(data.items[0].volumeInfo.authors[0]);
          $("#Publisher").val(data.items[0].volumeInfo.publisher);
          $("#PublishedDate").val(data.items[0].volumeInfo.publishedDate);
          $("#BookDescription").val(data.items[0].volumeInfo.description);
          $("#BookThumbnail").html('<img src=\"' + data.items[0].volumeInfo.imageLinks.smallThumbnail + '\" />');
          $("#BookThumbnail2").val('<img src=\"' + data.items[0].volumeInfo.imageLinks.smallThumbnail + '\" />');
        }
      });
    });
  window.addEventListener('DOMContentLoaded', ()=>{
      document.querySelectorAll('.input_field').forEach(x=>{
        x.addEventListener('input',()=>{
          var reg=/[^0-9]/g;
          var val=x.value;
          if(reg.test(val)){
            x.value=val.replace(reg,'');
          }
        });
      });
    });
  });
</script>
<style>
body {
    background-repeat: repeat;
    background-image: url("./img/book-wall-1151405_1920.jpg");
    text-align: center;
    padding: 2em;
}
.button {
    display: inline-block;
    border-radius: 5%;
    /* 角丸       */
    font-size: 18pt;
    /* 文字サイズ */
    text-align: center;
    /* 文字位置   */
    cursor: pointer;
    /* カーソル   */
    padding: 12px 12px;
    /* 余白       */
    background: #1f1fca;
    /* 背景色     */
    color: #ffffff;
    /* 文字色     */
    line-height: 1em;
    /* 1行の高さ  */
    transition: .3s;
    /* なめらか変化 */
    box-shadow: 6px 6px 3px #666666;
    /* 影の設定 */
    border: 2px solid #000066;
    /* 枠の指定 */
}
.button:hover {
    box-shadow: none;
    /* カーソル時の影消去 */
    color: #000066;
    /* 背景色     */
    background: #ffffff;
    /* 文字色     */
}
/* レーティングのCSS */
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
</style>

<body>
    <jsp:include page="/WEB-INF/jsp/header.jsp" />
    <!-- とび先のURLの指定
画像をどうやって送るか -->
    <h1>本の追加・登録</h1>
    <br>
    <br>
    <div class="container" style="background-color: rgb(251, 250, 248); padding: 20px;" id="container">
        <form action="/Bookshelf/AddBook" method="POST">

            <div id="content">
                <div>
                    <label style="padding:5px;" for="isbn">ISBNを入力してください</label><span style="padding-left:5px"class="badge bg-danger">必須</span><br>
                    <input type="text" id="isbn" name="isbn" maxlength="13" size="40" placeholder="　１０桁 または１３桁の数字"
                        required>
                </div>
                <br>
                <div id="message"></div>
                <div>
                    <p class="h2">
                        [書籍タイトル]<br>
                    </p>
                    <input type="text" id="BookTitle" name="title" size="80" required
                        placeholder="　タイトルが完全に一致しない場合別な本の情報が自動入力される可能性があります"> <span class="badge bg-danger">必須</span>
                </div>
                <br>
                <div>
                    <p class="h2">[著者]</p>
                    <!-- <p id="BookAuthor"></p> -->
                    <input type="text" id="BookAuthor" name="authors" size="40">
                </div>
                <br>
                <div>
                    <p class="h2">[出版社]</p>
                    <!-- <p id="Publisher"></p> -->
                    <input type="text" id="Publisher" name="publisher" size="40">
                </div>
                <br>
                <div>
                    <p class="h2">[価格]</p>
                    <!-- <p id="Publisher"></p> -->
                    <input type="text" id="Price" class="input_field" name="price"  size="40" >
                </div>
                <br>
                <div>
                    <p class="h2">[購入日]</p>
                    <input type="date" name="getDate">
                </div>
                <br>
                <div>
                    <p class="h2">[評価]</p>
                    <div class="rating" id="star">
                        <input class="rating__input hidden--visually" type="radio" id="5-star" name="evaluation"
                            value="5" /> <label class="rating__label" for="5-star"
                            title="5 out of 5 rating"> <span class="rating__icon"></span> <span
                            class="hidden--visually">5 out of 5 rating</span>
                        </label> <input class="rating__input hidden--visually" type="radio" id="4-star" name="evaluation"
                            value="4" /> <label class="rating__label" for="4-star" title="4 out of 5 rating"> <span
                            class="rating__icon"></span> <span class="hidden--visually">4 out of 5 rating</span>
                        </label> <input class="rating__input hidden--visually" type="radio" id="3-star" name="evaluation"
                            value="3" /> <label class="rating__label" for="3-star" title="3 out of 5 rating"> <span
                            class="rating__icon"></span> <span class="hidden--visually">3 out of 5 rating</span>
                        </label> <input class="rating__input hidden--visually" type="radio" id="2-star" name="evaluation"
                            value="2" /> <label class="rating__label" for="2-star" title="2 out of 5 rating"> <span
                            class="rating__icon"></span> <span class="hidden--visually">2 out of 5 rating</span>
                        </label> <input class="rating__input hidden--visually" type="radio" id="1-star" name="evaluation"
                            value="1" /> <label class="rating__label" for="1-star" title="1 out of 5 rating"> <span
                            class="rating__icon"></span> <span class="hidden--visually">1 out of 5 rating</span>
                        </label>
                    </div>
                </div>
                <div>
                    <p class="h2">[ISBN10]</p>
                    <p id="isbn10"></p>
                </div>
                <br>
                <!-- <div>
          <p class="h2">[ISBN13]</p>
          <p id="isbn13"></p>
        </div>
        <br> -->

                <div>
                    <p class="h2">[出版日]</p>
                    <input type="text" id="PublishedDate" name="publishDate" disabled>
                    <!-- <p id="PublishedDate"></p> -->
                </div>
                <br>
                <div>
                    <p class="h2">[サムネイル画像]</p>
                    <p id="BookThumbnail"></p>
                </div>
                <br>
                <!-- 画像URLの取得用 -->
                <div style="display: none;">
                    <p>[URL]</p>
                    <input type="text" id="BookThumbnail2" name="imgURL">
                </div>
                <br>
                <div class="row">
                    <div class="col-md">
                        <p class="h2">[書籍概要]</p>
                        <!-- <p id="BookDescription"></p> -->
                        <textarea rows="5" cols="80" id="BookDescription" name="explain" disabled></textarea>
                    </div>
                </div>
                <br>
                <div>
                    <p class="h2">☆メモ☆</p>
                    <textarea rows="5" cols="80" id="BookMemo" name="memo"></textarea>
                </div>
                <br>
                <div style="padding-bottom: 30px">
                    <input type="submit" class="button" id="submit" value="登録する">
                </div>
            </div>
        </form>
    </div>
    <br>
    <br>
    <jsp:include page="/WEB-INF/jsp/footer.jsp" />
</body>

</html>