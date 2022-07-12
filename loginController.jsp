<%@include file="connect.jsp" %>

<%
    Connect con = Connect.getConnection();

    String tryLogEmail = request.getParameter("try_log_email");
    String tryLogPassword = request.getParameter("try_log_password");

    Boolean fail = false;
    String failLogMessage = "";

    if(tryLogEmail.isEmpty()){
        fail = true;
        failLogMessage = failLogMessage + "Email harus diisi <br>";
    }
    if(tryLogPassword.isEmpty()){
        fail = true;
        failLogMessage = failLogMessage + "Kata sandi harus diisi <br>";
    }
    if(!tryLogEmail.isEmpty() && !tryLogPassword.isEmpty()){
        String validateUserQuery = String.format("SELECT * FROM profile WHERE profileEmail = '%s' AND profilePassword = '%s'", tryLogEmail, tryLogPassword);
        ResultSet rs = con.executeQuery(validateUserQuery);
        if(rs.next() == false){
            fail = true;
            failLogMessage = failLogMessage + "Email atau kata sandi salah <br>";
        }
    }
    if(fail == true){
        session.setAttribute("failLogEmail", tryLogEmail);
        session.setAttribute("failLogMessage", failLogMessage);
        response.sendRedirect("login.jsp");
    }
    else{
        String validateUserQuery = String.format("SELECT * FROM profile WHERE profileEmail = '%s' AND profilePassword = '%s'", tryLogEmail, tryLogPassword);
        ResultSet rs = con.executeQuery(validateUserQuery);
        if(rs.next() != false){
            String logProfile = rs.getString("profileId");
            String logName = rs.getString("profileName");
            String logPhone = rs.getString("profilePhone");
            session.setAttribute("logProfile", logProfile);
            session.setAttribute("logName", logName);
            session.setAttribute("logEmail", tryLogEmail);
            session.setAttribute("logPhone", logPhone);
            response.sendRedirect("index.jsp");
        }
    }
%>