<%@include file="connect.jsp" %>

<%
    Connect con = Connect.getConnection();

    String tryEditName = request.getParameter("try_edit_name");
    String tryEditType = request.getParameter("try_edit_type");
    String tryEditHeritage = request.getParameter("try_edit_heritage");
    String tryEditDesc = request.getParameter("try_edit_desc");
    String tryEditPrice = request.getParameter("try_edit_price");

    int editId = (int)session.getAttribute("editId");

    Boolean fail = false;
    String failEditMessage = "";

    if(tryEditDesc.isEmpty()){
        fail = true;
        failEditMessage = failEditMessage + "Deskripsi lokasi harus diisi <br>";
    }
    else{
        if(tryEditDesc.length() < 180){
            fail = true;
            failEditMessage = failEditMessage + "Deskripsi lokasi minimal terdiri dari 180 karakter <br>";
        }
        if(tryEditDesc.length() > 1023){
            fail = true;
            failEditMessage = failEditMessage + "Deskripsi lokasi maksimal terdiri dari 1023 karakter <br>";
        }
    }
    if(tryEditPrice.isEmpty()){
        fail = true;
        failEditMessage = failEditMessage + "Harga perjalanan harus diisi <br>";
    }
    else{
        if(Integer.parseInt(tryEditPrice) < 50000){
            fail = true;
            failEditMessage = failEditMessage + "Harga perjalanan minimal Rp50.000 <br>";
        }
        if(Integer.parseInt(tryEditPrice) > 1000000){
            fail = true;
            failEditMessage = failEditMessage + "Harga perjalanan maksimal Rp1.000.000 <br>";
        }
    }
    
    if(fail == true){
        session.setAttribute("failEditHeritagePark", tryEditHeritage);
        session.setAttribute("failEditDesc", tryEditDesc);
        session.setAttribute("failEditPrice", tryEditPrice);
        session.setAttribute("failEditMessage", failEditMessage);
        response.sendRedirect("editLocation.jsp?editId=" + editId);
    }
    else{
        int selectedEditHeritage = 0;

        if(tryEditHeritage == null){
            selectedEditHeritage = 0;
        }
        else{
            selectedEditHeritage = 1;
        }

        String updateLocation = String.format("UPDATE destination SET destinationHeritagePark = '%s', destinationPrice = '%s', destinationDescription = '%s' WHERE destinationId = '%s'", selectedEditHeritage, tryEditPrice, tryEditDesc, editId);
        out.println(updateLocation);
        con.executeUpdate(updateLocation);
        response.sendRedirect("destination.jsp?search_destination_box=");
    }
%>