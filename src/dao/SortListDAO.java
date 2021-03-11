package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Book;
import beans.User;
import model.BookObjectLogic;

public class SortListDAO {
    private final String JDBC_URL = "jdbc:mysql://172.16.61.104:3306/bookshelf";
    private final String DB_USER = "alluser";
    private final String DB_PASS = "userpass";

    public SortListDAO() {//コンストラクタ
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    //引数orderに渡すとよさそうなもの
    //price,evaluation,getdate,publishdate（progressも渡せるが現状使えてないので…）



    //BOOKLIST-引数で受け取った列の昇順(小さい順)で並べ替えるメソッド
    public ArrayList<Book> sortBookListASC(User user,String order) {
        ArrayList<Book> bookList = new ArrayList<Book>();
        // データベースに接続
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
            // セレクト文の作成
            StringBuilder sb = new StringBuilder();
            sb.append("SELECT *  FROM bookshelf_");// ここにUserから取得したidを入れる
            sb.append(user.getId());
            sb.append(" WHERE getdate is NOT NULL ");
            sb.append("ORDER BY ");
            sb.append(order);//整列キー
            sb.append(" ASC");
            String sql = sb.toString();
            PreparedStatement pStmt = conn.prepareStatement(sql);
            // 結果表の取得
            ResultSet rs = pStmt.executeQuery();
            // 結果表のレコードの内容をBookインスタンスに設定し、ArrayListに格納
            while (rs.next()) {
                BookObjectLogic bol = new BookObjectLogic();
                Book book = bol.makeBookObject(rs);

                // Bookオブジェクトを配列に格納
                bookList.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookList;
    }

    //BOOKLIST-引数で受け取った列の昇順(大きい順)で並べ替えるメソッド
    public ArrayList<Book> sortBookListDESC(User user,String order) {
        ArrayList<Book> bookList = new ArrayList<Book>();
        // データベースに接続
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
            // セレクト文の作成
            StringBuilder sb = new StringBuilder();
            sb.append("SELECT *  FROM bookshelf_");// ここにUserから取得したidを入れる
            sb.append(user.getId());
            sb.append(" WHERE getdate is NOT NULL ");
            sb.append("ORDER BY ");
            sb.append(order);//整列キー
            sb.append(" DESC");
            String sql = sb.toString();
            PreparedStatement pStmt = conn.prepareStatement(sql);
            // 結果表の取得
            ResultSet rs = pStmt.executeQuery();
            // 結果表のレコードの内容をBookインスタンスに設定し、ArrayListに格納
            while (rs.next()) {
                BookObjectLogic bol = new BookObjectLogic();
                Book book = bol.makeBookObject(rs);

                // Bookオブジェクトを配列に格納
                bookList.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookList;
    }

    //BOOKLIST-引数で受け取った列の昇順(小さい順)で並べ替えるメソッド
    public ArrayList<Book> sortWantListASC(User user,String order) {
        ArrayList<Book> bookList = new ArrayList<Book>();
        // データベースに接続
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
            // セレクト文の作成
            StringBuilder sb = new StringBuilder();
            sb.append("SELECT *  FROM bookshelf_");// ここにUserから取得したidを入れる
            sb.append(user.getId());
            sb.append(" WHERE getdate is NULL ");
            sb.append("ORDER BY ");
            sb.append(order);//整列キー
            sb.append(" ASC");
            String sql = sb.toString();
            PreparedStatement pStmt = conn.prepareStatement(sql);
            // 結果表の取得
            ResultSet rs = pStmt.executeQuery();
            // 結果表のレコードの内容をBookインスタンスに設定し、ArrayListに格納
            while (rs.next()) {
                BookObjectLogic bol = new BookObjectLogic();
                Book book = bol.makeBookObject(rs);

                // Bookオブジェクトを配列に格納
                bookList.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookList;
    }

    //BOOKLIST-引数で受け取った列の昇順(大きい順)で並べ替えるメソッド
    public ArrayList<Book> sortWantListDESC(User user,String order) {
        ArrayList<Book> bookList = new ArrayList<Book>();
        // データベースに接続
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
            // セレクト文の作成
            StringBuilder sb = new StringBuilder();
            sb.append("SELECT *  FROM bookshelf_");// ここにUserから取得したidを入れる
            sb.append(user.getId());
            sb.append(" WHERE getdate is NULL ");
            sb.append("ORDER BY ");
            sb.append(order);//整列キー
            sb.append(" DESC");
            String sql = sb.toString();
            PreparedStatement pStmt = conn.prepareStatement(sql);
            // 結果表の取得
            ResultSet rs = pStmt.executeQuery();
            // 結果表のレコードの内容をBookインスタンスに設定し、ArrayListに格納
            while (rs.next()) {
                BookObjectLogic bol = new BookObjectLogic();
                Book book = bol.makeBookObject(rs);

                // Bookオブジェクトを配列に格納
                bookList.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookList;
    }




}
