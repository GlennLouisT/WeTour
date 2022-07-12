<%@include file="connect.jsp" %>

<%
    Connect con = Connect.getConnection();

    String tryAddName = request.getParameter("try_add_name");
    String tryAddType = request.getParameter("try_add_type");
    String tryAddHeritage = request.getParameter("try_add_heritage");
    String tryAddLocation = request.getParameter("try_add_location");
    String tryAddLong = request.getParameter("try_add_long");
    String tryAddLat = request.getParameter("try_add_lat");
    String tryAddDesc = request.getParameter("try_add_desc");
    String tryAddPrice = request.getParameter("try_add_price");

    Boolean fail = false;
    String failAddMessage = "";

    if(tryAddName.isEmpty()){
        fail = true;
        failAddMessage = failAddMessage + "Nama lokasi harus diisi <br>";
    }
    else{
        if(tryAddName.length() < 5){
            fail = true;
            failAddMessage = failAddMessage + "Nama lokasi minimal terdiri dari 5 karakter alfabet <br>";
        }
        if(!tryAddName.matches("[a-zA-Z ]+")){
            fail = true;
            failAddMessage = failAddMessage + "Nama lokasi harus terdiri dari karakter <br>";
        }
    }
    if(tryAddType == null){
        fail = true;
        failAddMessage = failAddMessage + "Jenis lokasi harus dipilih <br>";
    }
    if(tryAddLocation == null){
        fail = true;
        failAddMessage = failAddMessage + "Lokasi harus dipilih <br>";
    }
    if(tryAddLong.isEmpty()){
        fail = true;
        failAddMessage = failAddMessage + "Posisi garis bujur lokasi harus diisi <br>";
    }
    else{
        if(Float.parseFloat(tryAddLong) < -180 || Float.parseFloat(tryAddLong) > 180){
            fail = true;
            failAddMessage = failAddMessage + "Garis bujur harus memiliki nilai diantara -180 dan 180 <br>";
        }
    }
    if(tryAddLat.isEmpty()){
        fail = true;
        failAddMessage = failAddMessage + "Posisi garis lintang lokasi harus diisi <br>";
    }
    else{
        if(Float.parseFloat(tryAddLat) < -90 || Float.parseFloat(tryAddLat) > 90){
            fail = true;
            failAddMessage = failAddMessage + "Garis lintang harus memiliki nilai diantara -90 dan 90 <br>";
        }
    }
    if(tryAddDesc.isEmpty()){
        fail = true;
        failAddMessage = failAddMessage + "Deskripsi lokasi harus diisi <br>";
    }
    else{
        if(tryAddDesc.length() < 180){
            fail = true;
            failAddMessage = failAddMessage + "Deskripsi lokasi minimal terdiri dari 180 karakter <br>";
        }
        if(tryAddDesc.length() > 1023){
            fail = true;
            failAddMessage = failAddMessage + "Deskripsi lokasi maksimal terdiri dari 1023 karakter <br>";
        }
    }
    if(tryAddPrice.isEmpty()){
        fail = true;
        failAddMessage = failAddMessage + "Harga perjalanan harus diisi <br>";
    }
    else{
        if(Integer.parseInt(tryAddPrice) < 50000){
            fail = true;
            failAddMessage = failAddMessage + "Harga perjalanan minimal Rp50.000 <br>";
        }
        if(Integer.parseInt(tryAddPrice) > 1000000){
            fail = true;
            failAddMessage = failAddMessage + "Harga perjalanan maksimal Rp1.000.000 <br>";
        }
    }
    out.println(tryAddLocation);
    
    if(fail == true){
        session.setAttribute("failAddName", tryAddName);
        session.setAttribute("failAddType", tryAddType);
        session.setAttribute("failAddLocation", tryAddLocation);
        session.setAttribute("failAddHeritage", tryAddHeritage);
        session.setAttribute("failAddLong", tryAddLong);
        session.setAttribute("failAddLat", tryAddLat);
        session.setAttribute("failAddDesc", tryAddDesc);
        session.setAttribute("failAddPrice", tryAddPrice);
        session.setAttribute("failAddMessage", failAddMessage);
        response.sendRedirect("addLocation.jsp");
    }
    else{
        int selectedLocationCountry = 0;

        String getAdmCountryQuery = String.format("SELECT * FROM administrative WHERE admId = '%s'", tryAddLocation);
        out.println(getAdmCountryQuery);
        ResultSet getAdmCountryRes = con.executeQuery(getAdmCountryQuery);
        if(getAdmCountryRes.next()){
            selectedLocationCountry = getAdmCountryRes.getInt("AdmCountryId");
        }

        int selectedAddHeritage = 0;

        if(tryAddHeritage == null){
            selectedAddHeritage = 0;
        }
        else{
            selectedAddHeritage = 1;
        }

        String destinationInsertQuery = String.format("INSERT INTO destination (destinationName, destinationCountry, destinationLocation, destinationType, destinationHeritagePark, destinationPrice, destinationDescription, destinationLat, destinationLong) VALUES ('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')", tryAddName, selectedLocationCountry, tryAddLocation, tryAddType, selectedAddHeritage, tryAddPrice, tryAddDesc, tryAddLat, tryAddLong);

        out.println(destinationInsertQuery);
        con.executeUpdate(destinationInsertQuery);
        response.sendRedirect("destination.jsp?search_destination_box=");
    }
%>