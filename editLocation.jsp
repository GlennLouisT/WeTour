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
        String failEditMessage = (String) session.getAttribute("failEditMessage");
        String failEditName = "";
        String failEditType = "";
        String failEditDesc = "";
        String failEditPrice = "";
        String failEditHeritagePark = "";
        int editId = 0;

        editId = Integer.parseInt(request.getParameter("editId"));
        session.setAttribute("editId", editId);
        String getEditInfoQuery = String.format("SELECT * FROM destination WHERE destinationId = %s", editId);
        ResultSet getEditInfoRes = con.executeQuery(getEditInfoQuery);

        if(failEditMessage != null){
            if(getEditInfoRes.next()){
                failEditName = getEditInfoRes.getString("destinationName");
                failEditType = getEditInfoRes.getString("destinationType");
            }
            editId = (int) session.getAttribute("editId");
            failEditDesc = (String) session.getAttribute("failEditDesc");
            failEditPrice = (String) session.getAttribute("failEditPrice");
            failEditHeritagePark = (String) session.getAttribute("failEditHeritagePark");
        }
        else{
            if(getEditInfoRes.next()){
                failEditName = getEditInfoRes.getString("destinationName");
                failEditType = getEditInfoRes.getString("destinationType");
                failEditDesc = getEditInfoRes.getString("destinationDescription");
                failEditPrice = getEditInfoRes.getString("destinationPrice");
                failEditHeritagePark = getEditInfoRes.getString("destinationHeritagePark");
            }
        }
    %>
    <div id="navbar">
        <%@include file="navbar.jsp"%>
    </div>
    <div class="space"></div>
    <div id="addlocation_content">
        <h1>Ubah Lokasi</h1>
        <form action="editLocationController.jsp" onsubmit="">
            <table>
                <tr class="addlocation_form_row" id="addlocation_form_special">
                    <td>
                        <img src="assets/location.fill@2x.png" alt="" class="addlocation_form_icon">
                    </td>
                    <td>
                        <div class="addlocation_form_inputs_row">
                            <input type="text" name="try_edit_name" id="addlocation_form_input_name" class="addlocation_form_input" placeholder="Nama lokasi" value="<%=failEditName%>" disabled>
                            <select name="try_edit_type" id="addlocation_form_select_type" disabled>
                                <option selected><%=failEditType%></option>
                            </select>
                        </div>
                        <input type="checkbox" name="try_edit_heritage" id="addlocation_form_checkbox_heritage" <%
                            if(failEditHeritagePark != null){
                                if(failEditHeritagePark.equals("on")){
                                    out.println("checked");
                                }
                                else if(failEditHeritagePark.equals("1")){
                                    out.println("checked");
                                }
                            }
                        %>>
                        <label for="addlocation_form_checkbox_heritage">merupakan Taman Warisan ASEAN (AHP)</label>
                    </td>
                </tr>
                <tr class="addlocation_form_row">
                    <td>
                        <img src="assets/tag.fill@2x.png" alt="" class="addlocation_form_icon">
                    </td>
                    <td>
                        <input type="number" min="0" name="try_edit_price" id="addlocation_form_input_price" class="addlocation_form_input" placeholder="Harga perjalanan"  value="<%=failEditPrice%>">
                    </td>
                </tr>
                <tr class="addlocation_form_row" id="addlocation_form_row_special">
                    <td>
                        <img src="assets/info.circle.fill@2x.png" alt="" class="addlocation_form_icon">
                    </td>
                    <td>
                        <textarea name="try_edit_desc" id="" cols="30" rows="20" placeholder="Deskripsi maksimal 1023 karakter"><%=failEditDesc%></textarea>
                    </td>
                </tr>
            </table>
            <p id="addlocation_form_error">
                <%
                    if(failEditMessage != null){
                        out.println(failEditMessage);
                        session.setAttribute("failEditName", null);
                        session.setAttribute("failEditType", null);
                        session.setAttribute("failEditDesc", null);
                        session.setAttribute("failEditPrice", null);
                        session.setAttribute("failEditMessage", null);
                    }
                %>
            </p>
            <button type="submit" id="addlocation_form_button">Ubah</button>
        </form>
    </div>
</body>
</html>