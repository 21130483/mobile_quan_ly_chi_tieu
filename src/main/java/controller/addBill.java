package controller;

import dao.billsDAO;
import dao.contentBillDAO;
import dao.userDAO;
import model.contentBill;
import model.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet("/html/addBill")
public class addBill extends HttpServlet {
    @Override

//    2. check xem đăng nhâ chưa
//    nếu chưa đăng nhập sẽ đâỷ sang login để đăng nhập
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        user user = (user) session.getAttribute("user");
        if (user != null) {
            int type = Integer.parseInt(req.getParameter("type"));
            contentBillDAO contentBillDAO = new contentBillDAO();
            List<contentBill> contentBills  = contentBillDAO.getAllCBByTypeBillID(type);
            req.setAttribute("typeBill",type);
            req.setAttribute("contentBills",contentBills);
            req.getRequestDispatcher("addBill.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("login.jsp");
        }

    }
    //8 .servel lấy dữ liệu từ GUI lưu vào CSDL
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        user user = (user) session.getAttribute("user");
        int type = Integer.parseInt(req.getParameter("type"));
        System.out.println(type);
        int contentBillId = Integer.parseInt(req.getParameter("contentbill"));
        System.out.println(contentBillId);
        String date = req.getParameter("date");
        System.out.println(date);
        int money = Integer.parseInt(req.getParameter("money"));
        billsDAO billsDAO = new billsDAO();
        billsDAO.addBill(user.getId(),contentBillId,money,date);

        //9. lưu thành công, chuyển sang màn hình chính
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
}
