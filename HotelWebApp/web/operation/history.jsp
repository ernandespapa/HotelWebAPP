<%-- 
    Document   : history
    Created on : 30/11/2019, 19:27:29
    Author     : Denos
--%>

<%@page import="br.com.fatecpg.hotel.Period"%>
<%@page import="java.util.Date"%>
<%@page import="br.com.fatecpg.hotel.Price"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    String date = null;
    String room = null;
    
    if(request.getParameter("formFilter")!=null){
      date = request.getParameter("date");
      if (date.isEmpty()) date = null;
      room = request.getParameter("room");
      if (room.isEmpty()) room = null;
   
    }
     %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
