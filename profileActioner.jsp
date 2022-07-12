<%@include file="connect.jsp" %>

<%
    Connect con = Connect.getConnection();

    String tempLoggedUser = (String) session.getAttribute("logProfile");
    out.println(tempLoggedUser);

    if(request.getParameter("profile_button").equals("0")){
        String tryChangePasswordOld = request.getParameter("try_old_password");
        String tryChangePasswordNew = request.getParameter("try_new_password");

        String failChangeMessage = "";
        Boolean fail = false;

        if(tryChangePasswordOld.isEmpty()){
            fail = true;
            failChangeMessage = failChangeMessage + "Kata sandi lama harus diisi <br>";
        }
        if(tryChangePasswordNew.isEmpty()){
            fail = true;
            failChangeMessage = failChangeMessage + "Kata sandi baru harus diisi <br>";
        }
        else{
            if(tryChangePasswordNew.length() < 8){
                fail = true;
                failChangeMessage = failChangeMessage + "Kata sandi baru minimal terdiri dari 8 karakter <br>";
            }
            if(!tryChangePasswordNew.matches("^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]+$")){
                fail = true;
                failChangeMessage = failChangeMessage + "Kata sandi baru harus terdiri dari karakter alfabet dan angka <br>";
            }
        }

        String checkPasswordQuery = String.format("SELECT * FROM profile WHERE profileId = '%s' AND profilePassword = '%s'", tempLoggedUser, tryChangePasswordOld);
        ResultSet checkPasswordRes = con.executeQuery(checkPasswordQuery);
        if(!checkPasswordRes.next()){
            fail = true;
            failChangeMessage = failChangeMessage + "Kata sandi lama tidak sesuai <br>";
        }

        if(fail == true){
            response.sendRedirect("profile.jsp");
            session.setAttribute("failChangeMessage", failChangeMessage);
        }
        else{
            String changePasswordQuery = String.format("UPDATE profile SET profilePassword = '%s' WHERE profileId = '%s'", tryChangePasswordNew, tempLoggedUser);
            con.executeUpdate(changePasswordQuery);
            response.sendRedirect("profile.jsp");
        }
    }
    else if(request.getParameter("profile_button").equals("1")){
        String deleteAccountQuery = String.format("DELETE FROM profile WHERE profileId = '%s'", tempLoggedUser);
        con.executeUpdate(deleteAccountQuery);
        response.sendRedirect("logoutController.jsp");
    }
%>