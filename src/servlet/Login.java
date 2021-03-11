package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.User;
import model.LoginLogic;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //トップページに送り返す
        RequestDispatcher dispatcher = request.getRequestDispatcher("/");
        dispatcher.forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // リクエストパラメータから番号の取り出し
        request.setCharacterEncoding("UTF-8");
        String menu = (String) request.getParameter("menu");

        if (menu.equals("1")) {// ログインが押されたとき
            String name = (String) request.getParameter("name");
            String pass = (String) request.getParameter("pass");
            LoginLogic logic = new LoginLogic();
            User user = logic.isLogin(name, pass);// ログイン判定する
           System.out.println(user);

            if (user == null) {// 入力に合致するユーザーデータがなかったとき＝ログイン失敗
                doGet(request, response);//doGet()でトップページに送り返す

            } else {// ユーザー名、パスワードがあったとき＝ログイン成功
                // セッションスコープにuserを保存
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                // menuにリダイレクト
                response.sendRedirect("/Bookshelf/Menu");// サーブレットに飛ぶ
            }
        } else if (menu.equals("2")) {// 新規登録が押されたとき
            // 登録画面にフォワード？リダイレクト？する
            RequestDispatcher dispatcher = request.getRequestDispatcher("ユーザー新規登録画面のページのURLが入る予定");
            dispatcher.forward(request, response);
        }
    }
}
