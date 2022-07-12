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
        String failRegMessage = (String) session.getAttribute("failRegMessage");
        String failRegName = "";
        String failRegPhone = "";
        String failRegEmail = "";
        if(failRegMessage != null){
            failRegName = (String) session.getAttribute("failRegName");
            failRegPhone = (String) session.getAttribute("failRegPhone");
            failRegEmail = (String) session.getAttribute("failRegEmail");
        }
    %>
    <div id="navbar">
        <%@include file="navbar.jsp"%>
    </div>
    <div class="space"></div>
    <div id="register_content">
        <h1>Daftar</h1>
        <form action="registerController.jsp">
            <table>
                <tr class="register_form_row">
                    <td>
                        <img src="assets/person.fill@2x.png" alt="" class="register_form_icon">
                    </td>
                    <td>
                        <input type="text" name="try_reg_name" id="" class="register_form_input" placeholder="Nama" value="<%=failRegName%>">
                    </td>
                </tr>
                <tr class="register_form_row">
                    <td>
                        <img src="assets/phone.fill@2x.png" alt="" class="register_form_icon">
                    </td>
                    <td>
                        <input type="text" name="try_reg_phone" id="" class="register_form_input" placeholder="No telepon" value="<%=failRegPhone%>">
                    </td>
                </tr>
                <tr class="register_form_row">
                    <td>
                        <img src="assets/envelope.fill@2x.png" alt="" class="register_form_icon">
                    </td>
                    <td>
                        <input type="text" name="try_reg_email" id="" class="register_form_input" placeholder="Email" value="<%=failRegEmail%>">
                    </td>
                </tr>
                <tr class="register_form_row">
                    <td>
                        <img src="assets/lock.fill@2x.png" alt="" class="register_form_icon">
                    </td>
                    <td>
                        <input type="password" name="try_reg_password" id="" class="register_form_input" placeholder="Kata sandi">
                    </td>
                </tr>
                <tr class="register_form_row">
                    <td>
                        <img src="assets/lock.fill@2x.png" alt="" class="register_form_icon">
                    </td>
                    <td>
                        <input type="password" name="try_reg_confirm" id="" class="register_form_input" placeholder="Konfirmasi kata sandi">
                    </td>
                </tr>
            </table>
            <p id="register_form_error">
                <%
                    if(failRegMessage != null){
                        out.println(failRegMessage);
                        session.setAttribute("failRegMessage", null);
                    }
                %>
            </p>
            <button type="submit" id="register_form_button">Registrasi</button>
        </form>
    </div>
</body>
</html>