<!DOCTYPE html>
<html lang="en" id="profile">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%
        String loggedName = (String) session.getAttribute("logName");
        String loggedEmail = (String) session.getAttribute("logEmail");
        String loggedPhone = (String) session.getAttribute("logPhone");

        String failChangeMessage = (String) session.getAttribute("failChangeMessage");
    %>
    <div id="navbar">
        <%@include file="navbar.jsp"%>
    </div>
    <div class="space"></div>
    <div id="profile_content">
        <h1>Profil</h1>
        <form action="profileActioner.jsp" method="post">
            <table>
                <tr class="profile_show_row">
                    <td>
                        <img src="assets/person.fill@2x.png" alt="" class="profile_show_icon">
                    </td>
                    <td>
                        <p class="profile_show_info"><%=loggedName%></p>
                    </td>
                </tr>
                <tr class="profile_show_row">
                    <td>
                        <img src="assets/envelope.fill@2x.png" alt="" class="profile_show_icon">
                    </td>
                    <td>
                        <p class="profile_show_info"><%=loggedEmail%></p>
                    </td>
                </tr>
                <tr class="profile_show_row">
                    <td>
                        <img src="assets/phone.fill@2x.png" alt="" class="profile_show_icon">
                    </td>
                    <td>
                        <p class="profile_show_info"><%=loggedPhone%></p>
                    </td>
                </tr>
            </table>
            <h2>Ganti Kata Sandi</h2>
            <tr class="register_form_row">
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
            <button type="submit" id="profile_show_button" name="profile_button" value="0">Ganti kata sandi</button>
            <button type="submit" id="profile_show_button_delete" name="profile_button" value="1">Hapus akun</button>
        </form>
    </div>
</body>
</html>