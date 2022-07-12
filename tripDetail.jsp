<%@include file="connect.jsp" %>
<%@ page import="java.util.*" %>

<%
    Connect con = Connect.getConnection();

    int selectedTrip = Integer.parseInt(request.getParameter("selected_trip"));
    Vector selectedTripDetailName = new Vector();
    Vector selectedTripDetailPassport = new Vector();
    Vector selectedTripDetailGender = new Vector();
    Vector selectedTripDetailAge = new Vector();
    Vector selectedTripDetailSpecial = new Vector();

    String selectTripDetailQuery = String.format(""
        +"SELECT "
            +"bd.bookingDetailName AS 'bookingDetailName', "
            +"bd.bookingDetailPassport AS 'bookingDetailPassport', "
            +"bd.bookingDetailGender AS 'bookingDetailGender', "
            +"bd.bookingDetailAge AS 'bookingDetailAge', "
            +"bd.bookingDetailSpecial AS 'bookingDetailSpecial' "
        +"FROM bookingDetail bd "
        +"WHERE bookingDetailId = %d "
    +"", selectedTrip);
    ResultSet selectTripDetailRes = con.executeQuery(selectTripDetailQuery);
    while(selectTripDetailRes.next()){
        selectedTripDetailName.add(selectTripDetailRes.getString("bookingDetailName"));
        selectedTripDetailPassport.add(selectTripDetailRes.getString("bookingDetailPassport"));
        selectedTripDetailGender.add(selectTripDetailRes.getString("bookingDetailGender"));
        selectedTripDetailAge.add(selectTripDetailRes.getString("bookingDetailAge"));
        selectedTripDetailSpecial.add(selectTripDetailRes.getString("bookingDetailSpecial"));
    }

    int bookingId = 0;
    String bookingVisit = "";
    int bookingPrice = 0;
    int bookingPeople = 0;
    int bookingDestinationId = 0;
    String bookingDestination = "";
    String bookingDestinationType = "";
    String bookingDestinationLocation = "";
    String bookingDestinationCountry = "";

    String selectTripDestinationQuery = String.format(""
        +"SELECT "
            +"b.bookingId AS 'bookingId', "
            +"b.bookingVisit AS 'bookingVisit', "
            +"b.bookingPayment AS 'bookingPrice', "
            +"b.bookingPeople AS 'bookingPeople', "
            +"d.destinationId AS 'bookingDestinationId', "
            +"d.destinationName AS 'bookingDestination', "
            +"d.destinationType AS 'bookingDestinationType', "
            +"a.admName AS 'bookingDestinationLocation', "
            +"c.countryName AS 'bookingDestinationCountry' "
        +"FROM booking b "
        +"JOIN destination d "
            +"ON b.bookingDestination = d.destinationId "
        +"JOIN administrative a "
            +"ON d.destinationLocation = a.admId "
        +"JOIN country c "
            +"ON d.destinationCountry = c.countryId "
        +"WHERE bookingId = %d "
    +"", selectedTrip);
    ResultSet selectTripDestinationRes = con.executeQuery(selectTripDestinationQuery);
    while(selectTripDestinationRes.next()){
        bookingId = selectTripDestinationRes.getInt("bookingId");
        bookingVisit = selectTripDestinationRes.getString("bookingVisit");
        bookingPrice = selectTripDestinationRes.getInt("bookingPrice");
        bookingPeople = selectTripDestinationRes.getInt("bookingPeople");
        bookingDestinationId = selectTripDestinationRes.getInt("bookingDestinationId");
        bookingDestination = selectTripDestinationRes.getString("bookingDestination");
        bookingDestinationType = selectTripDestinationRes.getString("bookingDestinationType");
        bookingDestinationLocation = selectTripDestinationRes.getString("bookingDestinationLocation");
        bookingDestinationCountry = selectTripDestinationRes.getString("bookingDestinationCountry");
    }
%>

