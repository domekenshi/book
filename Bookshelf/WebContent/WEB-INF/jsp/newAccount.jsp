<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="./css/style.css"> -->
<style>
body{
text-align:center;
padding-top:50px;
background-image:
background-repeat: repeat;
    background-image: url("./img/01-fabric-shirt.png");
}
.p-alert{

font-size:20px;
color:red;
font-weight: bold;
border-radius:8px;
padding: 5px;

}
</style>
<title>新規登録画面</title>
</head>
<body>
    <h1>新規登録画面</h1>
    <span class="p-alert">${msg.result}</span>
    <br>

    <form action="/Bookshelf/NewAccount" method="post">
        ユーザー名<br> <input type="text" name="name" maxlength='20' placeholder="　　　　田中 太郎" required><br>
        <div class="form-group">
            <label>パスワード</label><br> <input type="password" maxlength='10' class="form-control" name="pass1"
                id="password" placeholder="　　　(10文字以内)" required>
        </div>
        <div class="form-group">
            <label>パスワード (再確認)</label><br> <input type="password" maxlength='10' class="form-control" name="pass2"
                oninput="CheckPassword(this)" required>
        </div>

        メールアドレス<br> <input type="email" name="mailaddress" placeholder="sample@example.com" required><br>
        <input type="hidden" name="menu" value="1"> <input type="submit" style="margin-top: 20px;" value="登録する"><br>
    </form>
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