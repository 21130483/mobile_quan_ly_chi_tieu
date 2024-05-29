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

    <section class="main">

        <section class="thongke">
          <section class="total">
            <div class="box">
                <p>Thu nhập</p>
                <p class="plus">+10000000</p>
            </div>

            <div class="box">
                <p>Chi tiêu</p>
                <p class="minus">-10000000</p>
            </div>

            <div class="box">
                <p>Toàn bộ</p>
                <p class="plus">+10000000</p>
            </div>
          </section>
        </section>

        <section class="lists">
            <div class="list">
                <button class="dropdown" onclick="viewDetail('details1')">
                    <p>Th5, 11/5</p>
                    <div>
                        <p>chi tiêu:200000, thu nhập: 2000000</p>
                    </div>
                    
                </button>
                <div class="details" id="details1">
                    <div class="detail">
                        <div class="content">
                            <div class="box">
                                <img class="icon" src="assets/image/chi/hamburger.png" alt="">
                            </div>
                            Đồ ăn
                        </div>

                        <div class="money">
                            <p class="plus">+1000000 đồng</p>
                        </div>
                    </div>

                    <div class="detail">
                        <div class="content">
                            <div class="box">
                                <img class="icon" src="assets/image/chi/hamburger.png" alt="">
                            </div>
                            Đồ ăn
                        </div>

                        <div class="money">
                            <p class="plus">+1000000 đồng</p>
                        </div>
                    </div>

                </div>

            </div>

            <div class="list">
                <button class="dropdown" onclick="viewDetail('details2')">
                    <p>Th5, 11/5</p>
                    <p>chi tiêu:200000, thu nhập: 2000000</p>
                </button>
                <div class="details" id="details2">
                    <div class="detail">
                        <div class="content">
                            <div class="box">
                                <img class="icon" src="assets/image/chi/hamburger.png" alt="">
                            </div>
                            Đồ ăn
                        </div>

                        <div class="money">
                            <p class="minus">-1000000 đồng</p>
                        </div>
                    </div>

                </div>

            </div>

        </section>
    </section>

    <a class="add" href="addBill.jsp">
        <img class="icon" src="assets/image/pencil.png" alt="">
    </a>

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









<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>