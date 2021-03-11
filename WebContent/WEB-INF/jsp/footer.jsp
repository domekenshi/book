<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<footer class="footer">
<div class="container">
  <div class="text-muted">My Bookshelf　制作委員会</div>
  <small>Copyright © 2021 toy</small>
  <a href="/Bookshelf/Menu?menu=logout">ログアウト</a>
  </div>

</footer>
<style>
html {
  position: relative;
  min-height: 100%;
}
body {
  /* Margin bottom by footer height */
  margin-bottom: 60px;
  text-align:center;
}
.footer {
  position: absolute;
  bottom: 0;
  width: 100%;
  /* Set the fixed height of the footer here */
  height: 100px;
  background-color: #f5f5f5;
}
/* Custom page CSS
-------------------------------------------------- */
/* Not required for template or sticky footer method. */
.container {
  width: auto;
  max-width: 680px;
  padding: 0 15px;
}
.container .text-muted {
  margin: 20px 0;
}
small{
margin-right:50px;
}
</style>