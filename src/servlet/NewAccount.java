package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Msg;
import beans.User;
import dao.BookListDAO;
import dao.UserDAO;
import model.CheckLogic;

/**
 * Servlet implementation class NewAccount
 */
@WebServlet("/NewAccount")
public class NewAccount extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 入力ページに送り返す
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/newAccount.jsp");
        dispatcher.forward(request, response);
    }

    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//リクエストパラメータ取得
	    request.setCharacterEncoding("UTF-8");
        String menu = (String) request.getParameter("menu");

        if (menu.equals("1")) {// 登録情報が送られてきた場合
            //リクエストパラメータ取得
            String name = (String) request.getParameter("name");
            String pass1 = (String) request.getParameter("pass1");
            String pass2 = (String) request.getParameter("pass2");
            String mailAddress = (String) request.getParameter("mailaddress");

            //綴りやアドレス被りをチェック
            CheckLogic cl = new CheckLogic();
            boolean isCheck = cl.check(name,pass1,pass2,mailAddress);

            if(isCheck) {//アドレス被りなし、綴りOK
                //Userオブジェクトを作ってセッションスコープに保存する
                User user = new User(name,pass1,mailAddress);
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                //確認画面にフォワード
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/checkAccount.jsp");
                dispatcher.forward(request, response);

            }else {//何らかの不具合アリ
                Msg msg = new Msg("入力内容のいずれかに誤りがあります。");
                request.setAttribute("msg", msg);
                doGet(request, response);//入力画面に送り返す
            }
        }else if(menu.equals("2")) {//確認画面から来た場合
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");

            //ユーザー登録処理
            UserDAO dao = new UserDAO();
            boolean isAdd = dao.addUser(user);
            //成否判定
            if(isAdd) {//登録成功
                //DBからIDを取得してセッションスコープ上のuserオブジェクトのフィールド：idにもセットする
                //（メインページで本棚と連動させるため）
                user.setId(dao.getId(user));
                BookListDAO bookdao = new BookListDAO();
                bookdao.createList(user);
               System.out.println(user.getId());
                //メインページリダイレクト
                response.sendRedirect("/Bookshelf/Menu");
            }else {//失敗
                //エラーメッセージをリクエストスコープに保存
                Msg msg = new Msg("データベースエラーにより登録失敗");
                request.setAttribute("msg", msg);
                //失敗したのでセッションスコープからuserオブジェクトも削除
                session.removeAttribute("user");
                doGet(request, response);//入力画面に送り返す
            }
        }
	}

}
