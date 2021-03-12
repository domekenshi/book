package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import beans.Book;
import beans.User;
import model.BookObjectLogic;

public class BookListDAO {
    private final String JDBC_URL = "jdbc:mysql://172.16.61.104:3306/bookshelf";
    private final String DB_USER = "alluser";
    private final String DB_PASS = "userpass";

    public BookListDAO() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public boolean createList(User user) {
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
            StringBuilder sb = new StringBuilder();
            sb.append("CREATE TABLE bookshelf_");// ここにUserから取得したidを入れる
            sb.append(user.getId());
            // isbn20桁に変更
            sb.append(
                    " (isbn VARCHAR(40) NOT NULL,title VARCHAR(350) NOT NULL,authors VARCHAR(100),publisher VARCHAR(100),price INT,evaluation INT,progress INT,getdate DATE,publishdate Date,memo VARCHAR(100),url VARCHAR(300) ,PRIMARY KEY(isbn));");
            String sql = sb.toString();

            Statement st = conn.createStatement();
            System.out.println(sql);
            st.executeUpdate(sql);

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public ArrayList<Book> getBookList(User user) {
        ArrayList<Book> bookList = new ArrayList<Book>();
        // データベースに接続
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
            // セレクト文の作成
            StringBuilder sb = new StringBuilder();
            sb.append("SELECT *  FROM bookshelf_");// ここにUserから取得したidを入れる
            sb.append(user.getId());
            sb.append(" WHERE getdate is NOT NULL");
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

    public ArrayList<Book> getWantBook(User user) {
        ArrayList<Book> bookList = new ArrayList<Book>();
        // データベースに接続
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
            // セレクト文の作成
            StringBuilder sb = new StringBuilder();
            sb.append("SELECT * FROM bookshelf_");// ここにUserから取得したidを入れる
            sb.append(user.getId());
            sb.append(" WHERE getdate is NULL");
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

    // 各ユーザーのテーブルに本の情報を追加する
    public boolean addBook(User user, Book book) {
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
            StringBuilder sb = new StringBuilder();
            sb.append("INSERT INTO bookshelf_");
            sb.append(user.getId());
            sb.append(" VALUES (?,?,?,?,?,?,?,?,?,?,?)");
            String sql = sb.toString();
            PreparedStatement st = conn.prepareStatement(sql);

            // プレースホルダにセット
            st.setString(1, book.getIsbn());
            st.setString(2, book.getTitle());
            st.setString(3, book.getAuthors());
            st.setString(4, book.getPublisher());
            st.setInt(5, book.getPrice());
            st.setInt(6, book.getEvaluation());
            st.setInt(7, book.getProgress());
            st.setDate(8, book.getGetDate());
            st.setDate(9, book.getPublishDate());
            st.setString(10, book.getMemo());
            st.setString(11, book.getImgURL());

            int count = st.executeUpdate();
            if (count == 1) {// 戻り値1＝更新成功の場合
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return false;
    }

    public boolean deleteBook(User user, String isbn) {// ISBNで行を指定してデータを削除する
        // データベースに接続
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
            // SQL文の作成
            StringBuilder sb = new StringBuilder();
            sb.append("DELETE FROM bookshelf_");
            sb.append(user.getId());
            sb.append(" WHERE isbn ='");
            sb.append(isbn);
            sb.append("'");
            String sql = sb.toString();

            Statement st = conn.createStatement();

            int count = st.executeUpdate(sql);

            if (count == 1) {
                return true;
            }
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return true;
        }
    }

    public boolean isDuplicate(User user, Book book) {// データベースに登録されている本と重複を確認する。してなければfalse
        // データベースに接続
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
            // SQL文の作成
            StringBuilder sb = new StringBuilder();
            sb.append("SELECT isbn FROM bookshelf_");
            sb.append(user.getId());
            sb.append(" WHERE isbn = \' ");
            sb.append(book.getIsbn());
            sb.append("\';");
            String sql = sb.toString();
            System.out.println(book.getIsbn());
            System.out.println(sql);
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            boolean isDuplicate = rs.next();
            return isDuplicate;

        } catch (SQLException e) {
            e.printStackTrace();
            return true;
        }
    }

    // ISBNをもとに１冊の本のデータをデータベースから取得してくる
    public Book getBookInfo(User user, String isbn) {
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
            // セレクト文の作成
            StringBuilder sb = new StringBuilder();
            sb.append("SELECT *  FROM bookshelf_");// ここにUserから取得したidを入れる
            sb.append(user.getId());
            sb.append(" WHERE isbn = \'");
            sb.append(isbn);
            sb.append("\';");
            String sql = sb.toString();

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            Book book = null;

            while (rs.next()) {
                BookObjectLogic bol = new BookObjectLogic();
                book = bol.makeBookObject(rs);
            }
            return book;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // ユーザーのテーブルにある本の情報を修正する
    public boolean updateBook(User user, Book book) {
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
            StringBuilder sb = new StringBuilder();
            sb.append("UPDATE bookshelf_");
            sb.append(user.getId());
            sb.append(
                    " SET isbn = ?, title = ? , authors = ? , publisher = ? , price = ? , evaluation = ? , progress = ? , getdate = ? , publishdate = ? , memo = ?  ");
            sb.append("WHERE isbn = \'");
            sb.append(book.getIsbn());
            sb.append("\'");

            String sql = sb.toString();
            PreparedStatement st = conn.prepareStatement(sql);

            // プレースホルダにセット
            st.setString(1, book.getIsbn());
            st.setString(2, book.getTitle());
            st.setString(3, book.getAuthors());
            st.setString(4, book.getPublisher());
            st.setInt(5, book.getPrice());
            st.setInt(6, book.getEvaluation());
            st.setInt(7, book.getProgress());
            st.setDate(8, book.getGetDate());
            st.setDate(9, book.getPublishDate());
            st.setString(10, book.getMemo());

            int count = st.executeUpdate();
            if (count == 1) {// 戻り値1＝更新成功の場合
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return false;
    }

    // 検索機能
    //持ってる本
    public ArrayList<Book> getSearchBookList(User user, String keyword) {
        ArrayList<Book> list = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
            // セレクト文の作成
            StringBuilder sb = new StringBuilder();
            sb.append("SELECT * FROM bookshelf_");// ここにUserから取得したidを入れる
            sb.append(user.getId());
            sb.append(" WHERE title LIKE ?");
            sb.append(" AND getdate is NOT NULL");
            String sql = sb.toString();

            // プリペアードステートメント
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "%"+ keyword + "%");

            ResultSet rs = st.executeQuery();


            while (rs.next()) {
                BookObjectLogic bol = new BookObjectLogic();
                Book book = bol.makeBookObject(rs);

                list.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<Book> getSearchWantList(User user, String keyword) {
        ArrayList<Book> list = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
            // セレクト文の作成
            StringBuilder sb = new StringBuilder();
            sb.append("SELECT * FROM bookshelf_");// ここにUserから取得したidを入れる
            sb.append(user.getId());
            sb.append(" WHERE title LIKE ?");
            sb.append(" AND getdate is NULL");
            String sql = sb.toString();

            // プリペアードステートメント
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "%"+ keyword + "%");

            ResultSet rs = st.executeQuery();


            while (rs.next()) {
                BookObjectLogic bol = new BookObjectLogic();
                Book book = bol.makeBookObject(rs);

                list.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // ソート機能
    // 引数orderに渡すとよさそうなもの
    // price,evaluation,getdate,publishdate（progressも渡せるが現状使えてないので…）

    // BOOKLIST-引数で受け取った列の昇順(小さい順)で並べ替えるメソッド
    public ArrayList<Book> sortBookListASC(User user, String order) {
        ArrayList<Book> bookList = new ArrayList<Book>();
        // データベースに接続
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
            // セレクト文の作成
            StringBuilder sb = new StringBuilder();
            sb.append("SELECT *  FROM bookshelf_");// ここにUserから取得したidを入れる
            sb.append(user.getId());
            sb.append(" WHERE getdate is NOT NULL ");
            sb.append("ORDER BY ");
            sb.append(order);// 整列キー
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

    // BOOKLIST-引数で受け取った列の昇順(大きい順)で並べ替えるメソッド
    public ArrayList<Book> sortBookListDESC(User user, String order) {
        ArrayList<Book> bookList = new ArrayList<Book>();
        // データベースに接続
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
            // セレクト文の作成
            StringBuilder sb = new StringBuilder();
            sb.append("SELECT *  FROM bookshelf_");// ここにUserから取得したidを入れる
            sb.append(user.getId());
            sb.append(" WHERE getdate is NOT NULL ");
            sb.append("ORDER BY ");
            sb.append(order);// 整列キー
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

    // BOOKLIST-引数で受け取った列の昇順(小さい順)で並べ替えるメソッド
    public ArrayList<Book> sortWantListASC(User user, String order) {
        ArrayList<Book> bookList = new ArrayList<Book>();
        // データベースに接続
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
            // セレクト文の作成
            StringBuilder sb = new StringBuilder();
            sb.append("SELECT *  FROM bookshelf_");// ここにUserから取得したidを入れる
            sb.append(user.getId());
            sb.append(" WHERE getdate is NULL ");
            sb.append("ORDER BY ");
            sb.append(order);// 整列キー
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

    // BOOKLIST-引数で受け取った列の昇順(大きい順)で並べ替えるメソッド
    public ArrayList<Book> sortWantListDESC(User user, String order) {
        ArrayList<Book> bookList = new ArrayList<Book>();
        // データベースに接続
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
            // セレクト文の作成
            StringBuilder sb = new StringBuilder();
            sb.append("SELECT *  FROM bookshelf_");// ここにUserから取得したidを入れる
            sb.append(user.getId());
            sb.append(" WHERE getdate is NULL ");
            sb.append("ORDER BY ");
            sb.append(order);// 整列キー
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