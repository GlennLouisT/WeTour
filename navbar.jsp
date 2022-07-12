<div id="navbar_nav">
    <div id="navbar_left">
        <a href="index.jsp"><p class="navbar_link_text">WeTour</p></a>
    </div>
    <%
        String logUser = (String) session.getAttribute("logEmail");
        String logName = (String) session.getAttribute("logName");
        if(logName == null){
            %>
                <div id="navbar_right">
                    <a href="destination.jsp?search_destination_box="><p class="navbar_link_text">Destinasi</p></a>
                    <a href="heritage.jsp"><p class="navbar_link_text">Taman Warisan</p></a>
                    <a href="login.jsp"><p class="navbar_link_text">Masuk</p></a>
                    <a href="register.jsp"><p class="navbar_link_text">Daftar</p></a>
                </div>
            <%
        }
        else{
            if(logName.equals("admin")){
                %>
                    <div id="navbar_right">
                        <a href="destination.jsp?search_destination_box="><p class="navbar_link_text">Destinasi</p></a>
                        <a href="heritage.jsp"><p class="navbar_link_text">Taman Warisan</p></a>
                        <a href="trip.jsp"><p class="navbar_link_text">Admin</p></a>
                        <a href="logoutController.jsp"><p class="navbar_link_text">Keluar</p></a>
                    </div>
                <%
            }
            else{
                %>
                    <div id="navbar_right">
                        <a href="destination.jsp?search_destination_box="><p class="navbar_link_text">Destinasi</p></a>
                        <a href="heritage.jsp"><p class="navbar_link_text">Taman Warisan</p></a>
                        <a href="trip.jsp"><p class="navbar_link_text">Perjalanan</p></a>
                        <a href="profile.jsp"><p class="navbar_link_text"><%=logName.substring(0, 1).toUpperCase() + logName.substring(1)%></p></a>
                        <a href="logoutController.jsp"><p class="navbar_link_text">Keluar</p></a>
                    </div>
                <%
            }
        }
    %>
</div>