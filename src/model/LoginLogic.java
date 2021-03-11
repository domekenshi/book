package model;

import java.util.List;

import beans.User;
import dao.UserDAO;

public class LoginLogic {
    public User isLogin(String name, String pass) {

        UserDAO dao = new UserDAO();
        List<User> list = dao.findAll();

        // ユーザの名前とパスワードが合致したものを返す。
        for (User user : list) {
            System.out.println("チェック");
            String uname = user.getUserName();
            String upass = user.getPassword();

            if (name.equals(uname) &&pass.equals(upass)) {
                return user;
            }
        }
        return null;
    }
}
