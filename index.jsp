<!DOCTYPE html>
<html lang="en" id="home">
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
    <div id="home_content">
        <div id="home_intro">
            <h1>WeTour</h1>
            <p>Kenali alam tanpa batas.</p>
        </div>
        <form id="home_search" action="destination.jsp">
            <div>
                <img src="assets/location.fill@2x.png" alt="" class="menu_search_icon">
                <input type="text" name="search_destination_box" id="home_search_location" class="home_search_input" placeholder="Masukkan nama negara, kota, atau tujuan destinasi">
            </div>
            <button type="submit" id="home_search_button">Cari</button>
        </form>
    </div>
</body>
</html>