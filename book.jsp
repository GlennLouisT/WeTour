<%@include file="connect.jsp" %>
<%@ page import="java.util.*" %>

<%
    Connect con = Connect.getConnection();

    String selectedId;
    if(request.getParameter("book_selected") == null){
        selectedId = (String) session.getAttribute("destinationId");
    }
    else{
        selectedId = request.getParameter("book_selected");
    }

    String destinationId = "";
    String destinationName = "";
    String destinationLocation = "";
    String destinationCountry = "";

    String bookDestinationQuery = String.format(""
        +"SELECT "
            +"d.destinationId AS 'destinationId', "
            +"d.destinationName AS 'destinationName', "
            +"c.countryName AS 'destinationCountry', "
            +"a.admName AS 'destinationLocation' "
        +"FROM destination d "
        +"JOIN country c "
            +"ON d.destinationCountry = c.countryId "
        +"JOIN administrative a "
            +"ON d.destinationLocation = a.admId "
        +"WHERE destinationId = %s "
        +"", selectedId);
    ResultSet bookDestinationRes = con.executeQuery(bookDestinationQuery);
    while(bookDestinationRes.next()){
        destinationId = bookDestinationRes.getString("destinationId");
        destinationName = bookDestinationRes.getString("destinationName");
        destinationLocation = bookDestinationRes.getString("destinationLocation");
        destinationCountry = bookDestinationRes.getString("destinationCountry");
    }

    session.setAttribute("destinationId", destinationId);
%>

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
        String failBookMessage = (String) session.getAttribute("failBookMessage");
        String failAddDate = "";
        String failAddPerson = "";
        if(failBookMessage != null){
            failAddDate = (String) session.getAttribute("failAddDate");
            failAddPerson = (String) session.getAttribute("failAddPerson");
        }
    %>
    <div id="navbar">
        <%@include file="navbar.jsp"%>
    </div>
    <div class="space"></div>
    <div id="book_content">
        <h1>Pemesanan</h1>
        <form action="bookController.jsp">
            <div>
                <div id="book_content_photo">
                    <%
                    if(Integer.parseInt(destinationId) > 153){
                    %>
                    <img src="photos/sample.jpg" alt="">
                    <%
                    }
                    else{
                    %>
                    <img src="photos/<%=destinationId%>.jpg" alt="">
                    <%
                    }
                    %>
                </div>
                <div id="book_content_info">
                    <div>
                        <img src="assets/location.fill@2x.png" alt="" class="book_content_iconset">
                        <div>
                            <p>Tujuan</p>
                            <h3><%=destinationName%></h3>
                        </div>
                    </div>
                    <div>
                        <img src="assets/mappin@2x.png" alt="" class="book_content_iconset">
                        <div>
                            <p>Lokasi</p>
                            <h3><%=destinationLocation%>, <%=destinationCountry%></h3>
                        </div>
                    </div>
                    <div>
                        <img src="assets/calendar@2x.png" alt="" class="book_content_iconset">
                        <div>
                            <p>Tanggal kunjungan</p>
                            <input type="date" name="try_book_date" id="" placeholder="Tanggal kunjungan" value="<%=failAddDate%>">
                        </div>
                    </div>
                    <div>
                        <img src="assets/person.fill@2x.png" alt="" class="book_content_iconset">
                        <div>
                            <p>Jumlah (maksimal 10 orang/pemesanan)</p>
                            <input type="number" name="try_book_person" id="" min="1" max="10" placeholder="Jumlah orang" value="<%=failAddPerson%>">
                        </div>
                    </div>
                </div>
            </div>
            <p id="book_form_error">
                <%
                    if(failBookMessage != null){
                        out.println(failBookMessage);
                        session.setAttribute("failBookMessage", null);
                    }
                %>
            </p>
            <div id="book_content_action">
                <a href="index.jsp"><p>Batalkan</p></a>
                <button type="submit" name="book_payment" value="<%=destinationId%>">Lanjut</button>
            </div>
        </form>
    </div>
</body>
</html>