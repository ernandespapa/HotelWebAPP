<%-- 
    Document   : finish-period
    Created on : 30/11/2019, 18:56:43
    Author     : Denos
--%>


<%@page import="br.com.fatecpg.hotel.Period"%>
<%@page import="java.util.Date"%>
<%@page import="br.com.fatecpg.hotel.Price"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    Long id = null;
    Period period = null;
   
  
    int day = 0;
    double price = 0;
    try{
    id = Long.parseLong(request.getParameter("id"));
    period = Period.getPeriod(id);
    Date now = new Date();
    
    day = now.getDay() - period.getCheck_in().getDay();
    
    price = day * Price.getCurrentPrice();
    
      if(request.getParameter("formFinishPeriod")!=null){
        try {
           
           Period.finishPeriod(id, price);
           response.sendRedirect(request.getContextPath()+"/operation/check_in.jsp");
        } catch(Exception e){
            error = e.getMessage();
        }
        
    }
    }catch(Exception ex){
        error = "Erro de leitura do registro do hospede: "  + ex.getMessage();
    }
    
  
     %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> check_in - HotelWebApp</title>
    </head>
    <body>
        <%@include file="../WEB-INF/jspf/header.jspf"%>
        <h1>Regitrar Saída</h1>
         <% if (error != null){%>
        <h3><%=error%></h3>
        <%}%>
        <%if(session.getAttribute("user")== null){%>
        <h2>É preciso estar autenticado para acessar este recurso</h2>
        <%}else if (period != null){%>
        <% User user = (User) session.getAttribute("user"); %>
        
            <form>
                <h3> ID: <%= id %></h3>
                <h3>Nome:<%= period.getClient_name()%></h3>
                <h3>Quarto:<%= period.getRoom() %></h3>
                <h3>Dias:<%= day %></h3>
                <h3>Preço: R$ <%= price%></h3>
                <input type="hidden" value ="<%= id%>" name="id"/>
                
                <h3><input type="submit" name="formFinishPeriod" value="Registrar Saida">&nbsp;&nbsp;<a href="check_in.jsp">Voltar</a></h3>
            </form>
        
        <%}%>
       
        
    </body>
</html>
