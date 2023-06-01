<%-- 
    Document   : home
    Created on : Jun 1, 2023, 2:28:13 PM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="dao.BirdDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Bird"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css" type="text/css"/>
    </head>
    <body>
        <header>
            <%@include file="headHome.jsp" %>
        </header>
        
        <section>
            <%  
                /*
                String keyword = request.getParameter("txtsearch");
                
                ArrayList<Bird> list;
                String[] tmp = {"out of stock","availble"};
                if(keyword == null )
                    list = BirdDAO.getBird("");
                else
                    list = BirdDAO.getBird(keyword);
                 */   
                
                ArrayList<Bird> list = (ArrayList<Bird>)request.getAttribute("myBirdList");
                
                if(list != null && !list.isEmpty()){
                    for (Bird b : list) { 
                    float vote = BirdDAO.getBirdVote(b.getBird_id());
                                            %>
                    <table class="product">
                        
                        <tr><th><img src='<%= b.getUrl() %>' class="plantimg"></th></tr>
                        <tr><td><%= b.getBird_name() %></td></tr>
                        <tr><td><%= b.getPrice() %> USD</td></tr>
                        <tr><td><%= b.getAddress() %></td></tr>
                        <%  
                            if(vote > 0){
                        %>
                        <tr><td><%= vote %> Star</td></tr>                       
                        <%
                            }
                            %>                           
                            <tr><td><%= BirdDAO.getBirdBuying(b.getBird_id()) %> bought</td></tr>
                        <tr><td><a>Add to cart</a></td></tr>
                        
                    </table>    
                    
        <%                }
                }
                %>
            
                
        </section>
            
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
    
</html>
