<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./css/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
    display: inline-block;
    border-radius: 10%; /* 角丸       */
    font-size: 17pt; /* 文字サイズ */
    text-align: center; /* 文字位置   */
    cursor: pointer; /* カーソル   */
    padding: 8px 9px; /* 余白       */
    background: #ff0000; /* 背景色     */
    color: #ffffff; /* 文字色     */
    line-height: 1em; /* 1行の高さ  */
    transition: .3s; /* なめらか変化 */
    box-shadow: 6px 6px 3px #666666; /* 影の設定 */
    border: 2px solid #ff0000; /* 枠の指定 */
}

.button:hover {
    box-shadow: none; /* カーソル時の影消去 */
    color: #ff0000; /* 背景色     */
    background: #ffffff; /* 文字色     */
}

.card {
    background-color: red;
    text-align: right;
}

a.btn--orange {
    color: #fff;
    background-color: #eb6100;
    border-bottom: 5px solid #b84c00;
}

a.btn--orange:hover {
    margin-top: 3px;
    color: #fff;
    background: #f56500;
    border-bottom: 2px solid #b84c00;
}

a.btn--shadow {
    -webkit-box-shadow: 0 3px 5px rgba(0, 0, 0, .3);
    box-shadow: 0 3px 5px rgba(0, 0, 0, .3);
}

