package model;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import beans.Book;

public class BookObjectLogic {

    // リクエストスコープから貰ってきた情報をもとにBookオブジェクトを作る
    public Book makeBookObject(HttpServletRequest request) {
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            // TODO 自動生成された catch ブロック
            e.printStackTrace();
        }
        String isbn = (String) request.getParameter("isbn");
        String title = (String) request.getParameter("title");
        String authors = (String) request.getParameter("authors");
        String publisher = (String) request.getParameter("publisher");
        String price = (String) request.getParameter("price");
        String evaluation = (String) request.getParameter("evaluation");
        String progress = (String) request.getParameter("progress");
        String getDate = (String) request.getParameter("getDate");
        String publishDate = (String) request.getParameter("publishDate");
        String memo = (String) request.getParameter("memo");
        String imgURL = (String) request.getParameter("imgURL");

        // 受け取った情報をbookオブジェクトに格納
        Book book = new Book(isbn, title, authors, publisher, price, evaluation, progress, getDate, publishDate, memo,
                imgURL);

        return book;
    }

    // リクエストスコープから貰ってきた情報をもとにBookオブジェクトを作る(addBook.jspから追加時)
    public Book makeAddBookObject(HttpServletRequest request) {
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            // TODO 自動生成された catch ブロック
            e.printStackTrace();
        }
        String isbnA = (String) request.getParameter("isbn");// isbn検索自動入力
        String isbnB = (String) request.getParameter("isbn2");// isbn手入力

        String isbn = checkIsbn(isbnA, isbnB);// どちらの値を適用するかチェックする

        String titleA = (String) request.getParameter("title");
        String titleB = (String) request.getParameter("title2");
        String title = checkTitle(titleA, titleB);

        title = (String) request.getParameter("title");
        String authors = (String) request.getParameter("authors");
        String publisher = (String) request.getParameter("publisher");
        String price = (String) request.getParameter("price");
        String evaluation = (String) request.getParameter("evaluation");
        String progress = (String) request.getParameter("progress");
        String getDate = (String) request.getParameter("getDate");
        String publishDate = (String) request.getParameter("publishDate");
        String memo = (String) request.getParameter("memo");
        String imgURL = (String) request.getParameter("imgURL");

        // 受け取った情報をbookオブジェクトに格納
        Book book = new Book(isbn, title, authors, publisher, price, evaluation, progress, getDate, publishDate, memo,
                imgURL);

        return book;
    }

    // DBからもらってきた情報をもとにBookオブジェクトを作る
    public Book makeBookObject(ResultSet rs) throws SQLException {
        String isbn = rs.getString("isbn");
        String title = rs.getString("title");
        String authors = rs.getString("authors");
        String publisher = rs.getString("publisher");
        int price = rs.getInt("price");
        int evaluation = rs.getInt("evaluation");
        int progress = rs.getInt("progress");
        Date getDate = rs.getDate("getdate");
        Date publishDate = rs.getDate("publishdate");
        String memo = rs.getString("memo");
        String imgURL = rs.getString("url");

        // 取得した情報をBookオブジェクトを作り格納
        Book book = new Book(isbn, title, authors, publisher, price, evaluation, progress, getDate, publishDate, memo,
                imgURL);
        return book;
    }

    private String checkIsbn(String isbnA, String isbnB) {
        // 自動入力が入っていれば自動入力を優先する
        if (isbnA != null) {// nullでない
            if (isbnA.length() != 0) {// なおかつ空欄ではない
                return isbnA;// Aをisbnとして扱う
            }
        }
        // 手入力ISBNがノーガードなので、エラー出るかも
        return isbnB;
    }

    private String checkTitle(String titleA, String titleB) {
        // 自動入力が入っていれば自動入力を優先する
        if (titleA != null) {// nullでない
            if (titleA.length() != 0) {// なおかつ空欄ではない
                return titleA;// Aをisbnとして扱う
            }
        }
        // 手入力タイトルがノーガードなので、エラー出るかも
        return titleB;
    }

}
