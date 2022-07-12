<%@include file="connect.jsp" %>
<%@ page import="java.util.*" %>

<%
    Connect con = Connect.getConnection();

    int bnDataTotal = 0;
    int phDataTotal = 0;
    int idDataTotal = 0;
    int khDataTotal = 0;
    int laDataTotal = 0;
    int myDataTotal = 0;
    int mmDataTotal = 0;
    int sgDataTotal = 0;
    int thDataTotal = 0;
    int vnDataTotal = 0;

    String countBnQuery = "SELECT COUNT(*) FROM destination WHERE destinationCountry = 1 AND destinationHeritagePark = 1";
    ResultSet countBnRes = con.executeQuery(countBnQuery);
    if(countBnRes.next()){
        bnDataTotal = countBnRes.getInt(1);
    }
    String countPhQuery = "SELECT COUNT(*) FROM destination WHERE destinationCountry = 2 AND destinationHeritagePark = 1";
    ResultSet countPhRes = con.executeQuery(countPhQuery);
    if(countPhRes.next()){
        phDataTotal = countPhRes.getInt(1);
    }
    String countIdQuery = "SELECT COUNT(*) FROM destination WHERE destinationCountry = 3 AND destinationHeritagePark = 1";
    ResultSet countIdRes = con.executeQuery(countIdQuery);
    if(countIdRes.next()){
        idDataTotal = countIdRes.getInt(1);
    }
    String countKhQuery = "SELECT COUNT(*) FROM destination WHERE destinationCountry = 4 AND destinationHeritagePark = 1";
    ResultSet countKhRes = con.executeQuery(countKhQuery);
    if(countKhRes.next()){
        khDataTotal = countKhRes.getInt(1);
    }
    String countLaQuery = "SELECT COUNT(*) FROM destination WHERE destinationCountry = 5 AND destinationHeritagePark = 1";
    ResultSet countLaRes = con.executeQuery(countLaQuery);
    if(countLaRes.next()){
        laDataTotal = countLaRes.getInt(1);
    }
    String countMyQuery = "SELECT COUNT(*) FROM destination WHERE destinationCountry = 6 AND destinationHeritagePark = 1";
    ResultSet countMyRes = con.executeQuery(countMyQuery);
    if(countMyRes.next()){
        myDataTotal = countMyRes.getInt(1);
    }
    String countMmQuery = "SELECT COUNT(*) FROM destination WHERE destinationCountry = 7 AND destinationHeritagePark = 1";
    ResultSet countMmRes = con.executeQuery(countMmQuery);
    if(countMmRes.next()){
        mmDataTotal = countMmRes.getInt(1);
    }
    String countSgQuery = "SELECT COUNT(*) FROM destination WHERE destinationCountry = 8 AND destinationHeritagePark = 1";
    ResultSet countSgRes = con.executeQuery(countSgQuery);
    if(countSgRes.next()){
        sgDataTotal = countSgRes.getInt(1);
    }
    String countThQuery = "SELECT COUNT(*) FROM destination WHERE destinationCountry = 9 AND destinationHeritagePark = 1";
    ResultSet countThRes = con.executeQuery(countThQuery);
    if(countThRes.next()){
        thDataTotal = countThRes.getInt(1);
    }
    String countVnQuery = "SELECT COUNT(*) FROM destination WHERE destinationCountry = 10 AND destinationHeritagePark = 1";
    ResultSet countVnRes = con.executeQuery(countVnQuery);
    if(countVnRes.next()){
        vnDataTotal = countVnRes.getInt(1);
    }
%>

