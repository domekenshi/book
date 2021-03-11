package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.User;

public class UserDAO {
    private final String JDBC_URL = "jdbc:mysql://172.16.61.104:3306/bookshelf";
    private final String DB_USER = "alluser";
    private final String DB_PASS = "userpass";

    public UserDAO() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public List<User> findAll() {// ユーザーリストの作成
        List<User> userList = new ArrayList<>();

        // データベース接続
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
            // SQL分を変数に代入
            String sql = "SELECT*FROM USERLIST ORDER BY ID DESC";
            PreparedStatement pStmt = conn.prepareStatement(sql);
            // 実行結果を取得した結果を代入
            ResultSet rs = pStmt.executeQuery();
            // 1行１行調べていく
            while (rs.next()) {
                int id = rs.getInt("ID");
                String userName = rs.getString("NAME");
                String password = rs.getString("PASSWORD");
                String address = rs.getString("MAILADDRESS");
                // ユーザーbeansのコンストラクタ呼び出し
                User user = new User(id, userName, password, address);
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;

        }
        return userList;
    }

    public List<User> findExceptUser(User user) {// ログインユーザー以外のリストを取得
        List<User> exuserList = new ArrayList<>();

        // データベース接続
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {

            StringBuilder sb = new StringBuilder();
            sb.append("SELECT * FROM userlist WHERE NOT id =");
            sb.append(user.getId());
            sb.append(";");
            String sql = sb.toString();

            PreparedStatement pStmt = conn.prepareStatement(sql);
            // 実行結果を取得した結果を代入
            ResultSet rs = pStmt.executeQuery();
            // 1行１行調べていく
            while (rs.next()) {
                int id = rs.getInt("ID");
                String userName = rs.getString("NAME");
                String password = rs.getString("PASSWORD");
                String address = rs.getString("MAILADDRESS");
                // ユーザーbeansのコンストラクタ呼び出し
                User exuser = new User(id, userName, password, address);
                exuserList.add(exuser);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;

        }
        return exuserList;
    }

    // 新規作成されたUserをDBに登録する
    public boolean addUser(User user) {
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
            // SQL分を変数に代入
            String sql = "INSERT INTO USERLIST (name,password,mailaddress) VALUES(?,?,?)";
            PreparedStatement pStmt = conn.prepareStatement(sql);
            // ？に値を代入

            pStmt.setString(1, user.getUserName());
            pStmt.setString(2, user.getPassword());
            pStmt.setString(3, user.getAddress());
            // アップデートできるか
            int result = pStmt.executeUpdate();
            if (result != 1) {// アップデートできなかった場合
                return false;
            }
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int getId(User user) {// 新規作成したユーザーにidを付与する
        int id = -1;

        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
            String sql = "SELECT ID, MAILADDRESS FROM USERLIST WHERE MAILADDRESS IN (\'" + user.getAddress() + "\')";
            PreparedStatement pStmt = conn.prepareStatement(sql);
            ResultSet rs = pStmt.executeQuery();

            String userAddress = user.getAddress();
            rs.next();
            String address = rs.getString("MAILADDRESS");
            id = rs.getInt("id");

            if (!userAddress.equals(address)) {
                return -1;
            }
            return id;
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    public boolean upDateUser(User user) { // DBに登録されているユーザー情報の更新

        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) { // DBに接続

            // SQL文を変数に代入

            StringBuilder sb = new StringBuilder();
            sb.append("UPDATE userlist SET name = ? , password = ? ,  mailaddress = ? WHERE id = ");
            sb.append(user.getId());
            sb.append(";");

            String sql = sb.toString();
            PreparedStatement pStmt = conn.prepareStatement(sql);

            // ？に値を代入
            pStmt.setString(1, user.getUserName());
            pStmt.setString(2, user.getPassword());
            pStmt.setString(3, user.getAddress());

            // アップデートできるか
            int result = pStmt.executeUpdate();
            if (result != 1) {// アップデートできなかった場合
                return false;
            }
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteUser(User user) { // DBに登録されているユーザー情報を削除するメソッド
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) { // DBに接続

            // SQL文を変数に代入
            String sql = "DELETE FROM USERLIST WHERE user.getId()";

            // 静的SQL文を実行するための、Statementオブジェクトを取得
            Statement st = conn.createStatement();

            // 削除されたレコード数
            int result = st.executeUpdate(sql);

            if (result != 1) {// 削除できなかった場合
                return false;
            }
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
