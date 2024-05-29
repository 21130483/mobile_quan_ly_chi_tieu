<%@ page import="model.user" %>
<%@ page import="dao.billsDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="model.bills" %>
<%@ page import="dao.contentBillDAO" %>
<%@ page import="model.contentBill" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/index.css">
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>

<%
    user user = (user) session.getAttribute("user");

    if (user != null) {
%>
<section class="main">

    <section class="thongke">
        <%
            billsDAO billsDAO = (billsDAO) session.getAttribute("billsDAO");
            int plus = dao.billsDAO.getPlusByUserId(user.getId());
            int minus = dao.billsDAO.getMinusByUserId(user.getId());
            int total = dao.billsDAO.getTongByUserId(user.getId());
        %>
        <section class="total">
            <div class="box">
                <p>Thu nhập</p>

                <p class="plus">+<%=plus%></p>
            </div>

            <div class="box">
                <p>Chi tiêu</p>
                <p class="minus">-<%=minus%></p>
            </div>

            <div class="box">
                <p>Toàn bộ</p>
                <%
                    if(total>=0){


                %>
                <p class="plus">+<%=total%></p>
                <%
                }else{
                %>
                <p class="minus"><%=total%></p>
                <%
                }
                %>
            </div>
        </section>
    </section>

    <section class="lists">
        <%
            List<LocalDate> dates = billsDAO.getBillDatesByuserId(user.getId());
            int count = 1;
            for (LocalDate date : dates) {
        %>
        <div class="list">
            <button class="dropdown" onclick="viewDetail('details<%=count%>')">
                <p><%=billsDAO.formatLocalDate(date)%></p>
                <div>
                    <p>chi tiêu:<%=billsDAO.getMinusByUserIdAndDate(user.getId(),date)%>, thu nhập: <%=billsDAO.getPlusByUserIdAndDate(user.getId(),date)%></p>
                </div>

            </button>
            <div class="details" id="details<%=count%>">
                <%
                    List<bills> billsList = billsDAO.getBillsByuserIdAndDate(user.getId(),date);
                    contentBillDAO contentBillDAO = new contentBillDAO();
                    for (bills bill : billsList) {
                        contentBill ctb = contentBillDAO.getCTById(bill.getContentBillId());

                %>
                <div class="detail">
                    <div class="content">
                        <div class="box">
                            <img class="icon" src="../image/contentbill/<%=bill.getContentBillId()%>.png" alt="">
                        </div>
                        <%=ctb.getName()%>
                    </div>

                    <div class="money">
                        <%
                            System.out.println(ctb.getTypeBillId());
                            if (ctb.getTypeBillId()==1){
                        %>
                        <p class="minus">-<%=bill.getMoney()%> đồng</p>
                        <%
                        }else{
                        %>
                        <p class="plus">+<%=bill.getMoney()%> đồng</p>
                        <%
                            }
                        %>

                    </div>
                </div>
                <%
                    }
                %>
            </div>

        </div>
        <%
                count++;
            }
        %>


    </section>
</section>



<script>
    function viewDetail(detailId) {
        var detail = document.getElementById(detailId);
        // console.log(detail.style.display == 'none')
        if (detail.style.display == 'none') {
            detail.style.display = 'flex';
        } else {
            detail.style.display = 'none';
        }

    }
</script>


<%
    }else{
%>
<div class="unuser">
    Bạn chưa đăng nhập
</div>
<%
    }
%>

<a class="add" href="addBill?type=1">
    <img class="icon" src="../image/pencil.png" alt="">
</a>











<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>