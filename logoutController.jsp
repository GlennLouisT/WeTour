<%
    session.setAttribute("logEmail", null);
    session.setAttribute("logName", null);
    session.setAttribute("logProfile", null);
    response.sendRedirect("index.jsp");
%>