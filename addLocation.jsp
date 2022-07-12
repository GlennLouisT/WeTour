<%@include file="connect.jsp" %>

<% Connect con = Connect.getConnection(); %>

<!DOCTYPE html>
<html lang="en" id="addlocation">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%
        String failAddMessage = (String) session.getAttribute("failAddMessage");
        String failAddName = "";
        String failAddType = "";
        String failAddLocation = "";
        String failAddHeritage = "";
        String failAddLong = "";
        String failAddLat = "";
        String failAddDesc = "";
        String failAddPrice = "";
        if(failAddMessage != null){
            failAddName = (String) session.getAttribute("failAddName");
            failAddType = (String) session.getAttribute("failAddType");
            failAddLocation = (String) session.getAttribute("failAddLocation");
            failAddHeritage = (String) session.getAttribute("failAddHeritage");
            failAddLong = (String) session.getAttribute("failAddLong");
            failAddLat = (String) session.getAttribute("failAddLat");
            failAddDesc = (String) session.getAttribute("failAddDesc");
            failAddPrice = (String) session.getAttribute("failAddPrice");
        }
    %>
    <div id="navbar">
        <%@include file="navbar.jsp"%>
    </div>
    <div class="space"></div>
    <div id="addlocation_content">
        <h1>Tambah Lokasi</h1>
        <form action="addLocationController.jsp" onsubmit="">
            <table>
                <tr class="addlocation_form_row" id="addlocation_form_special">
                    <td>
                        <img src="assets/location.fill@2x.png" alt="" class="addlocation_form_icon">
                    </td>
                    <td>
                        <div class="addlocation_form_inputs_row">
                            <input type="text" name="try_add_name" id="addlocation_form_input_name" class="addlocation_form_input" placeholder="Nama lokasi" value="<%=failAddName%>">
                            <select name="try_add_type" id="addlocation_form_select_type">
                                <option value="" selected disabled>Pilih jenis lokasi</option>
                                <option value="Air Terjun">Air Terjun</option>
                                <option value="Cadangan Lahan Basah">Cadangan Lahan Basah</option>
                                <option value="Cagar Alam">Cagar Alam</option>
                                <option value="Hutan Hujan">Hutan Hujan</option>
                                <option value="Hutan Lindung">Hutan Lindung</option>
                                <option value="Hutan Nasional">Hutan Nasional</option>
                                <option value="Kawasan Lindung Nasional">Kawasan Lindung Nasional</option>
                                <option value="Kebun Raya">Kebun Raya</option>
                                <option value="Kepulauan">Kepulauan</option>
                                <option value="Monumen Alam">Monumen Alam</option>
                                <option value="Pulau">Pulau</option>
                                <option value="Rawa">Rawa</option>
                                <option value="Suaka Margasatwa">Suaka Margasatwa</option>
                                <option value="Taman">Taman</option>
                                <option value="Taman Alam">Taman Alam</option>
                                <option value="Taman Budaya">Taman Budaya</option>
                                <option value="Taman Ekologi">Taman Ekologi</option>
                                <option value="Taman Hutan">Taman Hutan</option>
                                <option value="Taman Laut">Taman Laut</option>
                                <option value="Taman Nasional">Taman Nasional</option>
                                <option value="Waduk">Waduk</option>
                            </select>
                        </div>
                        <input type="checkbox" name="try_add_heritage" id="addlocation_form_checkbox_heritage" <%
                            if(failAddHeritage != null){
                                out.println("checked");
                            }
                        %>>
                        <label for="addlocation_form_checkbox_heritage">merupakan Taman Warisan ASEAN (AHP)</label>
                    </td>
                </tr>
                <tr class="addlocation_form_row">
                    <td>
                        <img src="assets/mappin@2x.png" alt="" class="addlocation_form_icon">
                    </td>
                    <td>
                        <div class="addlocation_form_inputs_row">
                            <select name="try_add_location" id="addlocation_form_select_adm">
                                <option value="" selected disabled>Provinsi/negara bagian/distrik</option>
                                <optgroup label="Brunei">
                                    <%
                                        String showAdmBn = String.format("SELECT * FROM administrative WHERE admCountryId = '1'");
                                        ResultSet rsBn = con.executeQuery(showAdmBn);
                                        while(rsBn.next()){
                                            %>
                                                <option value="<% out.println(rsBn.getString("admId")); %>"><% out.println(rsBn.getString("admName")); %></option>
                                            <%
                                        }
                                    %>
                                </optgroup>
                                <optgroup label="Filipina">
                                    <%
                                        String showAdmPh = String.format("SELECT * FROM administrative WHERE admCountryId = '2'");
                                        ResultSet rsPh = con.executeQuery(showAdmPh);
                                        while(rsPh.next()){
                                            %>
                                                <option value="<% out.println(rsPh.getString("admId")); %>"><% out.println(rsPh.getString("admName")); %></option>
                                            <%
                                        }
                                    %>
                                </optgroup>
                                <optgroup label="Indonesia">
                                    <%
                                        String showAdmId = String.format("SELECT * FROM administrative WHERE admCountryId = '3'");
                                        ResultSet rsId = con.executeQuery(showAdmId);
                                        while(rsId.next()){
                                            %>
                                                <option value="<% out.println(rsId.getString("admId")); %>"><% out.println(rsId.getString("admName")); %></option>
                                            <%
                                        }
                                    %>
                                </optgroup>
                                <optgroup label="Kamboja">
                                    <%
                                        String showAdmKh = String.format("SELECT * FROM administrative WHERE admCountryId = '4'");
                                        ResultSet rsKh = con.executeQuery(showAdmKh);
                                        while(rsKh.next()){
                                            %>
                                                <option value="<% out.println(rsKh.getString("admId")); %>"><% out.println(rsKh.getString("admName")); %></option>
                                            <%
                                        }
                                    %>
                                </optgroup>
                                <optgroup label="Laos">
                                    <%
                                        String showAdmLa = String.format("SELECT * FROM administrative WHERE admCountryId = '5'");
                                        ResultSet rsLa = con.executeQuery(showAdmLa);
                                        while(rsLa.next()){
                                            %>
                                                <option value="<% out.println(rsLa.getString("admId")); %>"><% out.println(rsLa.getString("admName")); %></option>
                                            <%
                                        }
                                    %>
                                </optgroup>
                                <optgroup label="Malaysia">
                                    <%
                                        String showAdmMy = String.format("SELECT * FROM administrative WHERE admCountryId = '6'");
                                        ResultSet rsMy = con.executeQuery(showAdmMy);
                                        while(rsMy.next()){
                                            %>
                                                <option value="<% out.println(rsMy.getString("admId")); %>"><% out.println(rsMy.getString("admName")); %></option>
                                            <%
                                        }
                                    %>
                                </optgroup>
                                <optgroup label="Myanmar">
                                    <%
                                        String showAdmMm = String.format("SELECT * FROM administrative WHERE admCountryId = '7'");
                                        ResultSet rsMm = con.executeQuery(showAdmMm);
                                        while(rsMm.next()){
                                            %>
                                                <option value="<% out.println(rsMm.getString("admId")); %>"><% out.println(rsMm.getString("admName")); %></option>
                                            <%
                                        }
                                    %>
                                </optgroup>
                                <optgroup label="Singapura">
                                    <%
                                        String showAdmSg = String.format("SELECT * FROM administrative WHERE admCountryId = '8'");
                                        ResultSet rsSg = con.executeQuery(showAdmSg);
                                        while(rsSg.next()){
                                            %>
                                                <option value="<% out.println(rsSg.getString("admId")); %>"><% out.println(rsSg.getString("admName")); %></option>
                                            <%
                                        }
                                    %>
                                </optgroup>
                                <optgroup label="Thailand">
                                    <%
                                        String showAdmTh = String.format("SELECT * FROM administrative WHERE admCountryId = '9'");
                                        ResultSet rsTh = con.executeQuery(showAdmTh);
                                        while(rsTh.next()){
                                            %>
                                                <option value="<% out.println(rsTh.getString("admId")); %>"><% out.println(rsTh.getString("admName")); %></option>
                                            <%
                                        }
                                    %>
                                </optgroup>
                                <optgroup label="Vietnam">
                                    <%
                                        String showAdmVn = String.format("SELECT * FROM administrative WHERE admCountryId = '10'");
                                        ResultSet rsVn = con.executeQuery(showAdmVn);
                                        while(rsVn.next()){
                                            %>
                                                <option value="<% out.println(rsVn.getString("admId")); %>"><% out.println(rsVn.getString("admName")); %></option>
                                            <%
                                        }
                                    %>
                                </optgroup>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr class="addlocation_form_row">
                    <td>
                        <img src="assets/map.fill@2x.png" alt="" class="addlocation_form_icon">
                    </td>
                    <td>
                        <div class="addlocation_form_inputs_row">
                            <input type="number" name="try_add_long" id="addlocation_form_input_long" class="addlocation_form_input" placeholder="Posisi garis bujur" step=".0000000000000001" value="<%=failAddLong%>">
                            <input type="number" name="try_add_lat" id="addlocation_form_input_lat" class="addlocation_form_input" placeholder="Posisi garis lintang" step=".0000000000000001" value="<%=failAddLat%>">
                        </div>
                    </td>
                </tr>
                <tr class="addlocation_form_row">
                    <td>
                        <img src="assets/tag.fill@2x.png" alt="" class="addlocation_form_icon">
                    </td>
                    <td>
                        <input type="number" min="0" name="try_add_price" id="addlocation_form_input_price" class="addlocation_form_input" placeholder="Harga perjalanan"  value="<%=failAddPrice%>">
                    </td>
                </tr>
                <!-- <tr class="addlocation_form_row">
                    <td>
                        <img src="assets/photo.fill@2x.png" alt="" class="addlocation_form_icon">
                    </td>
                    <td>
                        <div class="addlocation_form_inputs_row">
                            <input type="file" name="try_add_photo" id="addlocation_form_input_photo" accept="image/*">
                        </div>
                    </td>
                </tr> -->
                <tr class="addlocation_form_row" id="addlocation_form_row_special">
                    <td>
                        <img src="assets/info.circle.fill@2x.png" alt="" class="addlocation_form_icon">
                    </td>
                    <td>
                        <textarea name="try_add_desc" id="" cols="30" rows="20" placeholder="Deskripsi maksimal 1023 karakter"><%=failAddDesc%></textarea>
                    </td>
                </tr>
            </table>
            <p id="addlocation_form_error">
                <%
                    if(failAddMessage != null){
                        out.println(failAddMessage);
                        session.setAttribute("failAddName", null);
                        session.setAttribute("failAddType", null);
                        session.setAttribute("failAddLocation", null);
                        session.setAttribute("failAddLong", null);
                        session.setAttribute("failAddLat", null);
                        session.setAttribute("failAddDesc", null);
                        session.setAttribute("failAddPrice", null);
                        session.setAttribute("failAddMessage", null);
                    }
                %>
            </p>
            <button type="submit" id="addlocation_form_button">Tambah</button>
        </form>
    </div>
</body>
</html>