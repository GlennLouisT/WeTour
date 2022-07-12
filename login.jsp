<!DOCTYPE html>
<html lang="en" id="login">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%
        String failLogMessage = (String) session.getAttribute("failLogMessage");
        String failLogEmail = "";
        if(failLogMessage != null){
            failLogEmail = (String) session.getAttribute("failLogEmail");
        }
    %>
    <div id="navbar">
        <%@include file="navbar.jsp"%>
    </div>
    <div class="space"></div>
    <div id="login_content">
        <h1>Masuk</h1>
        <form action="loginController.jsp">
            <table>
                <tr class="login_form_row">
                    <td>
                        <img src="assets/envelope.fill@2x.png" alt="" class="login_form_icon">
                    </td>
                    <td>
                        <input type="text" name="try_log_email" id="" class="login_form_input" placeholder="Email" value="<%=failLogEmail%>">
                    </td>
                </tr>
                <tr class="login_form_row">
                    <td>
                        <img src="assets/lock.fill@2x.png" alt="" class="login_form_icon">
                    </td>
                    <td>
                        <input type="password" name="try_log_password" id="" class="login_form_input" placeholder="Kata sandi">
                    </td>
                </tr>
            </table>
            <p id="log_form_error">
                <%
                    if(failLogMessage != null){
                        out.println(failLogMessage);
                        session.setAttribute("failLogMessage", null);
                    }
                %>
            </p>
            <button type="submit" id="login_form_button">Masuk</button>
        </form>
    </div>
</body>
</html>