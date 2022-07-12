<%@include file="connect.jsp" %>
<%@ page import="java.util.*" %>

<%
    Connect con = Connect.getConnection();

    String tempLoggedUser = (String) session.getAttribute("logProfile");
    String loggedUser;
    if(tempLoggedUser.equals("0")){
        loggedUser = "BETWEEN 0 AND 10000";
    }
    else{
        loggedUser = String.format("= %s", tempLoggedUser);
    }
    Vector bookedTripName = new Vector();
    Vector bookedTripDestinationId = new Vector();
    Vector bookedTripLocation = new Vector();
    Vector bookedTripCountry = new Vector();
    Vector bookedTripDate = new Vector();
    Vector bookedTripPeople = new Vector();
    Vector bookedTripId = new Vector();
    Vector bookedTripPrice = new Vector();
    int bookedTripCount = 0;

    String countBookedQuery = String.format("SELECT COUNT(*) FROM booking WHERE bookingProfile %s", loggedUser);
    ResultSet countBookedRes = con.executeQuery(countBookedQuery);
    while(countBookedRes.next()){
        bookedTripCount = countBookedRes.getInt(1);
    }

    String selectBookedQuery = String.format(""
        +"SELECT "
            +"d.destinationName AS 'tripName', "
            +"d.destinationId AS 'tripDestinationId', "
            +"a.admName AS 'tripLocation', "
            +"c.countryName AS 'tripCountry', "
            +"b.bookingDate AS 'tripDate', "
            +"b.bookingPeople AS 'tripPeople', "
            +"b.bookingId AS 'tripId', "
            +"b.bookingPayment AS 'tripPrice' "
        +"FROM booking b "
        +"JOIN destination d "
            +"ON b.bookingDestination = d.destinationId "
        +"JOIN country c "
            +"ON d.destinationCountry = c.countryId "
        +"JOIN administrative a "
            +"ON d.destinationLocation = a.admId "
        +"WHERE bookingProfile %s "
    +"", loggedUser);
    ResultSet selectBookedRes = con.executeQuery(selectBookedQuery);
    while(selectBookedRes.next()){
        bookedTripName.add(selectBookedRes.getString("tripName"));
        bookedTripDestinationId.add(selectBookedRes.getString("tripDestinationId"));
        bookedTripLocation.add(selectBookedRes.getString("tripLocation"));
        bookedTripCountry.add(selectBookedRes.getString("tripCountry"));
        bookedTripDate.add(selectBookedRes.getString("tripDate"));
        bookedTripPeople.add(selectBookedRes.getInt("tripPeople"));
        bookedTripId.add(selectBookedRes.getInt("tripId"));
        bookedTripPrice.add(selectBookedRes.getInt("tripPrice"));
    }

    String countTotalDesinationListQuery = "SELECT COUNT(*) FROM destination WHERE destinationHeritagePark < 2";
    ResultSet countTotalDesinationListRes = con.executeQuery(countTotalDesinationListQuery);
    int totalDestinationList = 0;
    if(countTotalDesinationListRes.next()){
        totalDestinationList = countTotalDesinationListRes.getInt("COUNT(*)");
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
    <div id="trip_content">
        <h1>
            <%
                if(tempLoggedUser.equals("0")){
                    out.println("Transaksi");
                }
                else{
                    out.println("Perjalanan");
                }
            %>
        </h1>
        <form action="tripDetail.jsp">
            <%
                if(tempLoggedUser.equals("0")){
            %>
                <h2 class="trip_subsection">Infografik</h2>
                <div id="trip_dashboard">
                    <div id="trip_dashboard_chart">
                        <%
                            int bnCount = 0;
                            int phCount = 0; 
                            int idCount = 0;
                            int khCount = 0; 
                            int laCount = 0; 
                            int myCount = 0; 
                            int mmCount = 0; 
                            int sgCount = 0; 
                            int thCount = 0; 
                            int vnCount = 0;
                            for(int i = 0; i < bookedTripCountry.size(); i++){
                                switch((String)bookedTripCountry.get(i)){
                                    case "Brunei" : bnCount++;
                                    case "Filipina" : phCount++;
                                    case "Indonesia" : idCount++;
                                    case "Kamboja" : khCount++;
                                    case "Laos" : laCount++;
                                    case "Malaysia" : myCount++;
                                    case "Myanmar" : mmCount++;
                                    case "Singapura" : sgCount++;
                                    case "Thailand" : thCount++;
                                    case "Vietnam" : vnCount++;
                                }
                            }
                        %>
                        <div id="bn" class="chart_val" style="z-index: 10; width: <%=bnCount * 1000 / bookedTripCountry.size()%>px;"></div>
                        <div id="ph" class="chart_val" style="z-index: 9; width: <%=phCount * 1000 / bookedTripCountry.size()%>px;"></div>
                        <div id="id" class="chart_val" style="z-index: 8; width: <%=idCount * 1000 / bookedTripCountry.size()%>px;"></div>
                        <div id="kh" class="chart_val" style="z-index: 7; width: <%=khCount * 1000 / bookedTripCountry.size()%>px;"></div>
                        <div id="la" class="chart_val" style="z-index: 6; width: <%=laCount * 1000 / bookedTripCountry.size()%>px;"></div>
                        <div id="my" class="chart_val" style="z-index: 5; width: <%=myCount * 1000 / bookedTripCountry.size()%>px;"></div>
                        <div id="mm" class="chart_val" style="z-index: 4; width: <%=mmCount * 1000 / bookedTripCountry.size()%>px;"></div>
                        <div id="sg" class="chart_val" style="z-index: 3; width: <%=sgCount * 1000 / bookedTripCountry.size()%>px;"></div>
                        <div id="th" class="chart_val" style="z-index: 2; width: <%=thCount * 1000 / bookedTripCountry.size()%>px;"></div>
                        <div id="vn" class="chart_val" style="z-index: 1; width: <%=vnCount * 1000 / bookedTripCountry.size()%>px;"></div>
                    </div>
                    <div id="trip_dashboard_chart_legend">
                        <%
                            Vector countryCount = new Vector();
                            countryCount.setSize(10);
                            countryCount.set(9, vnCount - thCount);
                            countryCount.set(8, thCount - sgCount);
                            countryCount.set(7, sgCount - mmCount);
                            countryCount.set(6, mmCount - myCount);
                            countryCount.set(5, myCount - laCount);
                            countryCount.set(4, laCount - khCount);
                            countryCount.set(3, khCount - idCount);
                            countryCount.set(2, idCount - phCount);
                            countryCount.set(1, phCount - bnCount);
                            countryCount.set(0, bnCount);
                        %>
                        <div id="bn"></div> <p>Brunei<br>(<%=countryCount.get(0)%>)</p>
                        <div id="ph"></div> <p>Filipina<br>(<%=countryCount.get(1)%>)</p>
                        <div id="id"></div> <p>Indonesia<br>(<%=countryCount.get(2)%>)</p>
                        <div id="kh"></div> <p>Kamboja<br>(<%=countryCount.get(3)%>)</p>
                        <div id="la"></div> <p>Laos<br>(<%=countryCount.get(4)%>)</p>
                        <div id="my"></div> <p>Malaysia<br>(<%=countryCount.get(5)%>)</p>
                        <div id="mm"></div> <p>Myanmar<br>(<%=countryCount.get(6)%>)</p>
                        <div id="sg"></div> <p>Singapura<br>(<%=countryCount.get(7)%>)</p>
                        <div id="th"></div> <p>Thailand<br>(<%=countryCount.get(8)%>)</p>
                        <div id="vn"></div> <p>Vietnam<br>(<%=countryCount.get(9)%>)</p>
                    </div>
                    <div id="trip_dashboard_infographic">
                        <table>
                            <tr>
                                <td><div>
                                    <p>Total transaksi</p>
                                    <h1><%
                                        int totalTransaction = 0;
                                        for(int i = 0; i < bookedTripPrice.size(); i++){
                                            totalTransaction = totalTransaction + (int)bookedTripPrice.get(i);
                                        }
                                        out.println((double)totalTransaction / 1000000);
                                    %></h1>
                                    <p>Juta</p>
                                </div></td>
                                <td><div>
                                    <p>Total perjalanan</p>
                                    <h1><%=bookedTripPrice.size()%></h1>
                                    <p>Perjalanan</p>
                                </div></td>
                                <td><div>
                                    <p>Total peserta</p>
                                    <h1><%
                                        int totalPeople = 0;
                                        for(int i = 0; i < bookedTripPeople.size(); i++){
                                            totalPeople = totalPeople + (int)bookedTripPeople.get(i);
                                        }
                                        out.println(totalPeople);
                                    %></h1>
                                    <p>Peserta</p>
                                </div></td>
                                <td><div>
                                    <p>Total destinasi</p>
                                    <h1><%=totalDestinationList%></h1>
                                    <p>Destinasi</p>
                                </div></td>
                                <td><div>
                                    <p>Negara terpopuler</p>
                                    <h1><%
                                        String countryAbbr = "";
                                        String countryName = "";
                                        switch (countryCount.indexOf(Collections.max(countryCount))){
                                            case 0 : countryAbbr = "BN"; countryName = "Brunei"; break;
                                            case 1 : countryAbbr = "PH"; countryName = "Filipina"; break;
                                            case 2 : countryAbbr = "ID"; countryName = "Indonesia"; break;
                                            case 3 : countryAbbr = "KH"; countryName = "Kamboja"; break;
                                            case 4 : countryAbbr = "LA"; countryName = "Laos"; break;
                                            case 5 : countryAbbr = "MY"; countryName = "Malaysia"; break;
                                            case 6 : countryAbbr = "MM"; countryName = "Myanmar"; break;
                                            case 7 : countryAbbr = "SG"; countryName = "Singapura"; break;
                                            case 8 : countryAbbr = "TH"; countryName = "Thailand"; break;
                                            case 9 : countryAbbr = "VN"; countryName = "Vietnam"; break;
                                        }
                                        out.println(countryAbbr);
                                    %></h1>
                                    <p><%=countryName%></p>
                                </div></td>
                            </tr>
                        </table>
                    </div>
                </div>
            <%
                }
            %>
            <h2 class="trip_subsection">Riwayat Transaksi</h2>
            <table>
                <tr class="trip_show_row" id="trip_show_row_header">
                    <td>
                        <div class="trip_show_row_head" id="trip_show_row_head_destination">
                            <img src="assets/location.fill@2x.png" alt="" class="trip_show_icon">
                            <p>Tujuan</p>
                        </div>
                    </td>
                    <td>
                        <div class="trip_show_row_head" id="trip_show_row_head_date">
                            <img src="assets/calendar@2x.png" alt="" class="trip_show_icon">
                            <p>Tanggal</p>
                        </div>
                    </td>
                    <td>
                        <div class="trip_show_row_head" id="trip_show_row_head_people">
                            <img src="assets/person.fill@2x.png" alt="" class="trip_show_icon">
                            <p>Jumlah</p>
                        </div>
                    </td>
                    <td>
                        <div class="trip_show_row_head" id="trip_show_row_head_id">
                            <img src="assets/number.circle.fill@2x.png" alt="" class="trip_show_icon">
                            <p>ID Pemesanan</p>
                        </div>
                    </td>
                    <td>
                        <div class="trip_show_row_head" id="trip_show_row_head_detail">
                            <img src="assets/info.circle.fill@2x.png" alt="" class="trip_show_icon">
                            <p>
                                <%
                                    if(tempLoggedUser.equals("0")){
                                        out.println("Pembayaran");
                                    }
                                    else{
                                        out.println("Detail");
                                    }
                                %>
                            </p>
                        </div>
                    </td>
                </tr>
                <%
                    for(int i = 0; i < bookedTripCount; i++){
                %>
                <tr class="trip_show_row">
                    <td>
                        <div class="trip_show_row_destination">
                            <%
                            if(Integer.parseInt((String)bookedTripDestinationId.get(i)) > 153){
                            %>
                            <img src="photos/sample.jpg" alt="" class="trip_show_row_image">
                            <%
                            }
                            else{
                            %>
                            <img src="photos/<%=bookedTripDestinationId.get(i)%>.jpg" alt="" class="trip_show_row_image">
                            <%
                            }
                            %>
                            <div class="trip_show_row_destination_detail">
                                <p><b><%=bookedTripName.get(i)%></b></p>
                                <p><%=bookedTripLocation.get(i)%>, <%=bookedTripCountry.get(i)%></p>
                            </div>
                        </div>
                    </td>
                    <td>
                        <p><%=bookedTripDate.get(i)%></p>
                    </td>
                    <td>
                        <p><%=bookedTripPeople.get(i)%></p>
                    </td>
                    <td>
                        <p><%=bookedTripId.get(i)%></p>
                    </td>
                    <td class="trip_show_row_block_detail">
                        <%
                            if(tempLoggedUser.equals("0")){
                                out.println(bookedTripPrice.get(i));
                            }
                            else{
                        %>
                        <button type="submit" class="trip_show_row_detail" name="selected_trip" value="<%=bookedTripId.get(i)%>">
                            <img src="assets/eye.fill@2x.png" alt="" class="trip_show_icon_detail">
                        </button>
                        <%    
                            }
                        %>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
    </div>
    <script>
        window.addEventListener('scroll', function(){
            let value = window.scrollY;
            if(value >= 1){
                if(value * 0.005 < 0.5){
                    document.getElementById('navbar_nav').style.backgroundColor = "rgba(12, 16, 39, " + value * 0.005 + ")";
                }
                else{
                    document.getElementById('navbar_nav').style.backgroundColor = "rgba(12, 16, 39, 0.5)";
                }
            }
            else{
                document.getElementById('navbar_nav').style.backgroundColor = "rgba(0, 0, 0, 0)";
            }
        })
    </script>
</body>
</html>