package model;

import java.util.List;
import java.util.regex.Pattern;

import beans.User;
import dao.UserDAO;

public class CheckLogic {
    public boolean check(String name, String pass1, String pass2, String mailaddress) {
        UserDAO dao = new UserDAO();
        List<User> list = dao.findAll();

        for (User user : list) {

            String uname = user.getUserName();
            if (uname.equals(name)) {
                return false;
            }
        }


        // メールアドレス正規表現をpatternに代入
        String pattern = "^([a-zA-Z0-9])+([a-zA-Z0-9\\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\\._-]+)+$";
        Pattern p = Pattern.compile(pattern);
        boolean pass = false;
        boolean address = false;


        if (pass1.equals(pass2)) {
            pass = true;
        }
        // アドレスの文法チェックと登録済みアドレスとの被りチェック
        if (p.matcher(mailaddress).find()) {

            // ユーザの名前とパスワードが合致したものを返す。
            for (User user : list) {

                String uaddress = user.getAddress();
                if (mailaddress.equals(uaddress)) {
                    return false;
                }
            }
            address = true;
        }

        if (pass && address) {
            return true;
        }
        return false;
    }

    //ログインユーザー以外と被っていないかチェックするメソッド
    public boolean excheck(User user) {
        boolean name = false;
        boolean address = false;
        UserDAO dao = new UserDAO();
        List<User> list = dao.findExceptUser(user);

        //ユーザーリストに登録されている名前とログインユーザーの名前が被っていないか
        for (User exuser : list) {

            String uname = exuser.getUserName();
            if (uname.equals(user.getUserName())) {
                return false;
            }
            name = true;
        }

        // ユーザーリストに登録されているメールアドレスとログインユーザーのメールアドレスが被っていないかチェック
        for (User exuser : list) {

            String uaddress = exuser.getAddress();
            if (uaddress.equals(user.getAddress())) {
                return false;
            }
            address = true;
        }



        if (name && address) {
            return true;
        }
        return false;
    }
}