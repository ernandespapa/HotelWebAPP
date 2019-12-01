


<%@page import="br.com.fatecpg.hotel.Period"%>
<%@page import="java.util.Date"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    
    if(request.getParameter("formNewPeriod")!=null){
        try {
           String client_name = request.getParameter("client_name");
           String room = request.getParameter("room");
           Period.addPeriod(client_name, room);
           response.sendRedirect(request.getRequestURI());
        } catch(Exception e){
            error = e.getMessage();
        }
        
    }
     %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Check In - HotelWebApp</title>
        <link rel= "stylesheet" href ="../css/style.css">
    </head>
    <body>
        <%@include file="../WEB-INF/jspf/header.jspf"%>
        <br/>
        <br/>
        <div class ="card">
        <h3>Check in</h3>
        <%if(session.getAttribute("user")== null){%>
        <h2>É preciso estar autenticado para acessar este recurso</h2>
        <%}else{%>
        <% User user = (User) session.getAttribute("user"); %>
        
        <% if (error != null){%>
        <h3><%=error%></h3>
        <%}%>
        <fieldset>
            <legend>Check-In de Hospedes</legend>
            <form>
                Nome do Cliente: <input type="text" name="client_name"/>
                Quarto: <input type="text" name="room"/>
                <input type="submit" name="formNewPeriod" value="Registrar CheckIn"/>
            </form>
        </fieldset>
        <table id="tb">
            <tr>
                <th>ID</th>
                <th>Nome do Cliente</th>
                <th>Quarto</th>
                <th>Entrada</th>
                <th>Comandos</th>
            </tr>
            <% for (Period p: Period.getPeriods()){%>
            <tr>
                <td><%=p.getId()%></td>
                <td><%=p.getClient_name()%></td>
                <td><%=p.getRoom()%></td>
                <td><%=p.getCheck_in()%></td>
                
                <td>
                    <a href="finish-period.jsp?id=<%=p.getId()%>">CHECK_OUT</a>
                </td>
            </tr>
            <% }%>
        </table>
        
        <%}%>
        </div>
         <%@include file="../WEB-INF/jspf/footer.jspf"%> 
    </body>
</html>
