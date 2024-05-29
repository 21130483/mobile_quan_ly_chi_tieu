package controller;

import dao.userDAO;
import model.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/html/login")
public class login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username") == null ? "" : (String) req.getParameter("username");
        String pass = req.getParameter("password") == null ? "" : (String) req.getParameter("password");
        userDAO userDAO = new userDAO();
        user user = userDAO.checkLogin(username, pass);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            resp.sendRedirect("index.jsp");


        } else {
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
