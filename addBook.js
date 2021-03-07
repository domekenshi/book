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
          $("#PublishedDate").text("");
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
          $("#PublishedDate").text(data.items[0].volumeInfo.publishedDate);
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
          $("#PublishedDate").text("");
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
          $("#PublishedDate").text(data.items[0].volumeInfo.publishedDate);
          $("#BookDescription").val(data.items[0].volumeInfo.description);
          $("#BookThumbnail").html('<img src=\"' + data.items[0].volumeInfo.imageLinks.smallThumbnail + '\" />');
          $("#BookThumbnail2").val('<img src=\"' + data.items[0].volumeInfo.imageLinks.smallThumbnail + '\" />');
        }
      });
    });
  });