<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="./css/style.css"> -->
<style>
.backToAlaska {
    background: -webkit-radial-gradient(55% 330%, rgba(255, 255, 255, 0.5)
        0%, rgba(0, 0, 0, 0.5) 550%),
        -webkit-linear-gradient(bottom, rgba(255, 255, 255, 0.5) 0%,
        rgba(0, 0, 0, 0.6) 50%),
        -webkit-linear-gradient(bottom left, rgba(255, 255, 255, 0.3) 0%,
        rgba(0, 0, 0, 0.3) 120%);
    background: radial-gradient(55% 330%, rgba(255, 255, 255, 0.5) 0%,
        rgba(0, 0, 0, 0.5) 550%),
        linear-gradient(to top, rgba(255, 255, 255, 0.5) 0%,
        rgba(0, 0, 0, 0.6) 50%),
        linear-gradient(to top right, rgba(255, 255, 255, 0.3) 0%,
        rgba(0, 0, 0, 0.3) 120%);
    background-color: #DFE3E4;
    background-blend-mode: color-burn, screen, color-burn;
}

.button {
  display       : inline-block;
  border-radius : 14%;          /* 角丸       */
  font-size     : 19pt;        /* 文字サイズ */
  text-align    : center;      /* 文字位置   */
  cursor        : pointer;     /* カーソル   */
  padding       : 6px 16px;   /* 余白       */
  background    : #59b300;     /* 背景色     */
  color         : #ffffff;     /* 文字色     */
  line-height   : 1em;         /* 1行の高さ  */
  transition    : .3s;         /* なめらか変化 */
  box-shadow    : 6px 6px 3px #666666;  /* 影の設定 */
  border        : 2px solid #59b300;    /* 枠の指定 */
}
.button:hover {
  box-shadow    : none;        /* カーソル時の影消去 */
  color         : #59b300;     /* 背景色     */
  background    : #ffffff;     /* 文字色     */
}
</style>
<title>ユーザー情報更新</title>
</head>
<body style="text-align: center" class="backToAlaska">
<jsp:include page="/WEB-INF/jsp/header.jsp" />
    <h1>ユーザー情報更新</h1>

    <br>

    <form action="/Bookshelf/UserInfo" method="post">
        ユーザー名<br> <input type="text" name="name" maxlength='20' value="${user.name}" required><br>
        <div class="form-group">
            <label>パスワード</label><br> <input type="password" maxlength='10' name="pass1"
                id="password" placeholder="(10文字以内)" required>
        </div>
        <div class="form-group">
            <label>パスワード (再確認)</label><br> <input type="password" maxlength='10' name="pass2"
                oninput="CheckPassword(this)" required>
        </div>

        メールアドレス<br> <input type="email" name="mailaddress" value="${user.mailaddress}" required><br>
        <input type="hidden" name="menu" value="1"> <input type="submit" style="margin-top: 20px;" value="更新" class="button"><br>
    </form>




    <jsp:include page="/WEB-INF/jsp/footer.jsp" />
    <!-- パスワードのエラーチェック -->
    <script>
                    function CheckPassword(confirm) {
                        // 入力値取得
                        let input1 = password.value;
                        let input2 = confirm.value;
                        // パスワード比較
                        if (input1 != input2) {
                            confirm.setCustomValidity("入力値が一致しません。");
                        } else {
                            confirm.setCustomValidity('');
                        }
                    }
                </script>


</body>
</html>




<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<style>
.backToAlaska {
    background: -webkit-radial-gradient(55% 330%, rgba(255, 255, 255, 0.5)
        0%, rgba(0, 0, 0, 0.5) 550%),
        -webkit-linear-gradient(bottom, rgba(255, 255, 255, 0.5) 0%,
        rgba(0, 0, 0, 0.6) 50%),
        -webkit-linear-gradient(bottom left, rgba(255, 255, 255, 0.3) 0%,
        rgba(0, 0, 0, 0.3) 120%);
    background: radial-gradient(55% 330%, rgba(255, 255, 255, 0.5) 0%,
        rgba(0, 0, 0, 0.5) 550%),
        linear-gradient(to top, rgba(255, 255, 255, 0.5) 0%,
        rgba(0, 0, 0, 0.6) 50%),
        linear-gradient(to top right, rgba(255, 255, 255, 0.3) 0%,
        rgba(0, 0, 0, 0.3) 120%);
    background-color: #DFE3E4;
    background-blend-mode: color-burn, screen, color-burn;
}
</style>

