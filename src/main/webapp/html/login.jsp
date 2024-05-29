<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/login.css">
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>

    <section class="main">
        <div class="title">
            Đăng nhập
        </div>
        <form method="post" action="login" class="formlogin">
            <input class="input" name="username" type="text" placeholder="Username">
            <input class="input" name="password" type="password" placeholder="Password">
            <button  class="button">Đăng nhập</button>
        </form>
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
<jsp:include page="footer.jsp"></jsp:include>

</body>

</html>