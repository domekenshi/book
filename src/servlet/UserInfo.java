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
import dao.UserDAO;
import model.CheckLogic;

/**
 * Servlet implementation class AddBook
 */
@WebServlet("/UserInfo")
public class UserInfo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserInfo() {
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
        if(loginUser != null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userInfo.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("/Bookshelf/");
        }
    }


    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String pass1 =request.getParameter ("pass1");
        String address = request.getParameter("mailaddress");

        System.out.println(name);
        System.out.println(pass1);
        System.out.println(address);

        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("user");

        User changeUser = new User(loginUser.getId(),name, pass1, address);

        CheckLogic checkLogic = new CheckLogic();
        boolean isCheck = checkLogic.excheck(changeUser);

        if(isCheck) {
            System.out.println("重複チェックOK");
            UserDAO dao = new UserDAO();
            boolean isUpdate = dao.upDateUser(changeUser);
            if(isUpdate) {
                session.setAttribute("user", changeUser);
                System.out.println("変更完了");
                Msg msg = new Msg("変更しました。");
                request.setAttribute("msg",msg );
            } else {
                System.out.println("変更失敗");
                Msg msg = new Msg("変更に失敗しました。");
                request.setAttribute("msg",msg );
            }
        }else {
            System.out.println("重複チェックNG");
            Msg msg = new Msg("ユーザＩＤかメールアドレスが既に使用されています。");
            request.setAttribute("msg",msg );
        }

        System.out.println("doGet前");
        doGet(request, response);
    }

}
