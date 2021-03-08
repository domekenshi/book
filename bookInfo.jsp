<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css">
<title>編集</title>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/header.jsp" />
    <br>
    <br>
    <h1>本の情報を編集</h1>
    <br>
    <br>
    <form action="" method="GET">
        <table border="1">
            <tr>
                <td><input type="text" name=""></td>
                <td><input type="text" name=""></td>
                <td><input type="text" name=""></td>
            </tr>
        </table>

        <input type="submit" name="update" value="更新">
    </form>
    <input type="submit" name="delete" value="削除">
    <jsp:include page="/WEB-INF/jsp/footer.jsp" />
</body>
</html>