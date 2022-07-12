<%@include file="connect.jsp" %>
<%@ page import="java.util.*" %>

<%
    Connect con = Connect.getConnection();

    String selectedId = request.getParameter("selected_destination");
    String destinationId = "";
    String destinationName = "";
    String destinationType = "";
    String destinationOther = "";
    String destinationLocation = "";
    String destinationLocationCapital = "";
    String destinationCountryCapital = "";
    double destinationLong = 0;
    double destinationLat = 0;
    double destinationCountryCapitalLong = 0;
    double destinationCountryCapitalLat = 0;
    double destinationLocationCapitalLong = 0;
    double destinationLocationCapitalLat = 0;
    String destinationDesc = "";
    int destinationPrice = 0;

    String selectDestinationQuery = String.format(""
        +"SELECT "
            +"d.destinationId AS 'destinationId', "
            +"d.destinationName AS 'destinationName', "
            +"d.destinationType AS 'destinationType', "
            +"d.destinationOtherName AS 'destinationOther', "
            +"ad.admName AS 'destinationLocation', "
            +"ad.admCapital AS 'destinationLocationCapital', "
            +"ac.admCapital AS 'destinationCountryCapital', "
            +"d.destinationLong AS 'destinationLong', "
            +"d.destinationLat AS 'destinationLat', "
            +"ac.admLong AS 'destinationCountryCapitalLong', "
            +"ac.admLat AS 'destinationCountryCapitalLat', "
            +"ad.admLong AS 'destinationLocationCapitalLong', "
            +"ad.admLat AS 'destinationLocationCapitalLat', "
            +"d.destinationDescription AS 'destinationDesc', "
            +"d.destinationPrice AS 'destinationPrice' "
        +"FROM destination d "
        +"JOIN administrative ad "
            +"ON d.destinationLocation = ad.admId "
        +"JOIN country c "
            +"ON d.destinationCountry = c.countryId "
        +"JOIN administrative ac "
            +"ON c.countryCapitalId = ac.admId "
        +"WHERE destinationId = %s "
    +"", selectedId);
    ResultSet selectDestinationRes = con.executeQuery(selectDestinationQuery);
    while(selectDestinationRes.next()){
        destinationId = selectDestinationRes.getString("destinationId");
        destinationName = selectDestinationRes.getString("destinationName");
        destinationType = selectDestinationRes.getString("destinationType");
        destinationOther = selectDestinationRes.getString("destinationOther");
        destinationLocation = selectDestinationRes.getString("destinationLocation");
        destinationLocationCapital = selectDestinationRes.getString("destinationLocationCapital");
        destinationCountryCapital = selectDestinationRes.getString("destinationCountryCapital");
        destinationLong = selectDestinationRes.getDouble("destinationLong");
        destinationLat = selectDestinationRes.getDouble("destinationLat");
        destinationCountryCapitalLong = selectDestinationRes.getDouble("destinationCountryCapitalLong");
        destinationCountryCapitalLat = selectDestinationRes.getDouble("destinationCountryCapitalLat");
        destinationLocationCapitalLong = selectDestinationRes.getDouble("destinationLocationCapitalLong");
        destinationLocationCapitalLat = selectDestinationRes.getDouble("destinationLocationCapitalLat");
        destinationDesc = selectDestinationRes.getString("destinationDesc");
        destinationPrice = selectDestinationRes.getInt("destinationPrice");
    }

    double destinationDistanceCountryCapital = 0;
    destinationDistanceCountryCapital = Math.sqrt(Math.pow(((double)destinationLong-(double)destinationCountryCapitalLong), 2) + Math.pow(((double)destinationLat-(double)destinationCountryCapitalLat), 2)) * 111.322;
    destinationDistanceCountryCapital = (double) Math.round(destinationDistanceCountryCapital * 10)/10;
    double destinationDistanceLocationCapital = 0;
    destinationDistanceLocationCapital = Math.sqrt(Math.pow(((double)destinationLong-(double)destinationLocationCapitalLong), 2) + Math.pow(((double)destinationLat-(double)destinationLocationCapitalLat), 2)) * 111.322;
    destinationDistanceLocationCapital = (double) Math.round(destinationDistanceLocationCapital * 10)/10;
%>

<!DOCTYPE html>
<html lang="en" id="location">
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
    <form id="location_content" action="book.jsp">
        <div id="location_map">
            <%
            if(Integer.parseInt(selectedId) > 153){
            %>
            <img src="photos/sample.jpg" alt="">
            <%
            }
            else{
            %>
            <img src="photos/<%=selectedId%>.jpg" alt="">
            <%
            }
            %>
            <iframe src="https://www.mapquest.com/embed?center=<%=destinationLat%>,<%=destinationLong%>&zoom=11&maptype=map"></iframe>
        </div>
        <div id="location_detail">
            <div id="location_detail_info">
                <h2><%=destinationType%></h2>
                <h1><%=destinationName%></h1>
                <%
                    if(destinationOther != null){
                %>
                        <p><i><%=destinationOther%></i></p>
                <%
                    }
                %>
                <div>
                    <div class="location_detail_iconset">
                        <img src="assets/location.fill@2x.png" alt="" class="location_detail_icon">
                        <div>
                            <p>Lokasi</p>
                            <h2><%=destinationLocation%></h2>
                        </div>
                    </div>
                    <div class="location_detail_iconset">
                        <img src="assets/airplane@2x.png" alt="" class="location_detail_icon">
                        <div>
                            <p>Jarak dari <%=destinationCountryCapital%></p>
                            <h2><%=destinationDistanceCountryCapital%> km</h2>
                        </div>
                    </div>
                    <div class="location_detail_iconset">
                        <img src="assets/ruler.fill@2x.png" alt="" class="location_detail_icon">
                        <div>
                            <p>Jarak dari <%=destinationLocationCapital%></p>
                            <h2><%=destinationDistanceLocationCapital%> km</h2>
                        </div>
                    </div>
                </div>
                <p><%=destinationDesc%></p>
            </div>
            <div id="location_detail_book">
                <div>
                    <h1>Rp<%=destinationPrice%>.00</h1>
                    <p>per orang</p>
                </div>
                <%
                    if(logUser == null){
                %>
                    <button type="submit" name="book_selected" value="<%=destinationId%>" disabled>Silakan masuk untuk melakukan pemesanan</button>
                <%
                    }
                    else if(logName.equals("admin")){
                %>
                    <button type="submit" name="book_selected" value="<%=destinationId%>" disabled>Admin tidak bisa melakukan pemesanan</button>
                <%
                    }
                    else{
                %>
                    <button type="submit" name="book_selected" value="<%=destinationId%>">Pesan</button>
                <%
                    }
                %>
            </div>
        </div>
    </form>
</body>
</html>