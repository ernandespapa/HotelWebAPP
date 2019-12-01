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
        <title> Histórico - HotelWebApp</title>
        <link rel= "stylesheet" href ="../css/style.css">
    </head>
    <body>
        <%@include file="../WEB-INF/jspf/header.jspf"%>
        <br/>
        <br/>
        <div class ="card">
        <h3>Histórico</h3>
        <%if(session.getAttribute("user")== null){%>
        <h2>É preciso estar autenticado para acessar este recurso</h2>
        <%}else{%>
        <% User user = (User) session.getAttribute("user"); %>
        
        <% if (error != null){%>
        <h3><%=error%></h3>
        <%}%>
        <fieldset>
            <legend>Flitro</legend>
            <form>
                Nome: <input type="date" name="date"/>
                Quarto: <input type="text" name="room"/>
                <input type="submit" name="formFilter" value="Filtrar"/>
            </form>
        </fieldset>
        <table id = "card">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Quarto</th>
                <th>Entrada</th>
                <th>Saída</th>
                <th>Preço</th>
                
            </tr>
            <% for (Period p: Period.getHistory(date, room)){%>
            <tr>
                <td><%=p.getId()%></td>
                <td><%=p.getClient_name()%></td>
                <td><%=p.getRoom()%></td>
                <td><%=p.getCheck_in()%></td>
                <td><%=p.getCheck_out()%></td>
                <td><%=p.getPrice()%></td>
                
               
            </tr>
            <% }%>
        </table>
        
        <%}%>
       
        </div>
        
         <%@include file="../WEB-INF/jspf/footer.jspf"%> 
    </body>
</html>