<!DOCTYPE html>
<html lang="en" id="trip">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div id="navbar">
        <%@include file="navbar.jsp"%>
    </div>
    <div class="space"></div>
    <div id="tripDetail_content">
        <h1>Detail Perjalanan</h1>
        <div>
            <div id="tripDetail_content_info">
                <%
                if(bookingDestinationId > 153){
                %>
                <img src="photos/sample.jpg" alt="">
                <%
                }
                else{
                %>
                <img src="photos/<%=bookingDestinationId%>.jpg" alt="">
                <%
                }
                %>
                <div>
                    <h2><%=bookingDestinationType%></h2>
                    <h1><%=bookingDestination%></h1>
                    <p><%=bookingDestinationLocation%>, <%=bookingDestinationCountry%></p>
                    <div id="tripDetail_content_info_set">
                        <div class="tripDetail_content_info_head">
                            <img src="assets/number.circle.fill@2x.png" alt="">
                            <div>
                                <p>ID Pemesanan</p>
                                <h2><%=bookingId%></h2>
                            </div>
                        </div>
                        <div class="tripDetail_content_info_head">
                            <img src="assets/calendar@2x.png" alt="">
                            <div>
                                <p>Tanggal kunjungan</p>
                                <h2><%=bookingVisit%></h2>
                            </div>
                        </div>
                        <div class="tripDetail_content_info_head">
                            <img src="assets/tag.fill@2x.png" alt="">
                            <div>
                                <p>Harga terbayar</p>
                                <h2><%=bookingPrice%></h2>
                            </div>
                        </div>
                        <div class="tripDetail_content_info_head">
                            <img src="assets/person.fill@2x.png" alt="">
                            <div>
                                <p>Jumlah</p>
                                <h2><%=bookingPeople%></h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="tripDetail_content_detail">
                <table>
                    <tr id="tripDetail_detail_header">
                        <td>
                            <div class="tripDetail_detail" id="tripDetail_detail_name">
                                <img src="assets/person.fill@2x.png" alt="" class="tripDetail_detail_icon">
                                <p>Nama Pengunjung</p>
                            </div>
                        </td>
                        <td>
                            <div class="tripDetail_detail" id="tripDetail_detail_passport">
                                <img src="assets/number.circle.fill@2x.png" alt="" class="tripDetail_detail_icon">
                                <p>Nomor Paspor</p>
                            </div>
                        </td>
                        <td>
                            <div class="tripDetail_detail" id="tripDetail_detail_gender">
                                <img src="assets/person.2.fill@2x.png" alt="" class="tripDetail_detail_icon">
                                <p>Jenis Kelamin</p>
                            </div>
                        </td>
                        <td>
                            <div class="tripDetail_detail" id="tripDetail_detail_age">
                                <img src="assets/figure.stand@2x.png" alt="" class="tripDetail_detail_icon">
                                <p>Umur</p>
                            </div>
                        </td>
                        <td>
                            <div class="tripDetail_detail" id="tripDetail_detail_special">
                                <img src="assets/pills.fill@2x.png" alt="" class="tripDetail_detail_icon">
                                <p>Kebutuhan Khusus</p>
                            </div>
                        </td>
                    </tr>
                    <%
                        for(int i = 0; i < bookingPeople; i++){
                            String tempTripDetailName = selectedTripDetailName.get(i).toString();
                            String tempTripDetailPassport = selectedTripDetailPassport.get(i).toString();
                            String tempTripDetailGender = selectedTripDetailGender.get(i).toString();
                            String tempTripDetailSpecial = selectedTripDetailSpecial.get(i).toString();
                    %>
                    <tr class="tripDetail_detail_content">
                        <td>
                            <p><%=tempTripDetailName.toUpperCase()%></p>
                        </td>
                        <td>
                            <p><%=tempTripDetailPassport.toUpperCase()%></p>
                        </td>
                        <td>
                            <p>
                                <%
                                    if(tempTripDetailGender.equals("2")){
                                        out.println("PEREMPUAN");
                                    }
                                    else if(tempTripDetailGender.equals("1")){
                                        out.println("LAKI-LAKI");
                                    }
                                    if(tempTripDetailGender.equals("0")){
                                        out.println("LAINNYA");
                                    }
                                %>
                            </p>
                        </td>
                        <td>
                            <p><%=selectedTripDetailAge.get(i)%></p>
                        </td>
                        <td>
                            <p><%=tempTripDetailSpecial.toUpperCase()%></p>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
        </div>
    </div>
</body>
</html>