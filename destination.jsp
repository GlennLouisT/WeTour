<%@include file="connect.jsp" %>
<%@ page import="java.util.*" %>

<%
    Connect con = Connect.getConnection();

    String tempLoggedUser = (String) session.getAttribute("logProfile");

    String searchBoxDestinationName = request.getParameter("search_destination_box");
    String additionalQuery = "";
    if(searchBoxDestinationName != null){
        additionalQuery = String.format(" AND (d.destinationName LIKE '%%%s%%' OR c.countryName LIKE '%%%s%%' OR a.admName LIKE '%%%s%%')",searchBoxDestinationName, searchBoxDestinationName, searchBoxDestinationName);
    }

    String loggedUser;
    Vector searchedDestinationId = new Vector();
    Vector searchedDestinationName = new Vector();
    Vector searchedDestinationPrice = new Vector();
    Vector searchedDestinationLocation = new Vector();
    Vector searchedDestinationCountry = new Vector();
    int totalDestinationCount = 0;

    String countTotalDestinationQuery = String.format(""
    +"SELECT "
        +"COUNT(*) "
    +"FROM destination d "
    +"JOIN administrative a "
        +"ON d.destinationLocation = a.admId "
    +"JOIN country c "
        +"ON d.destinationCountry = c.countryId "
    +"WHERE d.destinationHeritagePark < 2 "
    +"%s", additionalQuery);
    ResultSet countTotalDestinationRes = con.executeQuery(countTotalDestinationQuery);
    if(countTotalDestinationRes.next()){
        totalDestinationCount = countTotalDestinationRes.getInt("COUNT(*)");
    }

    String showDestinationQuery = String.format(""
        +"SELECT "
            +"d.destinationId AS 'destinationId', "
            +"d.destinationName AS 'destinationName', "
            +"d.destinationPrice AS 'destinationPrice', "
            +"a.admName AS 'destinationLocation', "
            +"c.countryName AS 'destinationCountry' "
        +"FROM destination d "
        +"JOIN administrative a "
            +"ON d.destinationLocation = a.admId "
        +"JOIN country c "
            +"ON d.destinationCountry = c.countryId "
        +"WHERE d.destinationHeritagePark < 2 "
        +"%s "
        +"ORDER BY destinationName "
    +"", additionalQuery);
    ResultSet showDestinationRes = con.executeQuery(showDestinationQuery);
    while(showDestinationRes.next()){
        searchedDestinationId.add(showDestinationRes.getString("destinationId"));
        searchedDestinationName.add(showDestinationRes.getString("destinationName"));
        searchedDestinationPrice.add(showDestinationRes.getString("destinationPrice"));
        searchedDestinationLocation.add(showDestinationRes.getString("destinationLocation"));
        searchedDestinationCountry.add(showDestinationRes.getString("destinationCountry"));
    }
%>

