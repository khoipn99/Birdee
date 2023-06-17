<%-- 
    Document   : birdRange
    Created on : Jun 16, 2023, 12:02:29 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.BirdDAO"%>
<%@page import="dto.Bird"%>
<%@page import="dao.AccessoryDAO"%>
<%@page import="dto.Accessory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="mylib/bt5/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="style.css" type="text/css"/>
        
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
      <div class="container py-3">
          <div class="row">
              <div class="col-md-2 py-xxl-5">
                  <form action="MainController">
                      <div class="card shadow-sm">
                          <div class="card-body">
                              <div class="form-floating mb-3">

                                  <input type="text" name="minPrice" id="minPrice" class="form-control form-control-lg" placeholder="Minimum price">
                                  <label for="minPrice">Minimum price</label>
                              </div>
                              <div class="form-floating mb-3">
                                  <input type="text" name="maxPrice" id="maxPrice" class="form-control form-control-lg" placeholder="Maximum price">
                                  <label for="maxPrice">Maximum price</label>
                              </div>
                              <button type="submit" value="sortbyrangeid" name="action" class="btn btn-primary w-100 mb-3">
                                  <i class="fas fa-sort-amount-up"></i> Sort by price
                              </button>
                          </div>
                      </div>

                  </form>

              </div>
            

        
        
              <div class="col-md-10">

                <div class="row">

                    <div class="p1">
                        BIRD

                    </div>
                    <%
                        ArrayList<Bird> list = (ArrayList<Bird>) request.getAttribute("Birdrange");
                        if (list != null && !list.isEmpty()) {
                    %>                                    
                    <q>Tổng số tìm kiếm: <%= list.size()%>   </q>                                   
                    <%
                        for (Bird b : list) {
                    %>

                    <div class="col py-3">
                        <div class="card" style="width: 15rem;">
                            <a href="MainController?action=viewBirdDetail&birdId=<%= b.getBird_id()%>"><img src="<%= BirdDAO.getMainBirdImg(b.getBird_id())%>" class="card-img-top" alt="..."></a>                                    
                            <div class="card-body">
                                <a style="text-decoration: none; color: #000000 " href="MainController?action=viewBirdDetail&birdId=<%= b.getBird_id()%>"><h5 class="card-title"><%= b.getBird_name()%></h5></a>
                            </div>

                            <ul class="list-group list-group-flush">
                                <li class="list-group-item" style="color: red"><%= b.getPrice()%>00 VND</li>
                                <li class="list-group-item" style="height: 5rem;"><%= BirdDAO.getBirdAddress(b.getBird_id())%></li>                                          

                                <%
                                    float vote = BirdDAO.getBirdVote(b.getBird_id());
                                    if (vote == 0) {
                                %>
                                <li class="list-group-item"><a>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                    </a><a>, đã mua <%= BirdDAO.getBirdBuying(b.getBird_id())%></a></li>
                                    <%
                                    } else if (vote > 0 && vote < 1.5) {
                                    %> 
                                <li class="list-group-item"><a>
                                        <span class="fa fa-star"    style="color: yellow"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                    </a><a>,                                                                            
                                        đã mua <%= BirdDAO.getBirdBuying(b.getBird_id())%></a></li>
                                        <%
                                        } else if (vote >= 1.5 && vote < 2.5) {
                                        %>
                                <li class="list-group-item"><a>
                                        <span class="fa fa-star" style="color: yellow"></span>
                                        <span class="fa fa-star" style="color: yellow"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                    </a><a>,                                                                            
                                        đã mua <%= BirdDAO.getBirdBuying(b.getBird_id())%></a></li>

                                <%
                                } else if (vote >= 2.5 && vote < 3.5) {
                                %>
                                <li class="list-group-item"><a>
                                        <span class="fa fa-star" style="color: yellow"></span>
                                        <span class="fa fa-star" style="color: yellow"></span>
                                        <span class="fa fa-star" style="color: yellow"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                    </a><a>,                                                                            
                                        đã mua <%= BirdDAO.getBirdBuying(b.getBird_id())%></a></li>
                                        <%
                                        } else if (vote >= 3.5 && vote < 4.5) {
                                        %>
                                <li class="list-group-item"><a>
                                        <span class="fa fa-star" style="color: yellow"></span>
                                        <span class="fa fa-star" style="color: yellow"></span>
                                        <span class="fa fa-star" style="color: yellow"></span>
                                        <span class="fa fa-star" style="color: yellow"></span>
                                        <span class="fa fa-star"></span>
                                    </a><a>,                                                                            
                                        đã mua <%= BirdDAO.getBirdBuying(b.getBird_id())%></a></li>
                                        <%
                                        } else if (vote >= 4.5 && vote <= 5) {
                                        %>
                                <li class="list-group-item"><a>
                                        <span class="fa fa-star" style="color: yellow"></span>
                                        <span class="fa fa-star" style="color: yellow"></span>
                                        <span class="fa fa-star" style="color: yellow"></span>
                                        <span class="fa fa-star" style="color: yellow"></span>
                                        <span class="fa fa-star" style="color: yellow"></span>
                                    </a><a>,                                                                            
                                        đã mua <%= BirdDAO.getBirdBuying(b.getBird_id())%></a></li>
                                        <%
                                            }
                                        %>
                            </ul>
                            <div class="card-body" style="background-color: rgba(1, 122, 71, 1)">                                      
                                <a href="#" class="card-link" style="color: white" >Add to cart</a>
                            </div>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>            
                </div>

                <div class="p1 py-3">
                    ACCESSORIES FOR BIRD
                </div>

                <div class="p2 mb-3">
                    <div class="row py-3">
                        <%
                            ArrayList<Accessory> list2 = (ArrayList<Accessory>) request.getAttribute("Acrange");
                            if (list2 != null && !list2.isEmpty()) {

                        %>
                        <q> Tổng số tìm kiếm: <%= list2.size()%> </q>  
                        <%
                            for (Accessory a : list2) {

                        %> 
                        <div class="col py-3">
                            <div class="card" style="width: 15rem;">
                                <a href="MainController?action=viewAccessoryDetail&accessorydId=<%= a.getAccessory_id()%>"><img src="<%= AccessoryDAO.getMainAccessoryImg(a.getAccessory_id())%>" class="card-img-top2" alt="..."></a>
                                <div class="card-body">
                                    <a style="text-decoration: none; color: #000000 " href="MainController?action=viewAccessoryDetail&accessorydId=<%= a.getAccessory_id()%>"><h5 class="card-title"><%= a.getName()%></h5></a>

                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item" style="color: red"><%= a.getPrice()%>00 VND</li>

                                    <li class="list-group-item" style="height: 5rem;"><%= AccessoryDAO.getAccessoryAddress(a.getAccessory_id())%></li>

                                    <%
                                        float vote = AccessoryDAO.getAccessoryVote(a.getAccessory_id());
                                        if (vote == 0) {
                                    %>
                                    <li class="list-group-item"><a>
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star"></span>
                                        </a><a>, đã mua <%= AccessoryDAO.getAccessoryBuying(a.getAccessory_id())%></a></li>
                                        <%
                                        } else if (vote > 0 && vote < 1.5) {
                                        %> 
                                    <li class="list-group-item"><a>
                                            <span class="fa fa-star"    style="color: yellow"></span>
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star"></span>
                                        </a><a>,                                                                            
                                            đã mua <%= AccessoryDAO.getAccessoryBuying(a.getAccessory_id())%></a></li>
                                            <%
                                            } else if (vote >= 1.5 && vote < 2.5) {
                                            %>
                                    <li class="list-group-item"><a>
                                            <span class="fa fa-star" style="color: yellow"></span>
                                            <span class="fa fa-star" style="color: yellow"></span>
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star"></span>
                                        </a><a>,                                                                            
                                            đã mua <%= AccessoryDAO.getAccessoryBuying(a.getAccessory_id())%></a></li>

                                    <%
                                    } else if (vote >= 2.5 && vote < 3.5) {
                                    %>
                                    <li class="list-group-item"><a>
                                            <span class="fa fa-star" style="color: yellow"></span>
                                            <span class="fa fa-star" style="color: yellow"></span>
                                            <span class="fa fa-star" style="color: yellow"></span>
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star"></span>
                                        </a><a>,                                                                            
                                            đã mua <%= AccessoryDAO.getAccessoryBuying(a.getAccessory_id())%></a></li>
                                            <%
                                            } else if (vote >= 3.5 && vote < 4.5) {
                                            %>
                                    <li class="list-group-item"><a>
                                            <span class="fa fa-star" style="color: yellow"></span>
                                            <span class="fa fa-star" style="color: yellow"></span>
                                            <span class="fa fa-star" style="color: yellow"></span>
                                            <span class="fa fa-star" style="color: yellow"></span>
                                            <span class="fa fa-star"></span>
                                        </a><a>,                                                                            
                                            đã mua <%= AccessoryDAO.getAccessoryBuying(a.getAccessory_id())%></a></li>
                                            <%
                                            } else if (vote >= 4.5 && vote <= 5) {
                                            %>
                                    <li class="list-group-item"><a>
                                            <span class="fa fa-star" style="color: yellow"></span>
                                            <span class="fa fa-star" style="color: yellow"></span>
                                            <span class="fa fa-star" style="color: yellow"></span>
                                            <span class="fa fa-star" style="color: yellow"></span>
                                            <span class="fa fa-star" style="color: yellow"></span>
                                        </a><a>,                                                                            
                                            đã mua <%= AccessoryDAO.getAccessoryBuying(a.getAccessory_id())%></a></li>
                                            <%
                                                }
                                            %>

                                </ul>
                                <div class="card-body" style="background-color: rgba(1, 122, 71, 1)">
                                    <a href="#" class="card-link" style="color: white" >Add to cart</a>

                                </div>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>          
                    </div>
                </div>
                 </div>   
        </div>
     </div>
                        <%@include file="footer.jsp" %>
    </body>
</html>
