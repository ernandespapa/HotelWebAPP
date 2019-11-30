
<%@page import="br.com.fatecpg.hotel.Price"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Home - HotelWebApp</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <h1>Página Inicial</h1>
        <h1>Preço da Diária</h1>
      <% if( Price.getCurrentPrice() == null){%>
        <h3>[Preço não definido pela administração do Hotel</h3>
        <% }else{%>
            <h3>R$ <%= Price.getCurrentPrice()%></h3>
        <% }%>
        
        
    </body>
</html>