<!DOCTYPE html>
<html lang="en" id="destination">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%
        if(tempLoggedUser != null){
            if(tempLoggedUser.equals("0")){
    %>
    <a href="addLocation.jsp" id="add_destination" class="floating">
        <img src="assets/plus@2x.png" alt="">
    </a>
    <%
            }
        }
    %>
    <div id="back_to_top" class="floating" onclick="back_to_top()">
        <img src="assets/arrow.up@2x.png" alt="">
    </div>
    <div id="navbar">
        <%@include file="navbar.jsp"%>
    </div>
    <div class="space"></div>
    <div id="destination_content">
        <div id="destination_head">
            <h1>Destinasi</h1>
            <form id="home_search" action="destination.jsp">
                <div>
                    <img src="assets/location.fill@2x.png" alt="" class="menu_search_icon">
                    <input type="text" name="search_destination_box" id="home_search_location" class="home_search_input" placeholder="Masukkan nama negara, kota, atau tujuan destinasi" value="<%=searchBoxDestinationName%>">
                </div>
                <button type="submit" id="home_search_button">Cari</button>
            </form>
        </div>
        <form id="destination_search" action="location.jsp">
            <table>
                <%
                    int totalRow = (int)Math.ceil((double)totalDestinationCount/3);
                    for(int i = 0; i < totalRow; i++){
                %>
                <tr>
                <%
                        if(Math.floor((double)totalDestinationCount/3) > 0){
                            for(int j = 0; j < 3; j++){
                %>
                    <td>
                        <div class="destination_search_cell">
                            <%
                            if(Integer.parseInt((String)searchedDestinationId.get(i*3+j)) > 153){
                            %>
                            <img src="photos/sample.jpg" alt="">
                            <%
                            }
                            else{
                            %>
                            <img src="photos/<%=searchedDestinationId.get(i*3+j)%>.jpg" alt="">
                            <%
                            }
                            %>
                            <div class="destination_search_cell_info">
                                <div>
                                    <h3><%=searchedDestinationName.get(i*3+j)%></h3>
                                    <p><%=searchedDestinationLocation.get(i*3+j)%>, <%=searchedDestinationCountry.get(i*3+j)%></p>
                                </div>
                                <p>Rp<%=searchedDestinationPrice.get(i*3+j)%>,00</p>
                                <div id="destination_search_cell_action">
                                    <button type="submit" name="selected_destination" value="<%=searchedDestinationId.get(i*3+j)%>">Detail</button>
                                    <%
                                        if(tempLoggedUser != null){
                                            if(tempLoggedUser.equals("0")){
                                    %>
                                    <a href="editLocation.jsp?editId=<%=searchedDestinationId.get(i*3+j)%>">
                                        <img src="assets/pencil.circle.fill@2x.png" alt="">
                                        <p>Ubah</p>
                                    </a>
                                    <a href="deleteLocationController.jsp?deleteId=<%=searchedDestinationId.get(i*3+j)%>">
                                        <img src="assets/trash.circle.fill@2x.png" alt="">
                                        <p>Hapus</p>
                                    </a>
                                    <%
                                            }
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                    </td>
                <%
                            }
                            totalDestinationCount = totalDestinationCount - 3;
                        }
                        else{
                            for(int j = 0; j < totalDestinationCount; j++){
                %>
                    <td>
                        <div class="destination_search_cell">
                            <%
                            if(Integer.parseInt((String)searchedDestinationId.get(i*3+j)) > 153){
                            %>
                            <img src="photos/sample.jpg" alt="">
                            <%
                            }
                            else{
                            %>
                            <img src="photos/<%=searchedDestinationId.get(i*3+j)%>.jpg" alt="">
                            <%
                            }
                            %>
                            <div class="destination_search_cell_info">
                                <div>
                                    <h3><%=searchedDestinationName.get(i*3+j)%></h3>
                                    <p><%=searchedDestinationLocation.get(i*3+j)%>, <%=searchedDestinationCountry.get(i*3+j)%></p>
                                </div>
                                <p>Rp<%=searchedDestinationPrice.get(i*3+j)%>,00</p>
                                <div id="destination_search_cell_action">
                                    <button type="submit" name="selected_destination" value="<%=searchedDestinationId.get(i*3+j)%>">Detail</button>
                                    <%
                                        if(tempLoggedUser != null){
                                            if(tempLoggedUser.equals("0")){
                                    %>
                                    <a href="editLocation.jsp?editId=<%=searchedDestinationId.get(i*3+j)%>">
                                        <img src="assets/pencil.circle.fill@2x.png" alt="">
                                        <p>Ubah</p>
                                    </a>
                                    <a href="deleteLocationController.jsp?deleteId=<%=searchedDestinationId.get(i*3+j)%>">
                                        <img src="assets/trash.circle.fill@2x.png" alt="">
                                        <p>Hapus</p>
                                    </a>
                                    <%
                                            }
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                    </td>
                <%
                            }
                            totalDestinationCount = totalDestinationCount - totalDestinationCount;
                        }
                %>
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
        function back_to_top() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
    </script>
</body>
</html>