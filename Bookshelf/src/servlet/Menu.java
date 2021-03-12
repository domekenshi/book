package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.User;

/**
 * Servlet implementation class Menu
 */
@WebServlet("/Menu")
public class Menu extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Menu() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       String url = "/Bookshelf/";
	    //セッションスコープにUserオブジェクトがあるか確認
	       HttpSession session = request.getSession();
	       User user = (User)session.getAttribute("user");

	       //ログイン状態で分岐処理
	       if(user == null) { //無いとき＝ログイン処理を通ってきていないとき
	          //URLそのまんま＝index.jspへ送る
	       }else {//ある時＝ログインしているユーザーであるとき
	           //ヘッダーからのリクエストパラメータを確認する
	           request.setCharacterEncoding("UTF-8");
	           String menu = (String) request.getParameter("menu");
	           if(menu == null) {//リクエストスコープ無し（ログイン直後も含む）
	               url="/Bookshelf/BookList";
	           }else if(menu.equals("search")) {
	               url="/Bookshelf/SearchBook";
	           }else if(menu.equals("add")) {
	               url="/Bookshelf/AddBook";
               }else if(menu.equals("want")) {
                   url="/Bookshelf/WantBook";
               }else if(menu.equals("info")) {
                   url="/Bookshelf/UserInfo";
               }else if(menu.equals("logout")) {//ログアウト
                  //セッションスコープのユーザーオブジェクトを破棄
                   session.removeAttribute("user");
               }
	       }
        //指定したページへリダイレクト
        response.sendRedirect(url);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
