<!DOCTYPE html>
<html lang="en" id="register">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%
        String tempLoggedUser = (String) session.getAttribute("logProfile");
        String failChangeMessage = (String) session.getAttribute("failChangeMessage");
    %>
    <div id="navbar">
        <%@include file="navbar.jsp"%>
    </div>
    <div class="space"></div>
    <div id="register_content">
        <h1>Ganti Kata Sandi</h1>
        <form action="changePasswordController.jsp">
            <table>
                <tr class="register_form_row">
                    <td>
                        <img src="assets/lock.fill@2x.png" alt="" class="register_form_icon">
                    </td>
                    <td>
                        <input type="password" name="try_old_password" id="" class="register_form_input" placeholder="Kata sandi lama">
                    </td>
                </tr>
                <tr class="register_form_row">
                    <td>
                        <img src="assets/lock.fill@2x.png" alt="" class="register_form_icon">
                    </td>
                    <td>
                        <input type="password" name="try_new_password" id="" class="register_form_input" placeholder="Kata sandi baru">
                    </td>
                </tr>
            </table>
            <p id="register_form_error">
                <%
                    if(failChangeMessage != null){
                        out.println(failChangeMessage);
                        session.setAttribute("failChangeMessage", null);
                    }
                %>
            </p>
            <button type="submit" id="register_form_button">Ganti</button>
        </form>
    </div>
</body>
</html>