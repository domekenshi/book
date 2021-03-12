package servlet;

import java.io.IOException;
import java.util.ArrayList;

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
@WebServlet("/BookList")
public class BookList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("user");
        String key = request.getParameter("search");
        if(key == null)key = "";


        if(loginUser != null) {
            //BookListDAOから持っている本の配列を取得してリクエストスコープに保存。

            BookListDAO dao = new BookListDAO();
            //ArrayList<Book> bookList = dao.getBookList(loginUser);
            ArrayList<Book> bookList = dao.getSearchBookList(loginUser,key);
            System.out.print(bookList);
            request.setAttribute("bookList", bookList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/searchBookResult.jsp");
            dispatcher.forward(request, response);
        } else{

            response.sendRedirect("/Bookshelf/");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //編集・削除など各動作に対応したリクエストパラメータを確認する
        request.setCharacterEncoding("UTF-8");
        String menu = (String) request.getParameter("menu");


        //ユーザーオブジェクトの取得
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        //DAOパターンのインスタンス化
        BookListDAO dao = new BookListDAO();

        if(menu == null) {

        }else if(menu.equals("bookinfo")){//本の詳細に飛ぶ
            String isbn = (String)request.getParameter("isbn");
            //isbnをもとにbookオブジェクトを取得してきてリクエストスコープに保存する
            Book book = dao.getBookInfo(user,isbn);
            request.setAttribute("book", book);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/bookInfo.jsp");
            dispatcher.forward(request, response);
        }else if(menu.equals("submit")){//本の情報を更新する
            System.out.println("submit");

            BookObjectLogic bol = new BookObjectLogic();
            Book book = bol.makeBookObject(request);

            //DBに登録されているデータと重複がないかチェックする
            boolean isDuplicate = dao.isDuplicate(user,book);

            if (isDuplicate == false) {// 重複していない
                // DAO経由でデータベースに格納
                boolean isUpdate = dao.updateBook(user, book);

                if (isUpdate) {// 成功時、成功メッセージをリクエストスコープに保存
                    System.out.println("情報を更新しました。");
                    Msg msg = new Msg("情報を更新しました。");
                    request.setAttribute("msg", msg);
                } else {
                    System.out.println("更新に失敗しました。");
                    Msg msg = new Msg("更新に失敗しました。");
                    request.setAttribute("msg", msg);
                }
            } else {
                System.out.println("既に登録されている本とISBNが重複しています。");
                Msg msg = new Msg("既に登録されている本とISBNが重複しています。");
                request.setAttribute("msg", msg);
            }
            doGet(request, response);//もう一度入力ページのjspに戻る
        }else if(menu.equals("delete")){//本を削除する
            request.setCharacterEncoding("UTF-8");
            String isbn = (String) request.getParameter("isbn");
            dao.deleteBook(user,isbn);
            Msg msg = new Msg("削除しました");
            request.setAttribute("msg", msg);
            doGet(request, response);//もう一度入力ページのjspに戻る
        }

	}

}
