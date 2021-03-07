<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="text-align:center">
<form>
<label for="isbn">ISBNを入力してください:</label>
<input id="isbn" name="info" type="text" placeholder="10桁 or 13桁" value="" />
<p class="h4">書籍タイトル:</p>
<input id="BookTitle" name="info" type="text" placeholder="10桁 or 13桁" value="" />
<p class="h4">著者:</p>
<input id="BookAuthor" name="info" type="text" value="" />
<input id="isbn" name="info" type="text" value="" />
<input id="isbn" name="info" type="text" value="" />
<input id="isbn" name="info" type="text" value="" />
<input id="isbn" name="info" type="text" value="" />
<input id="isbn" name="info" type="text" value="" />
<input type="hidden" name="menu" value="1">
<input type="submit" name="menu" value="追加する">
<hr>

</form>
<div class="container" id="container">
    <h2>書籍データベース</h2>
    <div id="content">
      <div class="form-group">
        <label for="isbn">ISBNを入力してください:</label>
        <input type="text" class="form-control" id="isbn" placeholder="Input ISBN code">
      </div>


      <div>
        <p class="h4">書籍タイトル:</p>
        <p id="BookTitle"></p>
      </div>

      <div>
        <p class="h4">著者:</p>
        <p id="BookAuthor"></p>
      </div>

      <div>
        <p class="h4">ISBN10:</p>
        <p id="isbn10"></p>
      </div>

      <div>
        <p class="h4">ISBN13:</p>
        <p id="isbn13"></p>
      </div>

      <div>
        <p class="h4">出版日:</p>
        <p id="PublishedDate"></p>
      </div>

      <div>
        <p class="h4">書籍サムネイル:</p>
        <p id="BookThumbnail"></p>
      </div>

      <div>
        <p class="h4">書籍概要:</p>
        <p id="BookDescription"></p>
      </div>

      <div>
        <p class="h4">メモ:</p>
        <textarea class="form-control" rows="5" id="BookMemo"></textarea>
      </div>

      <button class="btn btn-default" id="submit">登録する</button>

    </div>
  </div>
</body>
</html>