<title>ユーザー情報更新</title>
</head>
<body style="text-align: center" class="backToAlaska">
    <jsp:include page="/WEB-INF/jsp/header.jsp" />
    <h1>ユーザー情報更新</h1>

    <br>
    <div class="container">
        <form action="/Bookshelf/UserInfo" method="post">


            ユーザー名<br> <input type="text" name="name" maxlength='20' value="${user.name}" required>
            <br>
            <div class="form-group row">
                <label for="password" class="col-md-4 col-form-label text-md-right">パスワード</label>
                <div class="col-md-6">
                    <input type="password" id="password" class="form-control" name="password" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="confirm-password" class="col-md-4 col-form-label text-md-right">パスワード（確認）</label>
                <div class="col-md-6">
                    <input type="password" id="confirm-password" class="form-control" name="confirm-password" required>
                    <div class="valid-feedback">O.K.</div>
                    <div class="invalid-feedback">入力されたパスワードが一致しません。</div>
                </div>
            </div>
            <div class="row">

                <div class="col-md-4 col-form-label text-md-right">
                    <label for="exampleFormControlInput1" class="form-label">メールアドレス</label> <input type="email"
                        class="form-control" id="exampleFormControlInput1" name="mailaddress" value="${user.mailaddress}" required>
                </div>
                <div class="col-md-8 offset-md-4">


                メールアドレス: <input type="email" name="mailaddress" value="${user.mailaddress}" required><br> <br>
                    <input type="hidden" name="menu" value="1"> <input type="submit" style="margin-top: 20px;"
                        value="更新"><br>
                    <!-- <button class="btn btn-primary" type="button" onclick="">
                  登録
                </button> -->
                    <button class="btn btn-secondary ml-3" type='button' onclick="document.location.href='';">
                        戻る</button>
                </div>
            </div>

            <!-- <div class="form-group">
                <label>パスワード</label><br> <input type="password" maxlength='10' class="form-control" name="pass1"
                    id="password" required>
            </div>
            <div class="form-group">
                <label>パスワード (再確認)</label><br> <input type="password" maxlength='10' class="form-control"
                    name="pass2" oninput="CheckPassword(this)" required>
            </div> -->




        </form>

    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <!-- パスワードのエラーチェック -->
    <script>

					var elm_pass = $('#password');
					  var elm_confirm = $('#confirm-password');
					  /*
					  * 確認パスワードのキーボード（KeyUp）イベントリスナー
					  */
					  elm_confirm.on('keyup', function() {
					    // まだパスワード（確認）を入力していない
					    if (elm_confirm.val() === "") {
					      elm_confirm.removeClass("is-valid");
					      elm_confirm.removeClass("is-invalid");
					      return;
					    }
					    // 先頭から一文字ずつ取り出してチェックし最後まで到達していなくとも「問題無し」と判断
					    var array_pass_chars = elm_pass.val().split("");
					    var array_confirm_chars = elm_confirm.val().split("");
					    $.each(array_confirm_chars, function(index, char) {
					      if (array_pass_chars[index] === char){
					        // 先頭から一文字ずつ一致している場合には中途でも何も表示しない
					        elm_confirm.removeClass("is-valid");
					        elm_confirm.removeClass("is-invalid");
					      }
					      else{
					        // 一文字でも異なる場合はInvalid
					        elm_confirm.removeClass("is-valid");
					        elm_confirm.addClass("is-invalid");
					        return false;
					      }
					    });
					    // 完全一致したらValid
					    if (elm_pass.val() === elm_confirm.val()) {
					      elm_confirm.addClass("is-valid");
					    }
					    else {
					      elm_confirm.addClass("is-invalid");
					    }
					  });
					  /*
					  * 確認パスワード入力のフォーカスを失ったとき（Blur）のイベントリスナー
					  */
					  elm_confirm.on('blur', function() {
					    if (elm_pass.val() === elm_confirm.val()) {
					      elm_confirm.removeClass("is-invalid");
					      elm_confirm.addClass("is-valid");
					    }
					    // フォーカスが失われたときパスワードが一致しないと判断（Invalid）
					    else {
					      elm_confirm.removeClass("is-valid");
					      elm_confirm.addClass("is-invalid");
					    }
					  });
				</script>

    <jsp:include page="/WEB-INF/jsp/footer.jsp" />
</body>
</html> --%>