<%@include file="connect.jsp" %>

<%
    Connect con = Connect.getConnection();

    String deleteLocationQuery = String.format("UPDATE destination SET destinationHeritagePark = 2 WHERE destinationId = %s", request.getParameter("deleteId"));
    con.executeUpdate(deleteLocationQuery);

    response.sendRedirect("destination.jsp?search_destination_box=");
%>