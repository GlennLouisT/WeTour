<%@include file="connect.jsp" %>
<%@ page import="java.util.*" %>

<%
    Connect con = Connect.getConnection();

    String selectedId = (String) session.getAttribute("tryBookDestinationId");

    String destinationId = "";
    String destinationName = "";
    int destinationPrice = 0;

    String bookDestinationQuery = String.format(""
        +"SELECT "
            +"d.destinationId AS 'destinationId', "
            +"d.destinationName AS 'destinationName', "
            +"d.destinationPrice AS 'destinationPrice' "
        +"FROM destination d "
        +"WHERE destinationId = %s "
        +"", selectedId);
    ResultSet bookDestinationRes = con.executeQuery(bookDestinationQuery);
    while(bookDestinationRes.next()){
        destinationId = bookDestinationRes.getString("destinationId");
        destinationName = bookDestinationRes.getString("destinationName");
        destinationPrice = bookDestinationRes.getInt("destinationPrice");
    }
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
        Vector payBookName = new Vector();
        Vector payBookPassport = new Vector();
        Vector payBookGender = new Vector();
        Vector payBookAge = new Vector();
        Vector payBookSpecial = new Vector();

        payBookName = (Vector) session.getAttribute("payBookName");
        payBookPassport = (Vector) session.getAttribute("payBookPassport");
        payBookGender = (Vector) session.getAttribute("payBookGender");
        payBookAge = (Vector) session.getAttribute("payBookAge");
        payBookSpecial = (Vector) session.getAttribute("payBookSpecial");

        int payBookPerson = (int) session.getAttribute("payBookPerson");

        session.setAttribute("verifiedPrice", payBookPerson * destinationPrice);
        session.setAttribute("verifiedDestination", destinationId);
    %>
    <div id="navbar">
        <%@include file="navbar.jsp"%>
    </div>
    <div class="space"></div>
    <div id="bookPayment_content">
        <h1>Pembayaran Pemesanan</h1>
        <form action="bookPaymentConfirm.jsp">
            <div>
                <div id="bookPayment_content_image">
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
                <div id="bookPayment_content_info">
                    <table>
                        <tr>
                            <td id="bookPayment_content_info_location">
                                <h2><%=destinationName%></h2>
                            </td>
                            <td id="bookPayment_content_info_person">
                                <div>
                                    <img src="assets/person.fill@2x.png" alt="" class="bookPayment_iconsets">
                                    <h2><%=payBookPerson%></h2>
                                </div>
                            </td>
                            <td id="bookPayment_content_info_total">
                                <h2 class="bookPayment_content_info_right"><%="Rp" + (payBookPerson * destinationPrice) %></h2>
                            </td>
                        </tr>
                        <%
                            for(int i = 0; i < payBookPerson; i++){
                        %>
                        <tr class="bookPayment_content_info_content">
                            <td colspan="3">
                                <%
                                    String payBookNameLoop = (String) payBookName.get(i);
                                    String payBookPassportLoop = (String) payBookPassport.get(i);
                                    String payBookGenderLoop = (String) payBookGender.get(i);
                                    if(payBookGenderLoop.equals("1")){
                                        payBookGenderLoop = "L";
                                    }
                                    else if(payBookGenderLoop.equals("2")){
                                        payBookGenderLoop = "P";
                                    }
                                    else if(payBookGenderLoop.equals("0")){
                                        payBookGenderLoop = "O";
                                    }
                                    String payBookAgeLoop = (String) payBookAge.get(i);
                                %>
                                <p><% out.println(payBookNameLoop.toUpperCase() + " (" + payBookPassportLoop.toUpperCase() + "), " + payBookGenderLoop + payBookAgeLoop); %></p>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        <tr class="bookPayment_content_info_total">
                            <td colspan="2">
                                <h2>Total</h2>
                            </td>
                            <td>
                                <h2 class="bookPayment_content_info_right"><%="Rp" + (payBookPerson * destinationPrice) %></h2>
                            </td>
                        </tr>
                        <tr class="bookPayment_content_info_tax">
                            <td colspan="3">
                                <p class="bookPayment_content_info_right">Sudah termasuk PPN 11% sebesar Rp<%=((payBookPerson * destinationPrice) - (payBookPerson * destinationPrice / 111 * 100))%></p>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="bookPayment_content_action">
                <a href="index.jsp"><p>Batalkan</p></a>
                <button type="submit" name="booked_destination" value="<%=destinationId%>">Bayar</button>
            </div>
        </form>
    </div>
</body>
</html>