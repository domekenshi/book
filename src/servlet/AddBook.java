package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Book;
import beans.Msg;
import beans.User;
import dao.BookListDAO;
import model.BookObjectLogic;

/**
 * Servlet implementation class AddBook
 */
@WebServlet("/AddBook")
public class AddBook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBook() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        // response.getWriter().append("Served at: ").append(request.getContextPath());
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("user");
        RequestDispatcher dispatcher = null;
        if (loginUser != null) {
            dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/addBook.jsp");
        } else {
            response.sendRedirect("/Bookshelf/");
        }
        dispatcher.forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Userオブジェクトをセッションスコープから取得
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        BookObjectLogic bol = new BookObjectLogic();
        Book book = bol.makeAddBookObject(request);

        //DAOパターンのオブジェクトを取得
        BookListDAO dao = new BookListDAO();

        //DBに登録されているデータと重複がないかチェックする
        boolean isDuplicate = dao.isDuplicate(user,book);

        if(isDuplicate == false) {//重複していない
            //DAO経由でデータベースに格納
            boolean isAdd = dao.addBook(user, book);

            if(isAdd) {//成功時、成功メッセージをリクエストスコープに保存
                System.out.println("追加に成功しました。");
                Msg msg = new Msg("追加に成功しました。");
                request.setAttribute("msg",msg );
            }else {
                System.out.println("追加に失敗しました。");
                Msg msg = new Msg("追加に失敗しました。");
                request.setAttribute("msg",msg );
            }
        }else {
            System.out.println("この本は既に登録されています。");
            Msg msg = new Msg("この本は既に登録されています。");
            request.setAttribute("msg",msg );
        }
        doGet(request, response);//もう一度入力ページのjspに戻る
    }
}
