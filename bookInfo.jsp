<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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

input {
    text-align: center;
    /* リストを等間隔にする */ . inner { padding-left : 30px;
    display: flex;
    justify-content: space-evenly;
}

/* ボタン */
.button {
  display       : inline-block;
  border-radius : 10%;          /* 角丸       */
  font-size     : 17pt;        /* 文字サイズ */
  text-align    : center;      /* 文字位置   */
  cursor        : pointer;     /* カーソル   */
  padding       : 8px 9px;   /* 余白       */
  background    : #ff0000;     /* 背景色     */
  color         : #ffffff;     /* 文字色     */
  line-height   : 1em;         /* 1行の高さ  */
  transition    : .3s;         /* なめらか変化 */
  box-shadow    : 6px 6px 3px #666666;  /* 影の設定 */
  border        : 2px solid #ff0000;    /* 枠の指定 */
}
.button:hover {
  box-shadow    : none;        /* カーソル時の影消去 */
  color         : #ff0000;     /* 背景色     */
  background    : #ffffff;     /* 文字色     */
}
</style>
    <script>
    $(function () {
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

    }
				</script>
    <jsp:include page="/WEB-INF/jsp/header.jsp" />

    <br>
    <br>
    <h1>本の情報を編集</h1>
    <br>
    <br>
    <div class="container-xl">


        <div class="card mb-3" style="max-width: 1500px;">
            <div class="row g-0">
                <div class="col-md-3 border=1">
                    ${book.imgURL}
                    <!-- <img src="..." alt="..."> -->
                </div>
                <div class="col-md-8">
                        <form action="" method="POST">
                            <div class="card-body">
                                <p>タイトル</p>
                                <h5 class="card-title">
                                    <input type="text" name="title" size="80" required>
                                    <c:out value="${book.title}" />
                                </h5>
                                <c:choose>
                                    <c:when test="${book.evaluation != 0}">${book.evaluation}</c:when>
                                    <c:otherwise>
                                        <div class="rating" id="star">
                                            <input class="rating__input hidden--visually" type="radio" id="5-star"
                                                name="evaluation" value="5" /> <label class="rating__label"
                                                for="5-star" title="5 out of 5 rating"> <span
                                                class="rating__icon"></span> <span class="hidden--visually">5 out
                                                    of 5 rating</span>
                                            </label> <input class="rating__input hidden--visually" type="radio" id="4-star"
                                                name="evaluation" value="4" /> <label class="rating__label"
                                                for="4-star" title="4 out of 5 rating"> <span
                                                class="rating__icon"></span> <span class="hidden--visually">4 out
                                                    of 5 rating</span>
                                            </label> <input class="rating__input hidden--visually" type="radio" id="3-star"
                                                name="evaluation" value="3" /> <label class="rating__label"
                                                for="3-star" title="3 out of 5 rating"> <span
                                                class="rating__icon"></span> <span class="hidden--visually">3 out
                                                    of 5 rating</span>
                                            </label> <input class="rating__input hidden--visually" type="radio" id="2-star"
                                                name="evaluation" value="2" /> <label class="rating__label"
                                                for="2-star" title="2 out of 5 rating"> <span
                                                class="rating__icon"></span> <span class="hidden--visually">2 out
                                                    of 5 rating</span>
                                            </label> <input class="rating__input hidden--visually" type="radio" id="1-star"
                                                name="evaluation" value="1" /> <label class="rating__label"
                                                for="1-star" title="1 out of 5 rating"> <span
                                                class="rating__icon"></span> <span class="hidden--visually">1 out
                                                    of 5 rating</span>
                                            </label>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                                <div class="inner">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item">ISBN<br> <input type="text" name="isbn"
                                            size="60" required> <c:out value="${book.isbn}" /></li>
                                        <li class="list-group-item">著者<br> <input type="text" name="authors"
                                            size="60"> <c:out value="${book.authors}" /></li>
                                        <li class="list-group-item">出版社<br> <input type="text"
                                            name="publisher" size="60"> <c:out value="${book.publisher}" /></li>
                                        <li class="list-group-item">出版日<br> <input type="date"
                                            name="publishDate" size="60"> <c:out value="${book.publishDate}" /></li>
                                        <li class="list-group-item">価格<br> <input type="text" name="price"
                                            size="60"> <c:out value="${book.price}" /></li>
                                        <li class="list-group-item">購入日<br> <input type="date" name="getDate"
                                            size="60"> <c:out value="${book.getDate}" /></li>
                                        <li class="list-group-item">進捗<br> <input type="text" name="progress"
                                            size="60"> <c:out value="${book.progress}" /></li>
                                    </ul>
                                </div>
                                <p>メモ</p>
                                <textarea rows="5" cols="80" id="BookMemo" name="memo"></textarea>
                                <div class="card-body">
                                    <c:out value="${book.memo}" />


                                    <!-- <a href="#" class="card-link">更新</a> <a href="#" class="card-link">削除</a> -->

                                </div>
                            </div>
                            <input type="submit" name="menu" value="更新" class="card-link">
                            <a href="#" class="card-link" class="button">削除</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>





    <hr>
    <jsp:include page="/WEB-INF/jsp/footer.jsp" />
</body>
</html>