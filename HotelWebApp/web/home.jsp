
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
        <br/>
        
        <div class="card">
        <h3>Preço da Diária</h3>
      <% if( Price.getCurrentPrice() == null){%>
        <h4>Preço não definido pela administração do Hotel</h4>
        <% }else{%>
        <table id="tb">
            <tr>
                <th>R$</th>
            <tr>
              
            <tr>
                <td><%= Price.getCurrentPrice()%></td>
                 
            </tr> 
        </table>
         <% }%>
        </div>
    
       <div class="card">
           <h3> Nossa História</h3>
           <img style="padding-left: 300px;" src ="img/hotel1.jpg">
           
           <p style="text-align: justify;">
               Em 19 de janeiro de 2000 o Hotel foi inaugurado. Inicialmente com 17 apartamentos e somente serviço 
               de café da manhã, aos poucos novos serviços foram criados e nossa estrutura ampliada. Em 2004 nossa
               primeira ampliação foi a construção da Piscina e Saunas. Mais tarde, em 2005, inauguramos nosso novo 
               Salão de Café da Manhã. Já em 2007 foi a vez da nova Recepção. Novos apartamentos foram sendo criados,
               além de áreas como o Play Ground, Quadra e novos estacionamentos. Desde 2016 temos uma nova área de 
               lazer e um Restaurante.
           </p>
       </div>
    
       <%@include file="WEB-INF/jspf/footer.jspf"%> 
    </body>
</html>
