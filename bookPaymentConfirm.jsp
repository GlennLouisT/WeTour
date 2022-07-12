<%@include file="connect.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.concurrent.TimeUnit"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

<!DOCTYPE html>
<html lang="en" id="book">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%
        Connect con = Connect.getConnection();

        String tryBookDate = request.getParameter("try_book_date");
        String tryBookPerson = request.getParameter("try_book_person");

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String today = java.time.LocalDate.now().format(formatter);

        String bookingProfileSt = (String) session.getAttribute("logProfile");
        String bookingVisit = (String) session.getAttribute("verifiedAddDate");
        String bookingPeopleSt = (String) session.getAttribute("verifiedAddPerson");
        int bookingPrice = (int) session.getAttribute("verifiedPrice");
        String bookingDestinationSt = (String) session.getAttribute("verifiedDestination");

        int bookingProfile = Integer.parseInt(bookingProfileSt);
        int bookingPeople = Integer.parseInt(bookingPeopleSt);
        int bookingDestination = Integer.parseInt(bookingDestinationSt);

        int bookingId = 0;

        String bookingInsertQuery = String.format("INSERT INTO booking (bookingId, bookingProfile, bookingDestination, bookingDate, bookingVisit, bookingPeople, bookingPayment) VALUES (NULL, '%d', '%d', '%s', '%s', '%d', '%d')", bookingProfile, bookingDestination, today, bookingVisit, bookingPeople, bookingPrice);
        con.executeUpdate(bookingInsertQuery);

        String searchBookingIdQuery = String.format(""
            +"SELECT `bookingId` FROM `booking` "
            +"WHERE `bookingProfile` = %d "
            +"AND `bookingDestination` = %d "
            +"AND `bookingDate` = '%s' "
            +"AND `bookingVisit` = '%s' "
            +"AND `bookingPeople` = %d "
            +"AND `bookingPayment` = %d "
        +"", bookingProfile, bookingDestination, today, bookingVisit, bookingPeople, bookingPrice);
        ResultSet searchBookingIdQueryRes = con.executeQuery(searchBookingIdQuery);
        while(searchBookingIdQueryRes.next()){
            bookingId = searchBookingIdQueryRes.getInt("bookingId");
        }

        Vector payBookName = new Vector(bookingPeople);
        Vector payBookPassport = new Vector(bookingPeople);
        Vector payBookGender = new Vector(bookingPeople);
        Vector payBookAge = new Vector(bookingPeople);
        Vector payBookSpecial = new Vector(bookingPeople);

        payBookName = (Vector) session.getAttribute("payBookName");
        payBookPassport = (Vector) session.getAttribute("payBookPassport");
        payBookGender = (Vector) session.getAttribute("payBookGender");
        payBookAge = (Vector) session.getAttribute("payBookAge");
        payBookSpecial = (Vector) session.getAttribute("payBookSpecial");

        for (int i = 0; i < bookingPeople; i++){
            String tempBookName = (String) payBookName.get(i);
            String tempBookPassport = (String) payBookPassport.get(i);
            String tempBookGender = (String) payBookGender.get(i);
            String tempBookAgeSt = (String) payBookAge.get(i);
            int tempBookAge = Integer.parseInt(tempBookAgeSt);
            String tempBookSpecial = (String) payBookSpecial.get(i);
            String bookingDetailInsertQuery = String.format("INSERT INTO bookingDetail (bookingDetailId, bookingDetailName, bookingDetailPassport, bookingDetailGender, bookingDetailAge, bookingDetailSpecial) VALUES ('%d', '%s', '%s', '%s', '%d', '%s')", bookingId, tempBookName, tempBookPassport, tempBookGender, tempBookAge, tempBookSpecial);
            con.executeUpdate(bookingDetailInsertQuery);
        }

    %>
    <div id="navbar">
        <%@include file="navbar.jsp"%>
    </div>
    <div class="space"></div>
    <div id="paymentConfirmation_content">
        <h1>Pembayaran Berhasil</h1>
        <p id="paymentConfirmation_content_date">Tanggal pembayaran: <%=today%></p>
        <p id="paymentConfirmation_content_countdown">Halaman ini secara otomatis akan mengarahkan Anda ke halaman perjalanan dalam 5 detik</p>
        <p>atau klik <a href="trip.jsp">disini</a> untuk kembali ke halaman perjalanan.</p>
    </div>
</body>
</html>
<script>
    var duration = 4;
    var timer = setInterval(function(){
        if(duration <= 0){
            clearInterval(timer);
            window.location.href = 'trip.jsp';;
        }
        else{
            document.getElementById('paymentConfirmation_content_countdown').innerHTML = "Halaman ini secara otomatis akan mengarahkan Anda ke halaman perjalanan dalam " + duration + " detik";
        }
        duration = duration - 1;
    }, 1000);
</script>