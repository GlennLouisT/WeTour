<%@include file="connect.jsp" %>

<%
    Connect con = Connect.getConnection();

    String tryRegisterName = request.getParameter("try_reg_name");
    String tryRegisterPhone = request.getParameter("try_reg_phone");
    String tryRegisterEmail = request.getParameter("try_reg_email");
    String tryRegisterPassword = request.getParameter("try_reg_password");
    String tryRegisterConfirm = request.getParameter("try_reg_confirm");

    Boolean fail = false;
    String failRegMessage = "";

    if(tryRegisterName.isEmpty()){
        fail = true;
        failRegMessage = failRegMessage + "Nama harus diisi <br>";
    }
    else{
        if(tryRegisterName.length() < 3){
            fail = true;
            failRegMessage = failRegMessage + "Nama minimal terdiri dari 3 karakter alfabet <br>";
        }
        if(!tryRegisterName.matches("[a-zA-Z]+")){
            fail = true;
            failRegMessage = failRegMessage + "Nama harus terdiri dari karakter <br>";
        }
    }
    if(tryRegisterPhone.isEmpty()){
        fail = true;
        failRegMessage = failRegMessage + "Nomor telepon harus diisi <br>";
    }
    else{
        if(tryRegisterPhone.length() < 9){
            fail = true;
            failRegMessage = failRegMessage + "Nomor telepon minimal terdiri dari 9 angka <br>";
        }
        if(!tryRegisterPhone.matches("[0-9]+")){
            fail = true;
            failRegMessage = failRegMessage + "Nomor telepon harus terdiri dari angka <br>";
        }
        if(!tryRegisterPhone.startsWith("08")){
            fail = true;
            failRegMessage = failRegMessage + "Nomor telepon harus dimulai dengan 08 <br>";
        }
    }
    if(tryRegisterEmail.isEmpty()){
        fail = true;
        failRegMessage = failRegMessage + "Email harus diisi <br>";
    }
    else{
        String checkDuplicateQuery = String.format("SELECT * FROM profile WHERE profileEmail = '%s'", tryRegisterEmail);
        ResultSet rs = con.executeQuery(checkDuplicateQuery);
        if(rs.next() != false){
            fail = true;
            failRegMessage = failRegMessage + "Email sudah terdaftar <br>";
        }
        if(!tryRegisterEmail.contains("@") || !tryRegisterEmail.contains(".")){
            fail = true;
            failRegMessage = failRegMessage + "Email harus memiliki '@' dan '.' <br>";
        }
        if(tryRegisterEmail.startsWith("@") || tryRegisterEmail.startsWith(".")){
            fail = true;
            failRegMessage = failRegMessage + "Email tidak dapat dimulai dengan '@' atau '.' <br>";
        }
        if(tryRegisterEmail.endsWith("@") || tryRegisterEmail.endsWith(".")){
            fail = true;
            failRegMessage = failRegMessage + "Email tidak dapat diakhiri dengan '@' atau '.' <br>";
        }
        if(tryRegisterEmail.indexOf("@") == tryRegisterEmail.indexOf(".") + 1 || tryRegisterEmail.indexOf(".") == tryRegisterEmail.indexOf("@") + 1){
            fail = true;
            failRegMessage = failRegMessage + "Email tidak dapat memiliki '@' dan '.' bersebelahan <br>";
        }
    }
    if(tryRegisterPassword.isEmpty()){
        fail = true;
        failRegMessage = failRegMessage + "Kata sandi harus diisi <br>";
    }
    else{
        if(tryRegisterPassword.length() < 8){
            fail = true;
            failRegMessage = failRegMessage + "Kata sandi minimal terdiri dari 8 karakter <br>";
        }
        if(!tryRegisterPassword.matches("^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]+$")){
            fail = true;
            failRegMessage = failRegMessage + "Kata sandi harus terdiri dari karakter alfabet dan angka <br>";
        }
    }
    if(tryRegisterConfirm.isEmpty()){
        fail = true;
        failRegMessage = failRegMessage + "Konfirmasi kata sandi harus diisi <br>";
    }
    else{
        if(!tryRegisterPassword.equals(tryRegisterConfirm)){
            fail = true;
            failRegMessage = failRegMessage + "Konfirmasi kata sandi harus sama dengan kata sandi <br>";
        }
    }
    if(fail == true){
        session.setAttribute("failRegName", tryRegisterName);
        session.setAttribute("failRegPhone", tryRegisterPhone);
        session.setAttribute("failRegEmail", tryRegisterEmail);
        session.setAttribute("failRegMessage", failRegMessage);
        response.sendRedirect("register.jsp");
    }
    else{
        String userInsertQuery = String.format("INSERT INTO profile (profileName, profilePhone, profileEmail, profilePassword) VALUES ('%s', '%s', '%s', '%s')", tryRegisterName, tryRegisterPhone, tryRegisterEmail, tryRegisterPassword);
        con.executeUpdate(userInsertQuery);
        response.sendRedirect("login.jsp");
    }
%>