<!DOCTYPE html>
<html lang="en" id="heritage">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div id="back_to_top" class="floating" onclick="back_to_top()">
        <img src="assets/arrow.up@2x.png" alt="">
    </div>
    <div id="navbar">
        <%@include file="navbar.jsp"%>
    </div>
    <div class="space"></div>
    <div id="heritage_content">
        <h1>Taman Warisan ASEAN</h1>
        <p>Taman Warisan ASEAN (AHP) merupakan daerah terlindungi dalam kawasan ASEAN yang dipilih berdasarkan keunikan biodivesitas dan ekosistem, penelitian, rekreasional, dan pariwisata.</p>
    </div>
    <section id="heritage_nav">
        <h1>Destinasi Negara ASEAN</h1>
        <div>
            <a href="#heritage_bn">
                <img src="assets/bn copy.png" alt="" class="heritage_stamp">
                <p>Brunei</p>
            </a>
            <a href="#heritage_ph">
                <img src="assets/ph copy.png" alt="" class="heritage_stamp">
                <p>Filipina</p>
            </a>
            <a href="#heritage_id">
                <img src="assets/id copy.png" alt="" class="heritage_stamp">
                <p>Indonesia</p>
            </a>
            <a href="#heritage_kh">
                <img src="assets/kh copy.png" alt="" class="heritage_stamp">
                <p>Kamboja</p>
            </a>
            <a href="#heritage_la">
                <img src="assets/la copy.png" alt="" class="heritage_stamp">
                <p>Laos</p>
            </a>
        </div>
        <div>
            <a href="#heritage_my">
                <img src="assets/my copy.png" alt="" class="heritage_stamp">
                <p>Malaysia</p>
            </a>
            <a href="#heritage_mm">
                <img src="assets/mm copy.png" alt="" class="heritage_stamp">
                <p>Myanmar</p>
            </a>
            <a href="#heritage_sg">
                <img src="assets/sg copy.png" alt="" class="heritage_stamp">
                <p>Singapura</p>
            </a>
            <a href="#heritage_th">
                <img src="assets/th copy.png" alt="" class="heritage_stamp">
                <p>Thailand</p>
            </a>
            <a href="#heritage_vn">
                <img src="assets/vn copy.png" alt="" class="heritage_stamp">
                <p>Vietnam</p>
            </a>
        </div>
    </section>
    <form id="heritage_bn" class="heritage_section" action="location.jsp">
        <div>
            <img src="assets/bn copy.png" alt="">
            <h1>Brunei</h1>
        </div>
        <%
            int bnRow = (int)Math.ceil((double)bnDataTotal/4);
            Vector bnDataDestinationId = new Vector();
            Vector bnDataDestinationName = new Vector();
            Vector bnDataDestinationType = new Vector();
            Vector bnDataDestinationLocation = new Vector();
            Vector bnDataDestinationPrice = new Vector();
            Vector bnDataDestinationLocationCapital = new Vector();
            Vector bnDataDestinationCountryCapital = new Vector();
            Vector bnDataDestinationDestinationLong = new Vector();
            Vector bnDataDestinationDestinationLat = new Vector();
            Vector bnDataDestinationCountryCapitalLong = new Vector();
            Vector bnDataDestinationCountryCapitalLat = new Vector();
            Vector bnDataDestinationLocationCapitalLong = new Vector();
            Vector bnDataDestinationLocationCapitalLat = new Vector();
            String bnSelectQuery = String.format(""
                +"SELECT "
                    +"d.destinationId AS 'destinationId', "
                    +"d.destinationName AS 'destinationName', "
                    +"d.destinationType AS 'destinationType', "
                    +"ad.admName AS 'destinationLocation', "
                    +"d.destinationPrice AS 'destinationPrice', "
                    +"ad.admCapital AS 'destinationLocationCapital', "
                    +"ac.admCapital AS 'destinationCountryCapital', "
                    +"d.destinationLong AS 'destinationLong', "
                    +"d.destinationLat AS 'destinationLat', "
                    +"ac.admLong AS 'destinationCountryCapitalLong', "
                    +"ac.admLat AS 'destinationCountryCapitalLat', "
                    +"ad.admLong AS 'destinationLocationCapitalLong', "
                    +"ad.admLat AS 'destinationLocationCapitalLat' "
                +"FROM destination d "
                +"JOIN administrative ad "
                    +"ON d.destinationLocation = ad.admId "
                +"JOIN country c "
                	+"ON d.destinationCountry = c.countryId "
                +"JOIN administrative ac "
                    +"ON c.countryCapitalId = ac.admId "
                +"WHERE destinationCountry = 1 AND destinationHeritagePark = 1"
            +"");
            ResultSet bnSelectRes = con.executeQuery(bnSelectQuery);
            while(bnSelectRes.next()){
                bnDataDestinationId.add(bnSelectRes.getInt("destinationId"));
                bnDataDestinationName.add(bnSelectRes.getString("destinationName"));
                bnDataDestinationType.add(bnSelectRes.getString("destinationType"));
                bnDataDestinationLocation.add(bnSelectRes.getString("destinationLocation"));
                bnDataDestinationPrice.add(bnSelectRes.getInt("destinationPrice"));
                bnDataDestinationLocationCapital.add(bnSelectRes.getString("destinationLocationCapital"));
                bnDataDestinationCountryCapital.add(bnSelectRes.getString("destinationCountryCapital"));
                bnDataDestinationDestinationLong.add(bnSelectRes.getDouble("destinationLong"));
                bnDataDestinationDestinationLat.add(bnSelectRes.getDouble("destinationLat"));
                bnDataDestinationCountryCapitalLong.add(bnSelectRes.getDouble("destinationCountryCapitalLong"));
                bnDataDestinationCountryCapitalLat.add(bnSelectRes.getDouble("destinationCountryCapitalLat"));
                bnDataDestinationLocationCapitalLong.add(bnSelectRes.getDouble("destinationLocationCapitalLong"));
                bnDataDestinationLocationCapitalLat.add(bnSelectRes.getDouble("destinationLocationCapitalLat"));
            }
            //out.println(idDataDestinationName);
            for(int i = 0; i < bnRow; i++){
        %> 
        <table> 
            <tr>
            <%
                if(Math.floor((double)bnDataTotal/4) > 0){
                    for(int j = 0; j < 4; j++){
                        //out.println(idDataDestinationId.get(i*4+j));
                    %>
                <td class="heritage_cell">
                    <div class="heritage_card">
                        <img src="photos/<%=bnDataDestinationId.get(i*4+j)%>.jpg" alt="">
                        <div>
                            <h3><%=bnDataDestinationType.get(i*4+j)%></h3>
                            <h2><%=bnDataDestinationName.get(i*4+j)%></h2>
                            <div class="heritage_card_place_display">
                                <img src="assets/mappin@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=bnDataDestinationLocation.get(i*4+j)%></h4>
                            </div>
                            <%
                                double bnDestinationDistanceCountryCapital = 0;
                                bnDestinationDistanceCountryCapital = Math.sqrt(Math.pow(((double)bnDataDestinationDestinationLong.get(i*4+j)-(double)bnDataDestinationCountryCapitalLong.get(i*4+j)), 2) + Math.pow(((double)bnDataDestinationDestinationLat.get(i*4+j)-(double)bnDataDestinationCountryCapitalLat.get(i*4+j)), 2)) * 111.322;
                                bnDestinationDistanceCountryCapital = (double) Math.round(bnDestinationDistanceCountryCapital * 10)/10;
                                double bnDestinationDistanceLocationCapital = 0;
                                bnDestinationDistanceLocationCapital = Math.sqrt(Math.pow(((double)bnDataDestinationDestinationLong.get(i*4+j)-(double)bnDataDestinationLocationCapitalLong.get(i*4+j)), 2) + Math.pow(((double)bnDataDestinationDestinationLat.get(i*4+j)-(double)bnDataDestinationLocationCapitalLat.get(i*4+j)), 2)) * 111.322;
                                bnDestinationDistanceLocationCapital = (double) Math.round(bnDestinationDistanceLocationCapital * 10)/10;
                            %>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/ruler.fill@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=bnDestinationDistanceLocationCapital%>km dari <%=bnDataDestinationLocationCapital.get(i*4+j)%></h4>
                            </div>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/airplane@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=bnDestinationDistanceCountryCapital%>km dari <%=bnDataDestinationCountryCapital.get(i*4+j)%></h4>
                            </div>
                            <h2 class="heritage_card_price_hover">Rp<%=bnDataDestinationPrice.get(i*4+j)%>.00</h2>
                        </div>
                        <button type="submit" name="selected_destination" value="<%=bnDataDestinationId.get(i*4+j)%>">Lebih detail</button>
                    </div>
                </td>
                    <%
                    }
                    bnDataTotal = bnDataTotal - 4;
                    //out.println(bnDataTotal);
                }
                else{
                    for(int j = 0; j < bnDataTotal; j++){
                        //out.println(bnDataDestinationId.get(i*4+j));
                    %>
                <td class="heritage_cell">
                    <div class="heritage_card">
                        <img src="photos/<%=bnDataDestinationId.get(i*4+j)%>.jpg" alt="">
                        <div>
                            <h3><%=bnDataDestinationType.get(i*4+j)%></h3>
                            <h2><%=bnDataDestinationName.get(i*4+j)%></h2>
                            <div class="heritage_card_place_display">
                                <img src="assets/mappin@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=bnDataDestinationLocation.get(i*4+j)%></h4>
                            </div>
                            <%
                                double bnDestinationDistanceCountryCapital = 0;
                                bnDestinationDistanceCountryCapital = Math.sqrt(Math.pow(((double)bnDataDestinationDestinationLong.get(i*4+j)-(double)bnDataDestinationCountryCapitalLong.get(i*4+j)), 2) + Math.pow(((double)bnDataDestinationDestinationLat.get(i*4+j)-(double)bnDataDestinationCountryCapitalLat.get(i*4+j)), 2)) * 111.322;
                                bnDestinationDistanceCountryCapital = (double) Math.round(bnDestinationDistanceCountryCapital * 10)/10;
                                double bnDestinationDistanceLocationCapital = 0;
                                bnDestinationDistanceLocationCapital = Math.sqrt(Math.pow(((double)bnDataDestinationDestinationLong.get(i*4+j)-(double)bnDataDestinationLocationCapitalLong.get(i*4+j)), 2) + Math.pow(((double)bnDataDestinationDestinationLat.get(i*4+j)-(double)bnDataDestinationLocationCapitalLat.get(i*4+j)), 2)) * 111.322;
                                bnDestinationDistanceLocationCapital = (double) Math.round(bnDestinationDistanceLocationCapital * 10)/10;
                            %>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/ruler.fill@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=bnDestinationDistanceLocationCapital%>km dari <%=bnDataDestinationLocationCapital.get(i*4+j)%></h4>
                            </div>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/airplane@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=bnDestinationDistanceCountryCapital%>km dari <%=bnDataDestinationCountryCapital.get(i*4+j)%></h4>
                            </div>
                            <h2 class="heritage_card_price_hover">Rp<%=bnDataDestinationPrice.get(i*4+j)%>.00</h2>
                        </div>
                        <button type="submit" name="selected_destination" value="<%=bnDataDestinationId.get(i*4+j)%>">Lebih detail</button>
                    </div>
                </td>
                    <%
                    }
                    bnDataTotal = bnDataTotal - bnDataTotal;
                }
            %> 
            </tr>
        </table>
        <%
            }
            //out.println(bnRow);
        %>
    </form>
    <form id="heritage_ph" class="heritage_section" action="location.jsp">
        <div>
            <img src="assets/ph copy.png" alt="">
            <h1>Filipina</h1>
        </div>
        <%
            int phRow = (int)Math.ceil((double)phDataTotal/4);
            Vector phDataDestinationId = new Vector();
            Vector phDataDestinationName = new Vector();
            Vector phDataDestinationType = new Vector();
            Vector phDataDestinationLocation = new Vector();
            Vector phDataDestinationPrice = new Vector();
            Vector phDataDestinationLocationCapital = new Vector();
            Vector phDataDestinationCountryCapital = new Vector();
            Vector phDataDestinationDestinationLong = new Vector();
            Vector phDataDestinationDestinationLat = new Vector();
            Vector phDataDestinationCountryCapitalLong = new Vector();
            Vector phDataDestinationCountryCapitalLat = new Vector();
            Vector phDataDestinationLocationCapitalLong = new Vector();
            Vector phDataDestinationLocationCapitalLat = new Vector();
            String phSelectQuery = String.format(""
                +"SELECT "
                    +"d.destinationId AS 'destinationId', "
                    +"d.destinationName AS 'destinationName', "
                    +"d.destinationType AS 'destinationType', "
                    +"ad.admName AS 'destinationLocation', "
                    +"d.destinationPrice AS 'destinationPrice', "
                    +"ad.admCapital AS 'destinationLocationCapital', "
                    +"ac.admCapital AS 'destinationCountryCapital', "
                    +"d.destinationLong AS 'destinationLong', "
                    +"d.destinationLat AS 'destinationLat', "
                    +"ac.admLong AS 'destinationCountryCapitalLong', "
                    +"ac.admLat AS 'destinationCountryCapitalLat', "
                    +"ad.admLong AS 'destinationLocationCapitalLong', "
                    +"ad.admLat AS 'destinationLocationCapitalLat' "
                +"FROM destination d "
                +"JOIN administrative ad "
                    +"ON d.destinationLocation = ad.admId "
                +"JOIN country c "
                	+"ON d.destinationCountry = c.countryId "
                +"JOIN administrative ac "
                    +"ON c.countryCapitalId = ac.admId "
                +"WHERE destinationCountry = 2 AND destinationHeritagePark = 1"
            +"");
            ResultSet phSelectRes = con.executeQuery(phSelectQuery);
            while(phSelectRes.next()){
                phDataDestinationId.add(phSelectRes.getInt("destinationId"));
                phDataDestinationName.add(phSelectRes.getString("destinationName"));
                phDataDestinationType.add(phSelectRes.getString("destinationType"));
                phDataDestinationLocation.add(phSelectRes.getString("destinationLocation"));
                phDataDestinationPrice.add(phSelectRes.getInt("destinationPrice"));
                phDataDestinationLocationCapital.add(phSelectRes.getString("destinationLocationCapital"));
                phDataDestinationCountryCapital.add(phSelectRes.getString("destinationCountryCapital"));
                phDataDestinationDestinationLong.add(phSelectRes.getDouble("destinationLong"));
                phDataDestinationDestinationLat.add(phSelectRes.getDouble("destinationLat"));
                phDataDestinationCountryCapitalLong.add(phSelectRes.getDouble("destinationCountryCapitalLong"));
                phDataDestinationCountryCapitalLat.add(phSelectRes.getDouble("destinationCountryCapitalLat"));
                phDataDestinationLocationCapitalLong.add(phSelectRes.getDouble("destinationLocationCapitalLong"));
                phDataDestinationLocationCapitalLat.add(phSelectRes.getDouble("destinationLocationCapitalLat"));
            }
            //out.println(phDataDestinationName);
            for(int i = 0; i < phRow; i++){
        %> 
        <table> 
            <tr>
            <%
                if(Math.floor((double)phDataTotal/4) > 0){
                    for(int j = 0; j < 4; j++){
                        //out.println(phDataDestinationId.get(i*4+j));
                    %>
                <td class="heritage_cell">
                    <div class="heritage_card">
                        <img src="photos/<%=phDataDestinationId.get(i*4+j)%>.jpg" alt="">
                        <div>
                            <h3><%=phDataDestinationType.get(i*4+j)%></h3>
                            <h2><%=phDataDestinationName.get(i*4+j)%></h2>
                            <div class="heritage_card_place_display">
                                <img src="assets/mappin@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=phDataDestinationLocation.get(i*4+j)%></h4>
                            </div>
                            <%
                                double phDestinationDistanceCountryCapital = 0;
                                phDestinationDistanceCountryCapital = Math.sqrt(Math.pow(((double)phDataDestinationDestinationLong.get(i*4+j)-(double)phDataDestinationCountryCapitalLong.get(i*4+j)), 2) + Math.pow(((double)phDataDestinationDestinationLat.get(i*4+j)-(double)phDataDestinationCountryCapitalLat.get(i*4+j)), 2)) * 111.322;
                                phDestinationDistanceCountryCapital = (double) Math.round(phDestinationDistanceCountryCapital * 10)/10;
                                double phDestinationDistanceLocationCapital = 0;
                                phDestinationDistanceLocationCapital = Math.sqrt(Math.pow(((double)phDataDestinationDestinationLong.get(i*4+j)-(double)phDataDestinationLocationCapitalLong.get(i*4+j)), 2) + Math.pow(((double)phDataDestinationDestinationLat.get(i*4+j)-(double)phDataDestinationLocationCapitalLat.get(i*4+j)), 2)) * 111.322;
                                phDestinationDistanceLocationCapital = (double) Math.round(phDestinationDistanceLocationCapital * 10)/10;
                            %>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/ruler.fill@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=phDestinationDistanceLocationCapital%>km dari <%=phDataDestinationLocationCapital.get(i*4+j)%></h4>
                            </div>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/airplane@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=phDestinationDistanceCountryCapital%>km dari <%=phDataDestinationCountryCapital.get(i*4+j)%></h4>
                            </div>
                            <h2 class="heritage_card_price_hover">Rp<%=phDataDestinationPrice.get(i*4+j)%>.00</h2>
                        </div>
                        <button type="submit" name="selected_destination" value="<%=phDataDestinationId.get(i*4+j)%>">Lebih detail</button>
                    </div>
                </td>
                    <%
                    }
                    phDataTotal = phDataTotal - 4;
                    //out.println(phDataTotal);
                }
                else{
                    for(int j = 0; j < phDataTotal; j++){
                        //out.println(phDataDestinationId.get(i*4+j));
                    %>
                <td class="heritage_cell">
                    <div class="heritage_card">
                        <img src="photos/<%=phDataDestinationId.get(i*4+j)%>.jpg" alt="">
                        <div>
                            <h3><%=phDataDestinationType.get(i*4+j)%></h3>
                            <h2><%=phDataDestinationName.get(i*4+j)%></h2>
                            <div class="heritage_card_place_display">
                                <img src="assets/mappin@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=phDataDestinationLocation.get(i*4+j)%></h4>
                            </div>
                            <%
                                double phDestinationDistanceCountryCapital = 0;
                                phDestinationDistanceCountryCapital = Math.sqrt(Math.pow(((double)phDataDestinationDestinationLong.get(i*4+j)-(double)phDataDestinationCountryCapitalLong.get(i*4+j)), 2) + Math.pow(((double)phDataDestinationDestinationLat.get(i*4+j)-(double)phDataDestinationCountryCapitalLat.get(i*4+j)), 2)) * 111.322;
                                phDestinationDistanceCountryCapital = (double) Math.round(phDestinationDistanceCountryCapital * 10)/10;
                                double phDestinationDistanceLocationCapital = 0;
                                phDestinationDistanceLocationCapital = Math.sqrt(Math.pow(((double)phDataDestinationDestinationLong.get(i*4+j)-(double)phDataDestinationLocationCapitalLong.get(i*4+j)), 2) + Math.pow(((double)phDataDestinationDestinationLat.get(i*4+j)-(double)phDataDestinationLocationCapitalLat.get(i*4+j)), 2)) * 111.322;
                                phDestinationDistanceLocationCapital = (double) Math.round(phDestinationDistanceLocationCapital * 10)/10;
                            %>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/ruler.fill@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=phDestinationDistanceLocationCapital%>km dari <%=phDataDestinationLocationCapital.get(i*4+j)%></h4>
                            </div>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/airplane@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=phDestinationDistanceCountryCapital%>km dari <%=phDataDestinationCountryCapital.get(i*4+j)%></h4>
                            </div>
                            <h2 class="heritage_card_price_hover">Rp<%=phDataDestinationPrice.get(i*4+j)%>.00</h2>
                        </div>
                        <button type="submit" name="selected_destination" value="<%=phDataDestinationId.get(i*4+j)%>">Lebih detail</button>
                    </div>
                </td>
                    <%
                    }
                    phDataTotal = phDataTotal - phDataTotal;
                }
            %> 
            </tr>
        </table>
        <%
            }
            //out.println(phRow);
        %>
    </form>
    <form id="heritage_id" class="heritage_section" action="location.jsp">
        <div>
            <img src="assets/id copy.png" alt="">
            <h1>Indonesia</h1>
        </div>
        <%
            int idRow = (int)Math.ceil((double)idDataTotal/4);
            Vector idDataDestinationId = new Vector();
            Vector idDataDestinationName = new Vector();
            Vector idDataDestinationType = new Vector();
            Vector idDataDestinationLocation = new Vector();
            Vector idDataDestinationPrice = new Vector();
            Vector idDataDestinationLocationCapital = new Vector();
            Vector idDataDestinationCountryCapital = new Vector();
            Vector idDataDestinationDestinationLong = new Vector();
            Vector idDataDestinationDestinationLat = new Vector();
            Vector idDataDestinationCountryCapitalLong = new Vector();
            Vector idDataDestinationCountryCapitalLat = new Vector();
            Vector idDataDestinationLocationCapitalLong = new Vector();
            Vector idDataDestinationLocationCapitalLat = new Vector();
            String idSelectQuery = String.format(""
                +"SELECT "
                    +"d.destinationId AS 'destinationId', "
                    +"d.destinationName AS 'destinationName', "
                    +"d.destinationType AS 'destinationType', "
                    +"ad.admName AS 'destinationLocation', "
                    +"d.destinationPrice AS 'destinationPrice', "
                    +"ad.admCapital AS 'destinationLocationCapital', "
                    +"ac.admCapital AS 'destinationCountryCapital', "
                    +"d.destinationLong AS 'destinationLong', "
                    +"d.destinationLat AS 'destinationLat', "
                    +"ac.admLong AS 'destinationCountryCapitalLong', "
                    +"ac.admLat AS 'destinationCountryCapitalLat', "
                    +"ad.admLong AS 'destinationLocationCapitalLong', "
                    +"ad.admLat AS 'destinationLocationCapitalLat' "
                +"FROM destination d "
                +"JOIN administrative ad "
                    +"ON d.destinationLocation = ad.admId "
                +"JOIN country c "
                	+"ON d.destinationCountry = c.countryId "
                +"JOIN administrative ac "
                    +"ON c.countryCapitalId = ac.admId "
                +"WHERE destinationCountry = 3 AND destinationHeritagePark = 1"
            +"");
            ResultSet idSelectRes = con.executeQuery(idSelectQuery);
            while(idSelectRes.next()){
                idDataDestinationId.add(idSelectRes.getInt("destinationId"));
                idDataDestinationName.add(idSelectRes.getString("destinationName"));
                idDataDestinationType.add(idSelectRes.getString("destinationType"));
                idDataDestinationLocation.add(idSelectRes.getString("destinationLocation"));
                idDataDestinationPrice.add(idSelectRes.getInt("destinationPrice"));
                idDataDestinationLocationCapital.add(idSelectRes.getString("destinationLocationCapital"));
                idDataDestinationCountryCapital.add(idSelectRes.getString("destinationCountryCapital"));
                idDataDestinationDestinationLong.add(idSelectRes.getDouble("destinationLong"));
                idDataDestinationDestinationLat.add(idSelectRes.getDouble("destinationLat"));
                idDataDestinationCountryCapitalLong.add(idSelectRes.getDouble("destinationCountryCapitalLong"));
                idDataDestinationCountryCapitalLat.add(idSelectRes.getDouble("destinationCountryCapitalLat"));
                idDataDestinationLocationCapitalLong.add(idSelectRes.getDouble("destinationLocationCapitalLong"));
                idDataDestinationLocationCapitalLat.add(idSelectRes.getDouble("destinationLocationCapitalLat"));
            }
            //out.println(idDataDestinationName);
            for(int i = 0; i < idRow; i++){
        %> 
        <table> 
            <tr>
            <%
                if(Math.floor((double)idDataTotal/4) > 0){
                    for(int j = 0; j < 4; j++){
                        //out.println(idDataDestinationId.get(i*4+j));
                    %>
                <td class="heritage_cell">
                    <div class="heritage_card">
                        <img src="photos/<%=idDataDestinationId.get(i*4+j)%>.jpg" alt="">
                        <div>
                            <h3><%=idDataDestinationType.get(i*4+j)%></h3>
                            <h2><%=idDataDestinationName.get(i*4+j)%></h2>
                            <div class="heritage_card_place_display">
                                <img src="assets/mappin@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=idDataDestinationLocation.get(i*4+j)%></h4>
                            </div>
                            <%
                                double idDestinationDistanceCountryCapital = 0;
                                idDestinationDistanceCountryCapital = Math.sqrt(Math.pow(((double)idDataDestinationDestinationLong.get(i*4+j)-(double)idDataDestinationCountryCapitalLong.get(i*4+j)), 2) + Math.pow(((double)idDataDestinationDestinationLat.get(i*4+j)-(double)idDataDestinationCountryCapitalLat.get(i*4+j)), 2)) * 111.322;
                                idDestinationDistanceCountryCapital = (double) Math.round(idDestinationDistanceCountryCapital * 10)/10;
                                double idDestinationDistanceLocationCapital = 0;
                                idDestinationDistanceLocationCapital = Math.sqrt(Math.pow(((double)idDataDestinationDestinationLong.get(i*4+j)-(double)idDataDestinationLocationCapitalLong.get(i*4+j)), 2) + Math.pow(((double)idDataDestinationDestinationLat.get(i*4+j)-(double)idDataDestinationLocationCapitalLat.get(i*4+j)), 2)) * 111.322;
                                idDestinationDistanceLocationCapital = (double) Math.round(idDestinationDistanceLocationCapital * 10)/10;
                            %>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/ruler.fill@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=idDestinationDistanceLocationCapital%>km dari <%=idDataDestinationLocationCapital.get(i*4+j)%></h4>
                            </div>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/airplane@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=idDestinationDistanceCountryCapital%>km dari <%=idDataDestinationCountryCapital.get(i*4+j)%></h4>
                            </div>
                            <h2 class="heritage_card_price_hover">Rp<%=idDataDestinationPrice.get(i*4+j)%>.00</h2>
                        </div>
                        <button type="submit" name="selected_destination" value="<%=idDataDestinationId.get(i*4+j)%>">Lebih detail</button>
                    </div>
                </td>
                    <%
                    }
                    idDataTotal = idDataTotal - 4;
                    //out.println(idDataTotal);
                }
                else{
                    for(int j = 0; j < idDataTotal; j++){
                        //out.println(idDataDestinationId.get(i*4+j));
                    %>
                <td class="heritage_cell">
                    <div class="heritage_card">
                        <img src="photos/<%=idDataDestinationId.get(i*4+j)%>.jpg" alt="">
                        <div>
                            <h3><%=idDataDestinationType.get(i*4+j)%></h3>
                            <h2><%=idDataDestinationName.get(i*4+j)%></h2>
                            <div class="heritage_card_place_display">
                                <img src="assets/mappin@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=idDataDestinationLocation.get(i*4+j)%></h4>
                            </div>
                            <%
                                double idDestinationDistanceCountryCapital = 0;
                                idDestinationDistanceCountryCapital = Math.sqrt(Math.pow(((double)idDataDestinationDestinationLong.get(i*4+j)-(double)idDataDestinationCountryCapitalLong.get(i*4+j)), 2) + Math.pow(((double)idDataDestinationDestinationLat.get(i*4+j)-(double)idDataDestinationCountryCapitalLat.get(i*4+j)), 2)) * 111.322;
                                idDestinationDistanceCountryCapital = (double) Math.round(idDestinationDistanceCountryCapital * 10)/10;
                                double idDestinationDistanceLocationCapital = 0;
                                idDestinationDistanceLocationCapital = Math.sqrt(Math.pow(((double)idDataDestinationDestinationLong.get(i*4+j)-(double)idDataDestinationLocationCapitalLong.get(i*4+j)), 2) + Math.pow(((double)idDataDestinationDestinationLat.get(i*4+j)-(double)idDataDestinationLocationCapitalLat.get(i*4+j)), 2)) * 111.322;
                                idDestinationDistanceLocationCapital = (double) Math.round(idDestinationDistanceLocationCapital * 10)/10;
                            %>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/ruler.fill@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=idDestinationDistanceLocationCapital%>km dari <%=idDataDestinationLocationCapital.get(i*4+j)%></h4>
                            </div>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/airplane@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=idDestinationDistanceCountryCapital%>km dari <%=idDataDestinationCountryCapital.get(i*4+j)%></h4>
                            </div>
                            <h2 class="heritage_card_price_hover">Rp<%=idDataDestinationPrice.get(i*4+j)%>.00</h2>
                        </div>
                        <button type="submit" name="selected_destination" value="<%=idDataDestinationId.get(i*4+j)%>">Lebih detail</button>
                    </div>
                </td>
                    <%
                    }
                    idDataTotal = idDataTotal - idDataTotal;
                }
            %> 
            </tr>
        </table>
        <%
            }
            //out.println(idRow);
        %>
    </form>
    <form id="heritage_kh" class="heritage_section" action="location.jsp">
        <div>
            <img src="assets/kh copy.png" alt="">
            <h1>Kamboja</h1>
        </div>
        <%
            int khRow = (int)Math.ceil((double)khDataTotal/4);
            Vector khDataDestinationId = new Vector();
            Vector khDataDestinationName = new Vector();
            Vector khDataDestinationType = new Vector();
            Vector khDataDestinationLocation = new Vector();
            Vector khDataDestinationPrice = new Vector();
            Vector khDataDestinationLocationCapital = new Vector();
            Vector khDataDestinationCountryCapital = new Vector();
            Vector khDataDestinationDestinationLong = new Vector();
            Vector khDataDestinationDestinationLat = new Vector();
            Vector khDataDestinationCountryCapitalLong = new Vector();
            Vector khDataDestinationCountryCapitalLat = new Vector();
            Vector khDataDestinationLocationCapitalLong = new Vector();
            Vector khDataDestinationLocationCapitalLat = new Vector();
            String khSelectQuery = String.format(""
                +"SELECT "
                    +"d.destinationId AS 'destinationId', "
                    +"d.destinationName AS 'destinationName', "
                    +"d.destinationType AS 'destinationType', "
                    +"ad.admName AS 'destinationLocation', "
                    +"d.destinationPrice AS 'destinationPrice', "
                    +"ad.admCapital AS 'destinationLocationCapital', "
                    +"ac.admCapital AS 'destinationCountryCapital', "
                    +"d.destinationLong AS 'destinationLong', "
                    +"d.destinationLat AS 'destinationLat', "
                    +"ac.admLong AS 'destinationCountryCapitalLong', "
                    +"ac.admLat AS 'destinationCountryCapitalLat', "
                    +"ad.admLong AS 'destinationLocationCapitalLong', "
                    +"ad.admLat AS 'destinationLocationCapitalLat' "
                +"FROM destination d "
                +"JOIN administrative ad "
                    +"ON d.destinationLocation = ad.admId "
                +"JOIN country c "
                	+"ON d.destinationCountry = c.countryId "
                +"JOIN administrative ac "
                    +"ON c.countryCapitalId = ac.admId "
                +"WHERE destinationCountry = 4 AND destinationHeritagePark = 1"
            +"");
            ResultSet khSelectRes = con.executeQuery(khSelectQuery);
            while(khSelectRes.next()){
                khDataDestinationId.add(khSelectRes.getInt("destinationId"));
                khDataDestinationName.add(khSelectRes.getString("destinationName"));
                khDataDestinationType.add(khSelectRes.getString("destinationType"));
                khDataDestinationLocation.add(khSelectRes.getString("destinationLocation"));
                khDataDestinationPrice.add(khSelectRes.getInt("destinationPrice"));
                khDataDestinationLocationCapital.add(khSelectRes.getString("destinationLocationCapital"));
                khDataDestinationCountryCapital.add(khSelectRes.getString("destinationCountryCapital"));
                khDataDestinationDestinationLong.add(khSelectRes.getDouble("destinationLong"));
                khDataDestinationDestinationLat.add(khSelectRes.getDouble("destinationLat"));
                khDataDestinationCountryCapitalLong.add(khSelectRes.getDouble("destinationCountryCapitalLong"));
                khDataDestinationCountryCapitalLat.add(khSelectRes.getDouble("destinationCountryCapitalLat"));
                khDataDestinationLocationCapitalLong.add(khSelectRes.getDouble("destinationLocationCapitalLong"));
                khDataDestinationLocationCapitalLat.add(khSelectRes.getDouble("destinationLocationCapitalLat"));
            }
            //out.println(idDataDestinationName);
            for(int i = 0; i < khRow; i++){
        %> 
        <table> 
            <tr>
            <%
                if(Math.floor((double)khDataTotal/4) > 0){
                    for(int j = 0; j < 4; j++){
                        //out.println(idDataDestinationId.get(i*4+j));
                    %>
                <td class="heritage_cell">
                    <div class="heritage_card">
                        <img src="photos/<%=khDataDestinationId.get(i*4+j)%>.jpg" alt="">
                        <div>
                            <h3><%=khDataDestinationType.get(i*4+j)%></h3>
                            <h2><%=khDataDestinationName.get(i*4+j)%></h2>
                            <div class="heritage_card_place_display">
                                <img src="assets/mappin@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=khDataDestinationLocation.get(i*4+j)%></h4>
                            </div>
                            <%
                                double khDestinationDistanceCountryCapital = 0;
                                khDestinationDistanceCountryCapital = Math.sqrt(Math.pow(((double)khDataDestinationDestinationLong.get(i*4+j)-(double)khDataDestinationCountryCapitalLong.get(i*4+j)), 2) + Math.pow(((double)khDataDestinationDestinationLat.get(i*4+j)-(double)khDataDestinationCountryCapitalLat.get(i*4+j)), 2)) * 111.322;
                                khDestinationDistanceCountryCapital = (double) Math.round(khDestinationDistanceCountryCapital * 10)/10;
                                double khDestinationDistanceLocationCapital = 0;
                                khDestinationDistanceLocationCapital = Math.sqrt(Math.pow(((double)khDataDestinationDestinationLong.get(i*4+j)-(double)khDataDestinationLocationCapitalLong.get(i*4+j)), 2) + Math.pow(((double)khDataDestinationDestinationLat.get(i*4+j)-(double)khDataDestinationLocationCapitalLat.get(i*4+j)), 2)) * 111.322;
                                khDestinationDistanceLocationCapital = (double) Math.round(khDestinationDistanceLocationCapital * 10)/10;
                            %>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/ruler.fill@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=khDestinationDistanceLocationCapital%>km dari <%=khDataDestinationLocationCapital.get(i*4+j)%></h4>
                            </div>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/airplane@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=khDestinationDistanceCountryCapital%>km dari <%=khDataDestinationCountryCapital.get(i*4+j)%></h4>
                            </div>
                            <h2 class="heritage_card_price_hover">Rp<%=khDataDestinationPrice.get(i*4+j)%>.00</h2>
                        </div>
                        <button type="submit" name="selected_destination" value="<%=khDataDestinationId.get(i*4+j)%>">Lebih detail</button>
                    </div>
                </td>
                    <%
                    }
                    khDataTotal = khDataTotal - 4;
                    //out.println(khDataTotal);
                }
                else{
                    for(int j = 0; j < khDataTotal; j++){
                        //out.println(khDataDestinationId.get(i*4+j));
                    %>
                <td class="heritage_cell">
                    <div class="heritage_card">
                        <img src="photos/<%=khDataDestinationId.get(i*4+j)%>.jpg" alt="">
                        <div>
                            <h3><%=khDataDestinationType.get(i*4+j)%></h3>
                            <h2><%=khDataDestinationName.get(i*4+j)%></h2>
                            <div class="heritage_card_place_display">
                                <img src="assets/mappin@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=khDataDestinationLocation.get(i*4+j)%></h4>
                            </div>
                            <%
                                double khDestinationDistanceCountryCapital = 0;
                                khDestinationDistanceCountryCapital = Math.sqrt(Math.pow(((double)khDataDestinationDestinationLong.get(i*4+j)-(double)khDataDestinationCountryCapitalLong.get(i*4+j)), 2) + Math.pow(((double)khDataDestinationDestinationLat.get(i*4+j)-(double)khDataDestinationCountryCapitalLat.get(i*4+j)), 2)) * 111.322;
                                khDestinationDistanceCountryCapital = (double) Math.round(khDestinationDistanceCountryCapital * 10)/10;
                                double khDestinationDistanceLocationCapital = 0;
                                khDestinationDistanceLocationCapital = Math.sqrt(Math.pow(((double)khDataDestinationDestinationLong.get(i*4+j)-(double)khDataDestinationLocationCapitalLong.get(i*4+j)), 2) + Math.pow(((double)khDataDestinationDestinationLat.get(i*4+j)-(double)khDataDestinationLocationCapitalLat.get(i*4+j)), 2)) * 111.322;
                                khDestinationDistanceLocationCapital = (double) Math.round(khDestinationDistanceLocationCapital * 10)/10;
                            %>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/ruler.fill@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=khDestinationDistanceLocationCapital%>km dari <%=khDataDestinationLocationCapital.get(i*4+j)%></h4>
                            </div>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/airplane@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=khDestinationDistanceCountryCapital%>km dari <%=khDataDestinationCountryCapital.get(i*4+j)%></h4>
                            </div>
                            <h2 class="heritage_card_price_hover">Rp<%=khDataDestinationPrice.get(i*4+j)%>.00</h2>
                        </div>
                        <button type="submit" name="selected_destination" value="<%=khDataDestinationId.get(i*4+j)%>">Lebih detail</button>
                    </div>
                </td>
                    <%
                    }
                    khDataTotal = khDataTotal - khDataTotal;
                }
            %> 
            </tr>
        </table>
        <%
            }
            //out.println(khRow);
        %>
    </form>
    <form id="heritage_la" class="heritage_section" action="location.jsp">
        <div>
            <img src="assets/la copy.png" alt="">
            <h1>Laos</h1>
        </div>
        <%
            int laRow = (int)Math.ceil((double)laDataTotal/4);
            Vector laDataDestinationId = new Vector();
            Vector laDataDestinationName = new Vector();
            Vector laDataDestinationType = new Vector();
            Vector laDataDestinationLocation = new Vector();
            Vector laDataDestinationPrice = new Vector();
            Vector laDataDestinationLocationCapital = new Vector();
            Vector laDataDestinationCountryCapital = new Vector();
            Vector laDataDestinationDestinationLong = new Vector();
            Vector laDataDestinationDestinationLat = new Vector();
            Vector laDataDestinationCountryCapitalLong = new Vector();
            Vector laDataDestinationCountryCapitalLat = new Vector();
            Vector laDataDestinationLocationCapitalLong = new Vector();
            Vector laDataDestinationLocationCapitalLat = new Vector();
            String laSelectQuery = String.format(""
                +"SELECT "
                    +"d.destinationId AS 'destinationId', "
                    +"d.destinationName AS 'destinationName', "
                    +"d.destinationType AS 'destinationType', "
                    +"ad.admName AS 'destinationLocation', "
                    +"d.destinationPrice AS 'destinationPrice', "
                    +"ad.admCapital AS 'destinationLocationCapital', "
                    +"ac.admCapital AS 'destinationCountryCapital', "
                    +"d.destinationLong AS 'destinationLong', "
                    +"d.destinationLat AS 'destinationLat', "
                    +"ac.admLong AS 'destinationCountryCapitalLong', "
                    +"ac.admLat AS 'destinationCountryCapitalLat', "
                    +"ad.admLong AS 'destinationLocationCapitalLong', "
                    +"ad.admLat AS 'destinationLocationCapitalLat' "
                +"FROM destination d "
                +"JOIN administrative ad "
                    +"ON d.destinationLocation = ad.admId "
                +"JOIN country c "
                	+"ON d.destinationCountry = c.countryId "
                +"JOIN administrative ac "
                    +"ON c.countryCapitalId = ac.admId "
                +"WHERE destinationCountry = 5 AND destinationHeritagePark = 1"
            +"");
            ResultSet laSelectRes = con.executeQuery(laSelectQuery);
            while(laSelectRes.next()){
                laDataDestinationId.add(laSelectRes.getInt("destinationId"));
                laDataDestinationName.add(laSelectRes.getString("destinationName"));
                laDataDestinationType.add(laSelectRes.getString("destinationType"));
                laDataDestinationLocation.add(laSelectRes.getString("destinationLocation"));
                laDataDestinationPrice.add(laSelectRes.getInt("destinationPrice"));
                laDataDestinationLocationCapital.add(laSelectRes.getString("destinationLocationCapital"));
                laDataDestinationCountryCapital.add(laSelectRes.getString("destinationCountryCapital"));
                laDataDestinationDestinationLong.add(laSelectRes.getDouble("destinationLong"));
                laDataDestinationDestinationLat.add(laSelectRes.getDouble("destinationLat"));
                laDataDestinationCountryCapitalLong.add(laSelectRes.getDouble("destinationCountryCapitalLong"));
                laDataDestinationCountryCapitalLat.add(laSelectRes.getDouble("destinationCountryCapitalLat"));
                laDataDestinationLocationCapitalLong.add(laSelectRes.getDouble("destinationLocationCapitalLong"));
                laDataDestinationLocationCapitalLat.add(laSelectRes.getDouble("destinationLocationCapitalLat"));
            }
            //out.println(idDataDestinationName);
            for(int i = 0; i < laRow; i++){
        %> 
        <table> 
            <tr>
            <%
                if(Math.floor((double)laDataTotal/4) > 0){
                    for(int j = 0; j < 4; j++){
                        //out.println(idDataDestinationId.get(i*4+j));
                    %>
                <td class="heritage_cell">
                    <div class="heritage_card">
                        <img src="photos/<%=laDataDestinationId.get(i*4+j)%>.jpg" alt="">
                        <div>
                            <h3><%=laDataDestinationType.get(i*4+j)%></h3>
                            <h2><%=laDataDestinationName.get(i*4+j)%></h2>
                            <div class="heritage_card_place_display">
                                <img src="assets/mappin@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=laDataDestinationLocation.get(i*4+j)%></h4>
                            </div>
                            <%
                                double laDestinationDistanceCountryCapital = 0;
                                laDestinationDistanceCountryCapital = Math.sqrt(Math.pow(((double)laDataDestinationDestinationLong.get(i*4+j)-(double)laDataDestinationCountryCapitalLong.get(i*4+j)), 2) + Math.pow(((double)laDataDestinationDestinationLat.get(i*4+j)-(double)laDataDestinationCountryCapitalLat.get(i*4+j)), 2)) * 111.322;
                                laDestinationDistanceCountryCapital = (double) Math.round(laDestinationDistanceCountryCapital * 10)/10;
                                double laDestinationDistanceLocationCapital = 0;
                                laDestinationDistanceLocationCapital = Math.sqrt(Math.pow(((double)laDataDestinationDestinationLong.get(i*4+j)-(double)laDataDestinationLocationCapitalLong.get(i*4+j)), 2) + Math.pow(((double)laDataDestinationDestinationLat.get(i*4+j)-(double)laDataDestinationLocationCapitalLat.get(i*4+j)), 2)) * 111.322;
                                laDestinationDistanceLocationCapital = (double) Math.round(laDestinationDistanceLocationCapital * 10)/10;
                            %>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/ruler.fill@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=laDestinationDistanceLocationCapital%>km dari <%=laDataDestinationLocationCapital.get(i*4+j)%></h4>
                            </div>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/airplane@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=laDestinationDistanceCountryCapital%>km dari <%=laDataDestinationCountryCapital.get(i*4+j)%></h4>
                            </div>
                            <h2 class="heritage_card_price_hover">Rp<%=laDataDestinationPrice.get(i*4+j)%>.00</h2>
                        </div>
                        <button type="submit" name="selected_destination" value="<%=laDataDestinationId.get(i*4+j)%>">Lebih detail</button>
                    </div>
                </td>
                    <%
                    }
                    laDataTotal = laDataTotal - 4;
                    //out.println(laDataTotal);
                }
                else{
                    for(int j = 0; j < laDataTotal; j++){
                        //out.println(laDataDestinationId.get(i*4+j));
                    %>
                <td class="heritage_cell">
                    <div class="heritage_card">
                        <img src="photos/<%=laDataDestinationId.get(i*4+j)%>.jpg" alt="">
                        <div>
                            <h3><%=laDataDestinationType.get(i*4+j)%></h3>
                            <h2><%=laDataDestinationName.get(i*4+j)%></h2>
                            <div class="heritage_card_place_display">
                                <img src="assets/mappin@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=laDataDestinationLocation.get(i*4+j)%></h4>
                            </div>
                            <%
                                double laDestinationDistanceCountryCapital = 0;
                                laDestinationDistanceCountryCapital = Math.sqrt(Math.pow(((double)laDataDestinationDestinationLong.get(i*4+j)-(double)laDataDestinationCountryCapitalLong.get(i*4+j)), 2) + Math.pow(((double)laDataDestinationDestinationLat.get(i*4+j)-(double)laDataDestinationCountryCapitalLat.get(i*4+j)), 2)) * 111.322;
                                laDestinationDistanceCountryCapital = (double) Math.round(laDestinationDistanceCountryCapital * 10)/10;
                                double laDestinationDistanceLocationCapital = 0;
                                laDestinationDistanceLocationCapital = Math.sqrt(Math.pow(((double)laDataDestinationDestinationLong.get(i*4+j)-(double)laDataDestinationLocationCapitalLong.get(i*4+j)), 2) + Math.pow(((double)laDataDestinationDestinationLat.get(i*4+j)-(double)laDataDestinationLocationCapitalLat.get(i*4+j)), 2)) * 111.322;
                                laDestinationDistanceLocationCapital = (double) Math.round(laDestinationDistanceLocationCapital * 10)/10;
                            %>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/ruler.fill@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=laDestinationDistanceLocationCapital%>km dari <%=laDataDestinationLocationCapital.get(i*4+j)%></h4>
                            </div>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/airplane@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=laDestinationDistanceCountryCapital%>km dari <%=laDataDestinationCountryCapital.get(i*4+j)%></h4>
                            </div>
                            <h2 class="heritage_card_price_hover">Rp<%=laDataDestinationPrice.get(i*4+j)%>.00</h2>
                        </div>
                        <button type="submit" name="selected_destination" value="<%=laDataDestinationId.get(i*4+j)%>">Lebih detail</button>
                    </div>
                </td>
                    <%
                    }
                    laDataTotal = laDataTotal - laDataTotal;
                }
            %> 
            </tr>
        </table>
        <%
            }
            //out.println(laRow);
        %>
    </form>
    <form id="heritage_my" class="heritage_section" action="location.jsp">
        <div>
            <img src="assets/my copy.png" alt="">
            <h1>Malaysia</h1>
        </div>
        <%
            int myRow = (int)Math.ceil((double)myDataTotal/4);
            Vector myDataDestinationId = new Vector();
            Vector myDataDestinationName = new Vector();
            Vector myDataDestinationType = new Vector();
            Vector myDataDestinationLocation = new Vector();
            Vector myDataDestinationPrice = new Vector();
            Vector myDataDestinationLocationCapital = new Vector();
            Vector myDataDestinationCountryCapital = new Vector();
            Vector myDataDestinationDestinationLong = new Vector();
            Vector myDataDestinationDestinationLat = new Vector();
            Vector myDataDestinationCountryCapitalLong = new Vector();
            Vector myDataDestinationCountryCapitalLat = new Vector();
            Vector myDataDestinationLocationCapitalLong = new Vector();
            Vector myDataDestinationLocationCapitalLat = new Vector();
            String mySelectQuery = String.format(""
                +"SELECT "
                    +"d.destinationId AS 'destinationId', "
                    +"d.destinationName AS 'destinationName', "
                    +"d.destinationType AS 'destinationType', "
                    +"ad.admName AS 'destinationLocation', "
                    +"d.destinationPrice AS 'destinationPrice', "
                    +"ad.admCapital AS 'destinationLocationCapital', "
                    +"ac.admCapital AS 'destinationCountryCapital', "
                    +"d.destinationLat AS 'destinationLat', "
                    +"d.destinationLong AS 'destinationLong', "
                    +"ac.admLong AS 'destinationCountryCapitalLong', "
                    +"ac.admLat AS 'destinationCountryCapitalLat', "
                    +"ad.admLong AS 'destinationLocationCapitalLong', "
                    +"ad.admLat AS 'destinationLocationCapitalLat' "
                +"FROM destination d "
                +"JOIN administrative ad "
                    +"ON d.destinationLocation = ad.admId "
                +"JOIN country c "
                	+"ON d.destinationCountry = c.countryId "
                +"JOIN administrative ac "
                    +"ON c.countryCapitalId = ac.admId "
                +"WHERE destinationCountry = 6 AND destinationHeritagePark = 1"
            +"");
            ResultSet mySelectRes = con.executeQuery(mySelectQuery);
            while(mySelectRes.next()){
                myDataDestinationId.add(mySelectRes.getInt("destinationId"));
                myDataDestinationName.add(mySelectRes.getString("destinationName"));
                myDataDestinationType.add(mySelectRes.getString("destinationType"));
                myDataDestinationLocation.add(mySelectRes.getString("destinationLocation"));
                myDataDestinationPrice.add(mySelectRes.getInt("destinationPrice"));
                myDataDestinationLocationCapital.add(mySelectRes.getString("destinationLocationCapital"));
                myDataDestinationCountryCapital.add(mySelectRes.getString("destinationCountryCapital"));
                myDataDestinationDestinationLong.add(mySelectRes.getDouble("destinationLong"));
                myDataDestinationDestinationLat.add(mySelectRes.getDouble("destinationLat"));
                myDataDestinationCountryCapitalLong.add(mySelectRes.getDouble("destinationCountryCapitalLong"));
                myDataDestinationCountryCapitalLat.add(mySelectRes.getDouble("destinationCountryCapitalLat"));
                myDataDestinationLocationCapitalLong.add(mySelectRes.getDouble("destinationLocationCapitalLong"));
                myDataDestinationLocationCapitalLat.add(mySelectRes.getDouble("destinationLocationCapitalLat"));
            }
            //out.println(myDataDestinationName);
            for(int i = 0; i < myRow; i++){
        %> 
        <table> 
            <tr>
            <%
                if(Math.floor((double)myDataTotal/4) > 0){
                    for(int j = 0; j < 4; j++){
                        //out.println(myDataDestinationId.get(i*4+j));
                    %>
                <td class="heritage_cell">
                    <div class="heritage_card">
                        <img src="photos/<%=myDataDestinationId.get(i*4+j)%>.jpg" alt="">
                        <div>
                            <h3><%=myDataDestinationType.get(i*4+j)%></h3>
                            <h2><%=myDataDestinationName.get(i*4+j)%></h2>
                            <div class="heritage_card_place_display">
                                <img src="assets/mappin@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=myDataDestinationLocation.get(i*4+j)%></h4>
                            </div>
                            <%
                                double myDestinationDistanceCountryCapital = 0;
                                myDestinationDistanceCountryCapital = Math.sqrt(Math.pow(((double)myDataDestinationDestinationLong.get(i*4+j)-(double)myDataDestinationCountryCapitalLong.get(i*4+j)), 2) + Math.pow(((double)myDataDestinationDestinationLat.get(i*4+j)-(double)myDataDestinationCountryCapitalLat.get(i*4+j)), 2)) * 111.322;
                                myDestinationDistanceCountryCapital = (double) Math.round(myDestinationDistanceCountryCapital * 10)/10;
                                double myDestinationDistanceLocationCapital = 0;
                                myDestinationDistanceLocationCapital = Math.sqrt(Math.pow(((double)myDataDestinationDestinationLong.get(i*4+j)-(double)myDataDestinationLocationCapitalLong.get(i*4+j)), 2) + Math.pow(((double)myDataDestinationDestinationLat.get(i*4+j)-(double)myDataDestinationLocationCapitalLat.get(i*4+j)), 2)) * 111.322;
                                myDestinationDistanceLocationCapital = (double) Math.round(myDestinationDistanceLocationCapital * 10)/10;
                            %>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/ruler.fill@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=myDestinationDistanceLocationCapital%>km dari <%=myDataDestinationLocationCapital.get(i*4+j)%></h4>
                            </div>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/airplane@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=myDestinationDistanceCountryCapital%>km dari <%=myDataDestinationCountryCapital.get(i*4+j)%></h4>
                            </div>
                            <h2 class="heritage_card_price_hover">Rp<%=myDataDestinationPrice.get(i*4+j)%>.00</h2>
                        </div>
                        <button type="submit" name="selected_destination" value="<%=myDataDestinationId.get(i*4+j)%>">Lebih detail</button>
                    </div>
                </td>
                    <%
                    }
                    myDataTotal = myDataTotal - 4;
                    //out.println(myDataTotal);
                }
                else{
                    for(int j = 0; j < myDataTotal; j++){
                        //out.println(myDataDestinationId.get(i*4+j));
                    %>
                <td class="heritage_cell">
                    <div class="heritage_card">
                        <img src="photos/<%=myDataDestinationId.get(i*4+j)%>.jpg" alt="">
                        <div>
                            <h3><%=myDataDestinationType.get(i*4+j)%></h3>
                            <h2><%=myDataDestinationName.get(i*4+j)%></h2>
                            <div class="heritage_card_place_display">
                                <img src="assets/mappin@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=myDataDestinationLocation.get(i*4+j)%></h4>
                            </div>
                            <%
                                double myDestinationDistanceCountryCapital = 0;
                                myDestinationDistanceCountryCapital = Math.sqrt(Math.pow(((double)myDataDestinationDestinationLong.get(i*4+j)-(double)myDataDestinationCountryCapitalLong.get(i*4+j)), 2) + Math.pow(((double)myDataDestinationDestinationLat.get(i*4+j)-(double)myDataDestinationCountryCapitalLat.get(i*4+j)), 2)) * 111.322;
                                myDestinationDistanceCountryCapital = (double) Math.round(myDestinationDistanceCountryCapital * 10)/10;
                                double myDestinationDistanceLocationCapital = 0;
                                myDestinationDistanceLocationCapital = Math.sqrt(Math.pow(((double)myDataDestinationDestinationLong.get(i*4+j)-(double)myDataDestinationLocationCapitalLong.get(i*4+j)), 2) + Math.pow(((double)myDataDestinationDestinationLat.get(i*4+j)-(double)myDataDestinationLocationCapitalLat.get(i*4+j)), 2)) * 111.322;
                                myDestinationDistanceLocationCapital = (double) Math.round(myDestinationDistanceLocationCapital * 10)/10;
                            %>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/ruler.fill@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=myDestinationDistanceLocationCapital%>km dari <%=myDataDestinationLocationCapital.get(i*4+j)%></h4>
                            </div>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/airplane@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=myDestinationDistanceCountryCapital%>km dari <%=myDataDestinationCountryCapital.get(i*4+j)%></h4>
                            </div>
                            <h2 class="heritage_card_price_hover">Rp<%=myDataDestinationPrice.get(i*4+j)%>.00</h2>
                        </div>
                        <button type="submit" name="selected_destination" value="<%=myDataDestinationId.get(i*4+j)%>">Lebih detail</button>
                    </div>
                </td>
                    <%
                    }
                    myDataTotal = myDataTotal - myDataTotal;
                }
            %> 
            </tr>
        </table>
        <%
            }
            //out.println(myRow);
        %>
    </form>
    <form id="heritage_mm" class="heritage_section" action="location.jsp">
        <div>
            <img src="assets/mm copy.png" alt="">
            <h1>Myanmar</h1>
        </div>
        <%
            int mmRow = (int)Math.ceil((double)mmDataTotal/4);
            Vector mmDataDestinationId = new Vector();
            Vector mmDataDestinationName = new Vector();
            Vector mmDataDestinationType = new Vector();
            Vector mmDataDestinationLocation = new Vector();
            Vector mmDataDestinationPrice = new Vector();
            Vector mmDataDestinationLocationCapital = new Vector();
            Vector mmDataDestinationCountryCapital = new Vector();
            Vector mmDataDestinationDestinationLong = new Vector();
            Vector mmDataDestinationDestinationLat = new Vector();
            Vector mmDataDestinationCountryCapitalLong = new Vector();
            Vector mmDataDestinationCountryCapitalLat = new Vector();
            Vector mmDataDestinationLocationCapitalLong = new Vector();
            Vector mmDataDestinationLocationCapitalLat = new Vector();
            String mmSelectQuery = String.format(""
                +"SELECT "
                    +"d.destinationId AS 'destinationId', "
                    +"d.destinationName AS 'destinationName', "
                    +"d.destinationType AS 'destinationType', "
                    +"ad.admName AS 'destinationLocation', "
                    +"d.destinationPrice AS 'destinationPrice', "
                    +"ad.admCapital AS 'destinationLocationCapital', "
                    +"ac.admCapital AS 'destinationCountryCapital', "
                    +"d.destinationLong AS 'destinationLong', "
                    +"d.destinationLat AS 'destinationLat', "
                    +"ac.admLong AS 'destinationCountryCapitalLong', "
                    +"ac.admLat AS 'destinationCountryCapitalLat', "
                    +"ad.admLong AS 'destinationLocationCapitalLong', "
                    +"ad.admLat AS 'destinationLocationCapitalLat' "
                +"FROM destination d "
                +"JOIN administrative ad "
                    +"ON d.destinationLocation = ad.admId "
                +"JOIN country c "
                	+"ON d.destinationCountry = c.countryId "
                +"JOIN administrative ac "
                    +"ON c.countryCapitalId = ac.admId "
                +"WHERE destinationCountry = 7 AND destinationHeritagePark = 1"
            +"");
            ResultSet mmSelectRes = con.executeQuery(mmSelectQuery);
            while(mmSelectRes.next()){
                mmDataDestinationId.add(mmSelectRes.getInt("destinationId"));
                mmDataDestinationName.add(mmSelectRes.getString("destinationName"));
                mmDataDestinationType.add(mmSelectRes.getString("destinationType"));
                mmDataDestinationLocation.add(mmSelectRes.getString("destinationLocation"));
                mmDataDestinationPrice.add(mmSelectRes.getInt("destinationPrice"));
                mmDataDestinationLocationCapital.add(mmSelectRes.getString("destinationLocationCapital"));
                mmDataDestinationCountryCapital.add(mmSelectRes.getString("destinationCountryCapital"));
                mmDataDestinationDestinationLong.add(mmSelectRes.getDouble("destinationLong"));
                mmDataDestinationDestinationLat.add(mmSelectRes.getDouble("destinationLat"));
                mmDataDestinationCountryCapitalLong.add(mmSelectRes.getDouble("destinationCountryCapitalLong"));
                mmDataDestinationCountryCapitalLat.add(mmSelectRes.getDouble("destinationCountryCapitalLat"));
                mmDataDestinationLocationCapitalLong.add(mmSelectRes.getDouble("destinationLocationCapitalLong"));
                mmDataDestinationLocationCapitalLat.add(mmSelectRes.getDouble("destinationLocationCapitalLat"));
            }
            //out.println(idDataDestinationName);
            for(int i = 0; i < mmRow; i++){
        %> 
        <table> 
            <tr>
            <%
                if(Math.floor((double)mmDataTotal/4) > 0){
                    for(int j = 0; j < 4; j++){
                        //out.println(idDataDestinationId.get(i*4+j));
                    %>
                <td class="heritage_cell">
                    <div class="heritage_card">
                        <img src="photos/<%=mmDataDestinationId.get(i*4+j)%>.jpg" alt="">
                        <div>
                            <h3><%=mmDataDestinationType.get(i*4+j)%></h3>
                            <h2><%=mmDataDestinationName.get(i*4+j)%></h2>
                            <div class="heritage_card_place_display">
                                <img src="assets/mappin@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=mmDataDestinationLocation.get(i*4+j)%></h4>
                            </div>
                            <%
                                double mmDestinationDistanceCountryCapital = 0;
                                mmDestinationDistanceCountryCapital = Math.sqrt(Math.pow(((double)mmDataDestinationDestinationLong.get(i*4+j)-(double)mmDataDestinationCountryCapitalLong.get(i*4+j)), 2) + Math.pow(((double)mmDataDestinationDestinationLat.get(i*4+j)-(double)mmDataDestinationCountryCapitalLat.get(i*4+j)), 2)) * 111.322;
                                mmDestinationDistanceCountryCapital = (double) Math.round(mmDestinationDistanceCountryCapital * 10)/10;
                                double mmDestinationDistanceLocationCapital = 0;
                                mmDestinationDistanceLocationCapital = Math.sqrt(Math.pow(((double)mmDataDestinationDestinationLong.get(i*4+j)-(double)mmDataDestinationLocationCapitalLong.get(i*4+j)), 2) + Math.pow(((double)mmDataDestinationDestinationLat.get(i*4+j)-(double)mmDataDestinationLocationCapitalLat.get(i*4+j)), 2)) * 111.322;
                                mmDestinationDistanceLocationCapital = (double) Math.round(mmDestinationDistanceLocationCapital * 10)/10;
                            %>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/ruler.fill@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=mmDestinationDistanceLocationCapital%>km dari <%=mmDataDestinationLocationCapital.get(i*4+j)%></h4>
                            </div>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/airplane@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=mmDestinationDistanceCountryCapital%>km dari <%=mmDataDestinationCountryCapital.get(i*4+j)%></h4>
                            </div>
                            <h2 class="heritage_card_price_hover">Rp<%=mmDataDestinationPrice.get(i*4+j)%>.00</h2>
                        </div>
                        <button type="submit" name="selected_destination" value="<%=mmDataDestinationId.get(i*4+j)%>">Lebih detail</button>
                    </div>
                </td>
                    <%
                    }
                    mmDataTotal = mmDataTotal - 4;
                    //out.println(mmDataTotal);
                }
                else{
                    for(int j = 0; j < mmDataTotal; j++){
                        //out.println(mmDataDestinationId.get(i*4+j));
                    %>
                <td class="heritage_cell">
                    <div class="heritage_card">
                        <img src="photos/<%=mmDataDestinationId.get(i*4+j)%>.jpg" alt="">
                        <div>
                            <h3><%=mmDataDestinationType.get(i*4+j)%></h3>
                            <h2><%=mmDataDestinationName.get(i*4+j)%></h2>
                            <div class="heritage_card_place_display">
                                <img src="assets/mappin@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=mmDataDestinationLocation.get(i*4+j)%></h4>
                            </div>
                            <%
                                double mmDestinationDistanceCountryCapital = 0;
                                mmDestinationDistanceCountryCapital = Math.sqrt(Math.pow(((double)mmDataDestinationDestinationLong.get(i*4+j)-(double)mmDataDestinationCountryCapitalLong.get(i*4+j)), 2) + Math.pow(((double)mmDataDestinationDestinationLat.get(i*4+j)-(double)mmDataDestinationCountryCapitalLat.get(i*4+j)), 2)) * 111.322;
                                mmDestinationDistanceCountryCapital = (double) Math.round(mmDestinationDistanceCountryCapital * 10)/10;
                                double mmDestinationDistanceLocationCapital = 0;
                                mmDestinationDistanceLocationCapital = Math.sqrt(Math.pow(((double)mmDataDestinationDestinationLong.get(i*4+j)-(double)mmDataDestinationLocationCapitalLong.get(i*4+j)), 2) + Math.pow(((double)mmDataDestinationDestinationLat.get(i*4+j)-(double)mmDataDestinationLocationCapitalLat.get(i*4+j)), 2)) * 111.322;
                                mmDestinationDistanceLocationCapital = (double) Math.round(mmDestinationDistanceLocationCapital * 10)/10;
                            %>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/ruler.fill@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=mmDestinationDistanceLocationCapital%>km dari <%=mmDataDestinationLocationCapital.get(i*4+j)%></h4>
                            </div>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/airplane@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=mmDestinationDistanceCountryCapital%>km dari <%=mmDataDestinationCountryCapital.get(i*4+j)%></h4>
                            </div>
                            <h2 class="heritage_card_price_hover">Rp<%=mmDataDestinationPrice.get(i*4+j)%>.00</h2>
                        </div>
                        <button type="submit" name="selected_destination" value="<%=mmDataDestinationId.get(i*4+j)%>">Lebih detail</button>
                    </div>
                </td>
                    <%
                    }
                    mmDataTotal = mmDataTotal - mmDataTotal;
                }
            %> 
            </tr>
        </table>
        <%
            }
            //out.println(mmRow);
        %>
    </form>
    <form id="heritage_sg" class="heritage_section" action="location.jsp">
        <div>
            <img src="assets/sg copy.png" alt="">
            <h1>Singapura</h1>
        </div>
        <%
            int sgRow = (int)Math.ceil((double)sgDataTotal/4);
            Vector sgDataDestinationId = new Vector();
            Vector sgDataDestinationName = new Vector();
            Vector sgDataDestinationType = new Vector();
            Vector sgDataDestinationLocation = new Vector();
            Vector sgDataDestinationPrice = new Vector();
            Vector sgDataDestinationLocationCapital = new Vector();
            Vector sgDataDestinationCountryCapital = new Vector();
            Vector sgDataDestinationDestinationLong = new Vector();
            Vector sgDataDestinationDestinationLat = new Vector();
            Vector sgDataDestinationCountryCapitalLong = new Vector();
            Vector sgDataDestinationCountryCapitalLat = new Vector();
            Vector sgDataDestinationLocationCapitalLong = new Vector();
            Vector sgDataDestinationLocationCapitalLat = new Vector();
            String sgSelectQuery = String.format(""
                +"SELECT "
                    +"d.destinationId AS 'destinationId', "
                    +"d.destinationName AS 'destinationName', "
                    +"d.destinationType AS 'destinationType', "
                    +"ad.admName AS 'destinationLocation', "
                    +"d.destinationPrice AS 'destinationPrice', "
                    +"ad.admCapital AS 'destinationLocationCapital', "
                    +"ac.admCapital AS 'destinationCountryCapital', "
                    +"d.destinationLong AS 'destinationLong', "
                    +"d.destinationLat AS 'destinationLat', "
                    +"ac.admLong AS 'destinationCountryCapitalLong', "
                    +"ac.admLat AS 'destinationCountryCapitalLat', "
                    +"ad.admLong AS 'destinationLocationCapitalLong', "
                    +"ad.admLat AS 'destinationLocationCapitalLat' "
                +"FROM destination d "
                +"JOIN administrative ad "
                    +"ON d.destinationLocation = ad.admId "
                +"JOIN country c "
                	+"ON d.destinationCountry = c.countryId "
                +"JOIN administrative ac "
                    +"ON c.countryCapitalId = ac.admId "
                +"WHERE destinationCountry = 8 AND destinationHeritagePark = 1"
            +"");
            ResultSet sgSelectRes = con.executeQuery(sgSelectQuery);
            while(sgSelectRes.next()){
                sgDataDestinationId.add(sgSelectRes.getInt("destinationId"));
                sgDataDestinationName.add(sgSelectRes.getString("destinationName"));
                sgDataDestinationType.add(sgSelectRes.getString("destinationType"));
                sgDataDestinationLocation.add(sgSelectRes.getString("destinationLocation"));
                sgDataDestinationPrice.add(sgSelectRes.getInt("destinationPrice"));
                sgDataDestinationLocationCapital.add(sgSelectRes.getString("destinationLocationCapital"));
                sgDataDestinationCountryCapital.add(sgSelectRes.getString("destinationCountryCapital"));
                sgDataDestinationDestinationLong.add(sgSelectRes.getDouble("destinationLong"));
                sgDataDestinationDestinationLat.add(sgSelectRes.getDouble("destinationLat"));
                sgDataDestinationCountryCapitalLong.add(sgSelectRes.getDouble("destinationCountryCapitalLong"));
                sgDataDestinationCountryCapitalLat.add(sgSelectRes.getDouble("destinationCountryCapitalLat"));
                sgDataDestinationLocationCapitalLong.add(sgSelectRes.getDouble("destinationLocationCapitalLong"));
                sgDataDestinationLocationCapitalLat.add(sgSelectRes.getDouble("destinationLocationCapitalLat"));
            }
            //out.println(idDataDestinationName);
            for(int i = 0; i < sgRow; i++){
        %> 
        <table> 
            <tr>
            <%
                if(Math.floor((double)sgDataTotal/4) > 0){
                    for(int j = 0; j < 4; j++){
                        //out.println(idDataDestinationId.get(i*4+j));
                    %>
                <td class="heritage_cell">
                    <div class="heritage_card">
                        <img src="photos/<%=sgDataDestinationId.get(i*4+j)%>.jpg" alt="">
                        <div>
                            <h3><%=sgDataDestinationType.get(i*4+j)%></h3>
                            <h2><%=sgDataDestinationName.get(i*4+j)%></h2>
                            <div class="heritage_card_place_display">
                                <img src="assets/mappin@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=sgDataDestinationLocation.get(i*4+j)%></h4>
                            </div>
                            <%
                                double sgDestinationDistanceCountryCapital = 0;
                                sgDestinationDistanceCountryCapital = Math.sqrt(Math.pow(((double)sgDataDestinationDestinationLong.get(i*4+j)-(double)sgDataDestinationCountryCapitalLong.get(i*4+j)), 2) + Math.pow(((double)sgDataDestinationDestinationLat.get(i*4+j)-(double)sgDataDestinationCountryCapitalLat.get(i*4+j)), 2)) * 111.322;
                                sgDestinationDistanceCountryCapital = (double) Math.round(sgDestinationDistanceCountryCapital * 10)/10;
                                double sgDestinationDistanceLocationCapital = 0;
                                sgDestinationDistanceLocationCapital = Math.sqrt(Math.pow(((double)sgDataDestinationDestinationLong.get(i*4+j)-(double)sgDataDestinationLocationCapitalLong.get(i*4+j)), 2) + Math.pow(((double)sgDataDestinationDestinationLat.get(i*4+j)-(double)sgDataDestinationLocationCapitalLat.get(i*4+j)), 2)) * 111.322;
                                sgDestinationDistanceLocationCapital = (double) Math.round(sgDestinationDistanceLocationCapital * 10)/10;
                            %>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/ruler.fill@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=sgDestinationDistanceLocationCapital%>km dari <%=sgDataDestinationLocationCapital.get(i*4+j)%></h4>
                            </div>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/airplane@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=sgDestinationDistanceCountryCapital%>km dari <%=sgDataDestinationCountryCapital.get(i*4+j)%></h4>
                            </div>
                            <h2 class="heritage_card_price_hover">Rp<%=sgDataDestinationPrice.get(i*4+j)%>.00</h2>
                        </div>
                        <button type="submit" name="selected_destination" value="<%=sgDataDestinationId.get(i*4+j)%>">Lebih detail</button>
                    </div>
                </td>
                    <%
                    }
                    sgDataTotal = sgDataTotal - 4;
                    //out.println(sgDataTotal);
                }
                else{
                    for(int j = 0; j < sgDataTotal; j++){
                        //out.println(sgDataDestinationId.get(i*4+j));
                    %>
                <td class="heritage_cell">
                    <div class="heritage_card">
                        <img src="photos/<%=sgDataDestinationId.get(i*4+j)%>.jpg" alt="">
                        <div>
                            <h3><%=sgDataDestinationType.get(i*4+j)%></h3>
                            <h2><%=sgDataDestinationName.get(i*4+j)%></h2>
                            <div class="heritage_card_place_display">
                                <img src="assets/mappin@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=sgDataDestinationLocation.get(i*4+j)%></h4>
                            </div>
                            <%
                                double sgDestinationDistanceCountryCapital = 0;
                                sgDestinationDistanceCountryCapital = Math.sqrt(Math.pow(((double)sgDataDestinationDestinationLong.get(i*4+j)-(double)sgDataDestinationCountryCapitalLong.get(i*4+j)), 2) + Math.pow(((double)sgDataDestinationDestinationLat.get(i*4+j)-(double)sgDataDestinationCountryCapitalLat.get(i*4+j)), 2)) * 111.322;
                                sgDestinationDistanceCountryCapital = (double) Math.round(sgDestinationDistanceCountryCapital * 10)/10;
                                double sgDestinationDistanceLocationCapital = 0;
                                sgDestinationDistanceLocationCapital = Math.sqrt(Math.pow(((double)sgDataDestinationDestinationLong.get(i*4+j)-(double)sgDataDestinationLocationCapitalLong.get(i*4+j)), 2) + Math.pow(((double)sgDataDestinationDestinationLat.get(i*4+j)-(double)sgDataDestinationLocationCapitalLat.get(i*4+j)), 2)) * 111.322;
                                sgDestinationDistanceLocationCapital = (double) Math.round(sgDestinationDistanceLocationCapital * 10)/10;
                            %>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/ruler.fill@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=sgDestinationDistanceLocationCapital%>km dari <%=sgDataDestinationLocationCapital.get(i*4+j)%></h4>
                            </div>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/airplane@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=sgDestinationDistanceCountryCapital%>km dari <%=sgDataDestinationCountryCapital.get(i*4+j)%></h4>
                            </div>
                            <h2 class="heritage_card_price_hover">Rp<%=sgDataDestinationPrice.get(i*4+j)%>.00</h2>
                        </div>
                        <button type="submit" name="selected_destination" value="<%=sgDataDestinationId.get(i*4+j)%>">Lebih detail</button>
                    </div>
                </td>
                    <%
                    }
                    sgDataTotal = sgDataTotal - sgDataTotal;
                }
            %> 
            </tr>
        </table>
        <%
            }
            //out.println(sgRow);
        %>
    </form>
    <form id="heritage_th" class="heritage_section" action="location.jsp">
        <div>
            <img src="assets/th copy.png" alt="">
            <h1>Thailand</h1>
        </div>
        <%
            int thRow = (int)Math.ceil((double)thDataTotal/4);
            Vector thDataDestinationId = new Vector();
            Vector thDataDestinationName = new Vector();
            Vector thDataDestinationType = new Vector();
            Vector thDataDestinationLocation = new Vector();
            Vector thDataDestinationPrice = new Vector();
            Vector thDataDestinationLocationCapital = new Vector();
            Vector thDataDestinationCountryCapital = new Vector();
            Vector thDataDestinationDestinationLong = new Vector();
            Vector thDataDestinationDestinationLat = new Vector();
            Vector thDataDestinationCountryCapitalLong = new Vector();
            Vector thDataDestinationCountryCapitalLat = new Vector();
            Vector thDataDestinationLocationCapitalLong = new Vector();
            Vector thDataDestinationLocationCapitalLat = new Vector();
            String thSelectQuery = String.format(""
                +"SELECT "
                    +"d.destinationId AS 'destinationId', "
                    +"d.destinationName AS 'destinationName', "
                    +"d.destinationType AS 'destinationType', "
                    +"ad.admName AS 'destinationLocation', "
                    +"d.destinationPrice AS 'destinationPrice', "
                    +"ad.admCapital AS 'destinationLocationCapital', "
                    +"ac.admCapital AS 'destinationCountryCapital', "
                    +"d.destinationLong AS 'destinationLong', "
                    +"d.destinationLat AS 'destinationLat', "
                    +"ac.admLong AS 'destinationCountryCapitalLong', "
                    +"ac.admLat AS 'destinationCountryCapitalLat', "
                    +"ad.admLong AS 'destinationLocationCapitalLong', "
                    +"ad.admLat AS 'destinationLocationCapitalLat' "
                +"FROM destination d "
                +"JOIN administrative ad "
                    +"ON d.destinationLocation = ad.admId "
                +"JOIN country c "
                	+"ON d.destinationCountry = c.countryId "
                +"JOIN administrative ac "
                    +"ON c.countryCapitalId = ac.admId "
                +"WHERE destinationCountry = 9 AND destinationHeritagePark = 1"
            +"");
            ResultSet thSelectRes = con.executeQuery(thSelectQuery);
            while(thSelectRes.next()){
                thDataDestinationId.add(thSelectRes.getInt("destinationId"));
                thDataDestinationName.add(thSelectRes.getString("destinationName"));
                thDataDestinationType.add(thSelectRes.getString("destinationType"));
                thDataDestinationLocation.add(thSelectRes.getString("destinationLocation"));
                thDataDestinationPrice.add(thSelectRes.getInt("destinationPrice"));
                thDataDestinationLocationCapital.add(thSelectRes.getString("destinationLocationCapital"));
                thDataDestinationCountryCapital.add(thSelectRes.getString("destinationCountryCapital"));
                thDataDestinationDestinationLong.add(thSelectRes.getDouble("destinationLong"));
                thDataDestinationDestinationLat.add(thSelectRes.getDouble("destinationLat"));
                thDataDestinationCountryCapitalLong.add(thSelectRes.getDouble("destinationCountryCapitalLong"));
                thDataDestinationCountryCapitalLat.add(thSelectRes.getDouble("destinationCountryCapitalLat"));
                thDataDestinationLocationCapitalLong.add(thSelectRes.getDouble("destinationLocationCapitalLong"));
                thDataDestinationLocationCapitalLat.add(thSelectRes.getDouble("destinationLocationCapitalLat"));
            }
            //out.println(idDataDestinationName);
            for(int i = 0; i < thRow; i++){
        %> 
        <table> 
            <tr>
            <%
                if(Math.floor((double)thDataTotal/4) > 0){
                    for(int j = 0; j < 4; j++){
                        //out.println(idDataDestinationId.get(i*4+j));
                    %>
                <td class="heritage_cell">
                    <div class="heritage_card">
                        <img src="photos/<%=thDataDestinationId.get(i*4+j)%>.jpg" alt="">
                        <div>
                            <h3><%=thDataDestinationType.get(i*4+j)%></h3>
                            <h2><%=thDataDestinationName.get(i*4+j)%></h2>
                            <div class="heritage_card_place_display">
                                <img src="assets/mappin@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=thDataDestinationLocation.get(i*4+j)%></h4>
                            </div>
                            <%
                                double thDestinationDistanceCountryCapital = 0;
                                thDestinationDistanceCountryCapital = Math.sqrt(Math.pow(((double)thDataDestinationDestinationLong.get(i*4+j)-(double)thDataDestinationCountryCapitalLong.get(i*4+j)), 2) + Math.pow(((double)thDataDestinationDestinationLat.get(i*4+j)-(double)thDataDestinationCountryCapitalLat.get(i*4+j)), 2)) * 111.322;
                                thDestinationDistanceCountryCapital = (double) Math.round(thDestinationDistanceCountryCapital * 10)/10;
                                double thDestinationDistanceLocationCapital = 0;
                                thDestinationDistanceLocationCapital = Math.sqrt(Math.pow(((double)thDataDestinationDestinationLong.get(i*4+j)-(double)thDataDestinationLocationCapitalLong.get(i*4+j)), 2) + Math.pow(((double)thDataDestinationDestinationLat.get(i*4+j)-(double)thDataDestinationLocationCapitalLat.get(i*4+j)), 2)) * 111.322;
                                thDestinationDistanceLocationCapital = (double) Math.round(thDestinationDistanceLocationCapital * 10)/10;
                            %>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/ruler.fill@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=thDestinationDistanceLocationCapital%>km dari <%=thDataDestinationLocationCapital.get(i*4+j)%></h4>
                            </div>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/airplane@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=thDestinationDistanceCountryCapital%>km dari <%=thDataDestinationCountryCapital.get(i*4+j)%></h4>
                            </div>
                            <h2 class="heritage_card_price_hover">Rp<%=thDataDestinationPrice.get(i*4+j)%>.00</h2>
                        </div>
                        <button type="submit" name="selected_destination" value="<%=thDataDestinationId.get(i*4+j)%>">Lebih detail</button>
                    </div>
                </td>
                    <%
                    }
                    thDataTotal = thDataTotal - 4;
                    //out.println(thDataTotal);
                }
                else{
                    for(int j = 0; j < thDataTotal; j++){
                        //out.println(thDataDestinationId.get(i*4+j));
                    %>
                <td class="heritage_cell">
                    <div class="heritage_card">
                        <img src="photos/<%=thDataDestinationId.get(i*4+j)%>.jpg" alt="">
                        <div>
                            <h3><%=thDataDestinationType.get(i*4+j)%></h3>
                            <h2><%=thDataDestinationName.get(i*4+j)%></h2>
                            <div class="heritage_card_place_display">
                                <img src="assets/mappin@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=thDataDestinationLocation.get(i*4+j)%></h4>
                            </div>
                            <%
                                double thDestinationDistanceCountryCapital = 0;
                                thDestinationDistanceCountryCapital = Math.sqrt(Math.pow(((double)thDataDestinationDestinationLong.get(i*4+j)-(double)thDataDestinationCountryCapitalLong.get(i*4+j)), 2) + Math.pow(((double)thDataDestinationDestinationLat.get(i*4+j)-(double)thDataDestinationCountryCapitalLat.get(i*4+j)), 2)) * 111.322;
                                thDestinationDistanceCountryCapital = (double) Math.round(thDestinationDistanceCountryCapital * 10)/10;
                                double thDestinationDistanceLocationCapital = 0;
                                thDestinationDistanceLocationCapital = Math.sqrt(Math.pow(((double)thDataDestinationDestinationLong.get(i*4+j)-(double)thDataDestinationLocationCapitalLong.get(i*4+j)), 2) + Math.pow(((double)thDataDestinationDestinationLat.get(i*4+j)-(double)thDataDestinationLocationCapitalLat.get(i*4+j)), 2)) * 111.322;
                                thDestinationDistanceLocationCapital = (double) Math.round(thDestinationDistanceLocationCapital * 10)/10;
                            %>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/ruler.fill@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=thDestinationDistanceLocationCapital%>km dari <%=thDataDestinationLocationCapital.get(i*4+j)%></h4>
                            </div>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/airplane@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=thDestinationDistanceCountryCapital%>km dari <%=thDataDestinationCountryCapital.get(i*4+j)%></h4>
                            </div>
                            <h2 class="heritage_card_price_hover">Rp<%=thDataDestinationPrice.get(i*4+j)%>.00</h2>
                        </div>
                        <button type="submit" name="selected_destination" value="<%=thDataDestinationId.get(i*4+j)%>">Lebih detail</button>
                    </div>
                </td>
                    <%
                    }
                    thDataTotal = thDataTotal - thDataTotal;
                }
            %> 
            </tr>
        </table>
        <%
            }
            //out.println(thRow);
        %>
    </form>
    <form id="heritage_vn" class="heritage_section" action="location.jsp">
        <div>
            <img src="assets/vn copy.png" alt="">
            <h1>Vietnam</h1>
        </div>
        <%
            int vnRow = (int)Math.ceil((double)vnDataTotal/4);
            Vector vnDataDestinationId = new Vector();
            Vector vnDataDestinationName = new Vector();
            Vector vnDataDestinationType = new Vector();
            Vector vnDataDestinationLocation = new Vector();
            Vector vnDataDestinationPrice = new Vector();
            Vector vnDataDestinationLocationCapital = new Vector();
            Vector vnDataDestinationCountryCapital = new Vector();
            Vector vnDataDestinationDestinationLong = new Vector();
            Vector vnDataDestinationDestinationLat = new Vector();
            Vector vnDataDestinationCountryCapitalLong = new Vector();
            Vector vnDataDestinationCountryCapitalLat = new Vector();
            Vector vnDataDestinationLocationCapitalLong = new Vector();
            Vector vnDataDestinationLocationCapitalLat = new Vector();
            String vnSelectQuery = String.format(""
                +"SELECT "
                    +"d.destinationId AS 'destinationId', "
                    +"d.destinationName AS 'destinationName', "
                    +"d.destinationType AS 'destinationType', "
                    +"ad.admName AS 'destinationLocation', "
                    +"d.destinationPrice AS 'destinationPrice', "
                    +"ad.admCapital AS 'destinationLocationCapital', "
                    +"ac.admCapital AS 'destinationCountryCapital', "
                    +"d.destinationLong AS 'destinationLong', "
                    +"d.destinationLat AS 'destinationLat', "
                    +"ac.admLong AS 'destinationCountryCapitalLong', "
                    +"ac.admLat AS 'destinationCountryCapitalLat', "
                    +"ad.admLong AS 'destinationLocationCapitalLong', "
                    +"ad.admLat AS 'destinationLocationCapitalLat' "
                +"FROM destination d "
                +"JOIN administrative ad "
                    +"ON d.destinationLocation = ad.admId "
                +"JOIN country c "
                	+"ON d.destinationCountry = c.countryId "
                +"JOIN administrative ac "
                    +"ON c.countryCapitalId = ac.admId "
                +"WHERE destinationCountry = 10 AND destinationHeritagePark = 1"
            +"");
            ResultSet vnSelectRes = con.executeQuery(vnSelectQuery);
            while(vnSelectRes.next()){
                vnDataDestinationId.add(vnSelectRes.getInt("destinationId"));
                vnDataDestinationName.add(vnSelectRes.getString("destinationName"));
                vnDataDestinationType.add(vnSelectRes.getString("destinationType"));
                vnDataDestinationLocation.add(vnSelectRes.getString("destinationLocation"));
                vnDataDestinationPrice.add(vnSelectRes.getInt("destinationPrice"));
                vnDataDestinationLocationCapital.add(vnSelectRes.getString("destinationLocationCapital"));
                vnDataDestinationCountryCapital.add(vnSelectRes.getString("destinationCountryCapital"));
                vnDataDestinationDestinationLong.add(vnSelectRes.getDouble("destinationLong"));
                vnDataDestinationDestinationLat.add(vnSelectRes.getDouble("destinationLat"));
                vnDataDestinationCountryCapitalLong.add(vnSelectRes.getDouble("destinationCountryCapitalLong"));
                vnDataDestinationCountryCapitalLat.add(vnSelectRes.getDouble("destinationCountryCapitalLat"));
                vnDataDestinationLocationCapitalLong.add(vnSelectRes.getDouble("destinationLocationCapitalLong"));
                vnDataDestinationLocationCapitalLat.add(vnSelectRes.getDouble("destinationLocationCapitalLat"));
            }
            //out.println(idDataDestinationName);
            for(int i = 0; i < vnRow; i++){
        %> 
        <table> 
            <tr>
            <%
                if(Math.floor((double)vnDataTotal/4) > 0){
                    for(int j = 0; j < 4; j++){
                        //out.println(idDataDestinationId.get(i*4+j));
                    %>
                <td class="heritage_cell">
                    <div class="heritage_card">
                        <img src="photos/<%=vnDataDestinationId.get(i*4+j)%>.jpg" alt="">
                        <div>
                            <h3><%=vnDataDestinationType.get(i*4+j)%></h3>
                            <h2><%=vnDataDestinationName.get(i*4+j)%></h2>
                            <div class="heritage_card_place_display">
                                <img src="assets/mappin@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=vnDataDestinationLocation.get(i*4+j)%></h4>
                            </div>
                            <%
                                double vnDestinationDistanceCountryCapital = 0;
                                vnDestinationDistanceCountryCapital = Math.sqrt(Math.pow(((double)vnDataDestinationDestinationLong.get(i*4+j)-(double)vnDataDestinationCountryCapitalLong.get(i*4+j)), 2) + Math.pow(((double)vnDataDestinationDestinationLat.get(i*4+j)-(double)vnDataDestinationCountryCapitalLat.get(i*4+j)), 2)) * 111.322;
                                vnDestinationDistanceCountryCapital = (double) Math.round(vnDestinationDistanceCountryCapital * 10)/10;
                                double vnDestinationDistanceLocationCapital = 0;
                                vnDestinationDistanceLocationCapital = Math.sqrt(Math.pow(((double)vnDataDestinationDestinationLong.get(i*4+j)-(double)vnDataDestinationLocationCapitalLong.get(i*4+j)), 2) + Math.pow(((double)vnDataDestinationDestinationLat.get(i*4+j)-(double)vnDataDestinationLocationCapitalLat.get(i*4+j)), 2)) * 111.322;
                                vnDestinationDistanceLocationCapital = (double) Math.round(vnDestinationDistanceLocationCapital * 10)/10;
                            %>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/ruler.fill@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=vnDestinationDistanceLocationCapital%>km dari <%=vnDataDestinationLocationCapital.get(i*4+j)%></h4>
                            </div>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/airplane@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=vnDestinationDistanceCountryCapital%>km dari <%=vnDataDestinationCountryCapital.get(i*4+j)%></h4>
                            </div>
                            <h2 class="heritage_card_price_hover">Rp<%=vnDataDestinationPrice.get(i*4+j)%>.00</h2>
                        </div>
                        <button type="submit" name="selected_destination" value="<%=vnDataDestinationId.get(i*4+j)%>">Lebih detail</button>
                    </div>
                </td>
                    <%
                    }
                    vnDataTotal = vnDataTotal - 4;
                    //out.println(vnDataTotal);
                }
                else{
                    for(int j = 0; j < vnDataTotal; j++){
                        //out.println(vnDataDestinationId.get(i*4+j));
                    %>
                <td class="heritage_cell">
                    <div class="heritage_card">
                        <img src="photos/<%=vnDataDestinationId.get(i*4+j)%>.jpg" alt="">
                        <div>
                            <h3><%=vnDataDestinationType.get(i*4+j)%></h3>
                            <h2><%=vnDataDestinationName.get(i*4+j)%></h2>
                            <div class="heritage_card_place_display">
                                <img src="assets/mappin@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=vnDataDestinationLocation.get(i*4+j)%></h4>
                            </div>
                            <%
                                double vnDestinationDistanceCountryCapital = 0;
                                vnDestinationDistanceCountryCapital = Math.sqrt(Math.pow(((double)vnDataDestinationDestinationLong.get(i*4+j)-(double)vnDataDestinationCountryCapitalLong.get(i*4+j)), 2) + Math.pow(((double)vnDataDestinationDestinationLat.get(i*4+j)-(double)vnDataDestinationCountryCapitalLat.get(i*4+j)), 2)) * 111.322;
                                vnDestinationDistanceCountryCapital = (double) Math.round(vnDestinationDistanceCountryCapital * 10)/10;
                                double vnDestinationDistanceLocationCapital = 0;
                                vnDestinationDistanceLocationCapital = Math.sqrt(Math.pow(((double)vnDataDestinationDestinationLong.get(i*4+j)-(double)vnDataDestinationLocationCapitalLong.get(i*4+j)), 2) + Math.pow(((double)vnDataDestinationDestinationLat.get(i*4+j)-(double)vnDataDestinationLocationCapitalLat.get(i*4+j)), 2)) * 111.322;
                                vnDestinationDistanceLocationCapital = (double) Math.round(vnDestinationDistanceLocationCapital * 10)/10;
                            %>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/ruler.fill@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=vnDestinationDistanceLocationCapital%>km dari <%=vnDataDestinationLocationCapital.get(i*4+j)%></h4>
                            </div>
                            <div class="heritage_card_dist_hover">
                                <img src="assets/airplane@2x.png" alt="" class="heritage_card_icon">
                                <h4><%=vnDestinationDistanceCountryCapital%>km dari <%=vnDataDestinationCountryCapital.get(i*4+j)%></h4>
                            </div>
                            <h2 class="heritage_card_price_hover">Rp<%=vnDataDestinationPrice.get(i*4+j)%>.00</h2>
                        </div>
                        <button type="submit" name="selected_destination" value="<%=vnDataDestinationId.get(i*4+j)%>">Lebih detail</button>
                    </div>
                </td>
                    <%
                    }
                    vnDataTotal = vnDataTotal - vnDataTotal;
                }
            %> 
            </tr>
        </table>
        <%
            }
            //out.println(vnRow);
        %>
    </form>
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