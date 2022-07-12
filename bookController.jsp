<%@include file="connect.jsp" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.concurrent.TimeUnit"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

<%
    Connect con = Connect.getConnection();

    String tryBookDate = request.getParameter("try_book_date");
    String tryBookPerson = request.getParameter("try_book_person");

    Boolean fail = false;
    String failBookMessage = "";

    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    String today = java.time.LocalDate.now().format(formatter);

    if(tryBookDate.isEmpty()){
        fail = true;
        failBookMessage = failBookMessage + "Tanggal harus diisi <br>";
    }
    else{
        Date tryDate = new SimpleDateFormat("yyyy-MM-dd").parse(tryBookDate);
        Date todayDate = new SimpleDateFormat("yyyy-MM-dd").parse(today);
        
        long diffInMillies = tryDate.getTime() - todayDate.getTime();
        long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
        if(diff < 3){
            fail = true;
            failBookMessage = failBookMessage + "Tanggal kunjungan minimal 3 hari dari tanggal pemesanan <br>";
        }
        if(diff > 365){
            fail = true;
            failBookMessage = failBookMessage + "Tanggal kunjungan maksimal 365 hari dari tanggal pemesanan <br>";
        }
    }
    if(tryBookPerson.isEmpty()){
        fail = true;
        failBookMessage = failBookMessage + "Jumlah orang harus diisi <br>";
    }
    else{
        if(Integer.parseInt(tryBookPerson) < 0){
            fail = true;
            failBookMessage = failBookMessage + "Jumlah orang minimal 1 orang per pemesanan <br>";
        }
        if(Integer.parseInt(tryBookPerson) > 10){
            fail = true;
            failBookMessage = failBookMessage + "Jumlah orang maksimal 10 orang per pemesanan <br>";
        }
    }
    out.println(failBookMessage);
    if(fail == true){
        session.setAttribute("failAddDate", tryBookDate);
        session.setAttribute("failAddPerson", tryBookPerson);
        session.setAttribute("failBookMessage", failBookMessage);
        response.sendRedirect("book.jsp");
    }
    else{
        //String userInsertQuery = String.format("INSERT INTO profile (profileName, profilePhone, profileEmail, profilePassword) VALUES ('%s', '%s', '%s', '%s')", tryRegisterName, tryRegisterPhone, tryRegisterEmail, tryRegisterPassword);
        //con.executeUpdate(userInsertQuery);
        session.setAttribute("verifiedBookDate", today);
        session.setAttribute("verifiedAddDate", tryBookDate);
        session.setAttribute("verifiedAddPerson", tryBookPerson);
        session.setAttribute("tryBookDestinationId", request.getParameter("book_payment"));
        response.sendRedirect("bookDetail.jsp");
    }
%>