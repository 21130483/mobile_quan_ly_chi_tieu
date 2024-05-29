<%@ page import="model.contentBill" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.typeBillDAO" %>
<%@ page import="java.lang.reflect.Type" %>
<%@ page import="model.typeBill" %>
<%@ page import="java.time.LocalDate" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/addBill.css">

</head>

<body>
<jsp:include page="header.jsp"></jsp:include>

<%
    int type = (int) request.getAttribute("typeBill");
    List<contentBill> contentBills = (List) request.getAttribute("contentBills");
%>

    <section class="main">
        <section class="title">
            Thêm hóa đơn
        </section>

        <section class="type">
            <%
                typeBillDAO typeBillDAO = new typeBillDAO();
                List<typeBill> typeBills = typeBillDAO.getALl();
            %>

            <%
                for(typeBill tb : typeBills) {

            %>
            <a href="addBill?type=<%=tb.getId()%>">
                <button class="button <%if(tb.getId()==type){%>choose<%}%>">
                    <img class="icon" src="../image/typebill/<%=tb.getId()%>.png">
                    <%=tb.getName()%>
                </button>
            </a>
            <%
                }
            %>
        </section>

        <form method="post" action="addBill?type=<%=type%>">

            <section>
                <div class="contents">
                    <%
                        for(contentBill cb : contentBills) {


                    %>
                    <div class="radio-group box">
                        <input type="radio" id="option<%=cb.getId()%>" name="contentbill" value="<%=cb.getId()%>" required>
                        <label class="content" for="option<%=cb.getId()%>">
                            <img class="icon" src="../image/contentbill/<%=cb.getId()%>.png" alt="Option <%=cb.getId()%> Image">
                            <span><%=cb.getName()%></span>
                        </label>
                    </div>
                    <%
                        }
                    %>
            </section>

            <section class="infos">
                <section class="info">
                    <p>Ngày</p>
                    <%
                        LocalDate today = LocalDate.now();
                    %>
                    <input class="input" type="date" id="dateInput" name="date" value="<%=today%>" required>
                </section>

                <section class="info">
                    <p>Số tiền</p>
                    <input class="input" type="number" style="border-right: none;padding-right: 0;" name="money" value="0" required>
                    <div class="input" style="border-left: none;">
                        Đồng
                    </div>
                </section>
            </section>


            <section class="access">
                <button type="submit">Thêm hóa đơn</button>
                <a href="index.jsp">
                    <button>Hủy</button>
                </a>
            </section>
        </form>




    </section>



<jsp:include page="footer.jsp"></jsp:include>



</body>

</html>