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
@WebServlet("/WantBook")
public class WantBook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public WantBook() {
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
        request.setCharacterEncoding("UTF-8");
        // ソート機能用の予備
//        String  order = (String) request.getParameter("order");
//        String  mode = (String) request.getParameter("mode");
        String search = (String) request.getParameter("search");

        if (loginUser != null) {
            // BookListDAOから持っている本の配列を取得してリクエストスコープに保存。
            BookListDAO dao = new BookListDAO();
            ArrayList<Book> bookList = null;
            if (search == null) {
                bookList = dao.getWantBook(loginUser);
            } else if (search.length() == 0) {// サーチの中身が空欄の時もリスト全部を返す
                bookList = dao.getWantBook(loginUser);
            } else {// サーチの中に単語が入ってる場合
                bookList = dao.getSearchWantList(loginUser, search);
            }

//ソート機能用の予備
//            if(order == null) {
//                bookList = dao.getBookList(loginUser);
//            }else if(mode == null) {
//                bookList = dao.sortBookListASC(loginUser,order);
//            } else {
//                bookList = dao.sortBookListDESC(loginUser,order);
//            }
            request.setAttribute("bookList", bookList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/wantBookList.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("/Bookshelf/");
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("サーブレット");
        // 編集・削除など各動作に対応したリクエストパラメータを確認する
        request.setCharacterEncoding("UTF-8");
        String menu = (String) request.getParameter("menu");

        // ユーザーオブジェクトの取得
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        // DAOパターンのインスタンス化
        BookListDAO dao = new BookListDAO();

        if (menu == null) {
            doGet(request, response);
        } else if (menu.equals("bookinfo")) {// 本の詳細に飛ぶ
            String isbn = (String) request.getParameter("isbn");
            // isbnをもとにbookオブジェクトを取得してきてリクエストスコープに保存する
            Book book = dao.getBookInfo(user, isbn);
            request.setAttribute("book", book);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/wantBookInfo.jsp");
            dispatcher.forward(request, response);
        } else if (menu.equals("submit")) {// 本の情報を更新する
            BookObjectLogic bol = new BookObjectLogic();
            Book book = bol.makeBookObject(request);

            // DBに登録されているデータと重複がないかチェックする
            boolean isDuplicate = dao.isDuplicate(user, book);

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
        } else if (menu.equals("delete")) {// 本を削除する
            request.setCharacterEncoding("UTF-8");
            String isbn = (String) request.getParameter("isbn");
            dao.deleteBook(user, isbn);
            Msg msg = new Msg("削除しました");
            request.setAttribute("msg", msg);
            doGet(request, response);//もう一度入力ページのjspに戻る
        }

    }

}