.imgUrl {
    text-align: left;
    float: left;
}
</style>
<title>編集</title>
</head>
<body>

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
    function clickBtn2(){

        if (document.getElementById("b2").disabled === true){
            // disabled属性を削除
            document.getElementById("b2").removeAttribute("disabled");
            document.getElementById("b2").style.color = "black";
        }else{
            // disabled属性を設定
            document.getElementById("b2").setAttribute("disabled", true);
            document.getElementById("b2").style.color = "White";
        }
    }
                </script>
    <jsp:include page="/WEB-INF/jsp/header.jsp" />
    <br>
    <br>
    <h1>本の情報を編集</h1>
    <br>
    <br>
    <div class="container bg-white">
        <div class="imgUrl">
            ${book.imgURL}aaaaaaaaaaaa
        </div>

        <form action="" method="POST">

            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatingInput"> <label
                    for="floatingInput">タイトル</label>
            </div>
            <div class="form-floating">
                <input type="text" class="form-control" id="floatingIsbn" placeholder="ISBN"> <label
                    for="floatingIsbn">ISBN</label>
            </div>
            <div>
                <!-- 登録時評価をつけていたらその評価。何もつけていなかったら☆０個の状態で表示 -->
                <c:choose>
                    <c:when test="${book.evaluation != 0}">${book.evaluation}</c:when>
                    <c:otherwise>
                        <div class="rating" id="star">
                            <input class="rating__input hidden--visually" type="radio" id="5-star" name="evaluation"
                                value="5" /> <label class="rating__label" for="5-star" title="5 out of 5 rating">
                                <span class="rating__icon"></span> <span class="hidden--visually">5 out of 5
                                    rating</span>
                            </label> <input class="rating__input hidden--visually" type="radio" id="4-star" name="evaluation"
                                value="4" /> <label class="rating__label" for="4-star" title="4 out of 5 rating">
                                <span class="rating__icon"></span> <span class="hidden--visually">4 out of 5
                                    rating</span>
                            </label> <input class="rating__input hidden--visually" type="radio" id="3-star" name="evaluation"
                                value="3" /> <label class="rating__label" for="3-star" title="3 out of 5 rating">
                                <span class="rating__icon"></span> <span class="hidden--visually">3 out of 5
                                    rating</span>
                            </label> <input class="rating__input hidden--visually" type="radio" id="2-star" name="evaluation"
                                value="2" /> <label class="rating__label" for="2-star" title="2 out of 5 rating">
                                <span class="rating__icon"></span> <span class="hidden--visually">2 out of 5
                                    rating</span>
                            </label> <input class="rating__input hidden--visually" type="radio" id="1-star" name="evaluation"
                                value="1" /> <label class="rating__label" for="1-star" title="1 out of 5 rating">
                                <span class="rating__icon"></span> <span class="hidden--visually">1 out of 5
                                    rating</span>
                            </label>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </form>






    </div>
    <%-- <div class="container-xl">
        <div class="card mb-5" style="max-width: 1500px; margin-bottom: 20;">
            <div class="row
    g-1">
                <div class="col-md-3 border=2" style="align: center;">${book.imgURL}</div>
                <div class="col-md-8">
                    <form action="" method="POST">
                        <div class="card-body">
                            <h4>タイトル</h4>
                            <h5 class="card-title">
                                <input type="text" name="title" size="70" required>
                                <c:out value="${book.title}" />
                            </h5>
                            <!-- 登録時評価をつけていたらその評価。何もつけていなかったら☆０個の状態で表示
    -->
                            <c:choose>
                                <c:when test="${book.evaluation != 0}">${book.evaluation}</c:when>
                                <c:otherwise>
                                    <div class="rating" id="star">
                                        <input class="rating__input hidden--visually" type="radio" id="5-star"
                                            name="evaluation" value="5" /> <label class="rating__label" for="5-star"
                                            title="5 out of 5 rating"> <span class="rating__icon"></span> <span
                                            class="hidden--visually">5 out of 5 rating</span>
                                        </label> <input class="rating__input hidden--visually" type="radio" id="4-star"
                                            name="evaluation" value="4" /> <label class="rating__label" for="4-star"
                                            title="4 out of 5
    rating"> <span class="rating__icon"></span> <span
                                            class="hidden--visually">4 out of 5 rating</span>
                                        </label> <input class="rating__input hidden--visually" type="radio" id="3-star"
                                            name="evaluation" value="3" /> <label class="rating__label" for="3-star"
                                            title="3 out of 5 rating"> <span class="rating__icon"></span> <span
                                            class="hidden--visually">3 out of 5 rating</span>
                                        </label> <input class="rating__input hidden--visually" type="radio" id="2-star"
                                            name="evaluation" value="2" /> <label class="rating__label" for="2-star"
                                            title="2 out of 5
    rating"> <span class="rating__icon"></span> <span
                                            class="hidden--visually">2 out of 5 rating</span>
                                        </label> <input class="rating__input hidden--visually" type="radio" id="1-star"
                                            name="evaluation" value="1" /> <label class="rating__label" for="1-star"
                                            title="1 out of 5 rating"> <span class="rating__icon"></span> <span
                                            class="hidden--visually">1 out of 5 rating</span>
                                        </label>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                            <div class="inner">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item"><h4>ISBN</h4>
                                        <br> <input type="text" id="b2" name="isbn" size="60"> <c:out
                                            value="${book.isbn}" /><input type="button" value="活性/非活性"
                                        onclick="clickBtn2()"></li>

                                    <li class="list-group-item"><h4>著者</h4>
                                        <br> <input type="text" name="authors" size="60"> <c:out
                                            value="${book.authors}" /></li>
                                    <li class="list-group-item"><h4>出版社</h4>
                                        <br> <input type="text" name="publisher" size="60"> <c:out
                                            value="${book.publisher}" /></li>
                                    <li class="list-group-item"><h4>出版日</h4>
                                        <br> <input type="date" name="publishDate" size="40"> <c:out
                                            value="${book.publishDate}" /></li>
                                    <li class="list-group-item"><h4>価格</h4>
                                        <br> <input type="number" name="price" pattern="(0|[1-9][0-9]*)" size="40">
                                        <c:out value="${book.price}" /></li>
                                    <li class="list-group-item"><h4>購入日</h4>
                                        <br> <input type="date" name="getDate" size="60"> <c:out
                                            value="${book.getDate}" /></li>
                                    <li class="list-group-item"><h4>進捗</h4> <select name="progress">
                                            <option value="${book.progress}" /></option>
                                            <option value="1">既読</option>
                                            <option value="2">未読</option>
                                            <option value="3">読書中</option>
                                    </select></li>
                                </ul>
                            </div>
                            <p>メモ</p>
                            <textarea rows="5" cols="80" id="BookMemo" name="memo"></textarea>
                            <div class="card-body">
                                <c:out value="${book.memo}" />
                                <!-- <a href="#" class="card-link">更新</a> <a href="#"
    class="card-link">削除</a> -->
                            </div>
                        </div>
                        <input type="submit" name="update" value="更新"> <a class="btn btn-danger
    card"
                            href="#" role="button">削除</a> <a href="" class="btn btn--orange btn--cubic btn--shadow">PUSH！</a>
                    </form>

                </div>
            </div>
        </div>
    </div>
     --%><jsp:include page="/WEB-INF/jsp/footer.jsp" /> <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
    crossorigin="anonymous"></script>
</body>
</html>