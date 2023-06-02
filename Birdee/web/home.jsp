<%-- 
    Document   : home
    Created on : Jun 1, 2023, 2:28:13 PM
    Author     : Admin
--%>

<%@page import="dao.AccessoryDAO"%>
<%@page import="dto.Accessory"%>
<%@page import="java.util.List"%>
<%@page import="dao.BirdDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Bird"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Birdee</title>
        <link rel="stylesheet" href="style.css" type="text/css"/>
    </head>
    <body>

        <header>
            <%@include file="headHome.jsp" %>
        </header>

        <section class="body py-3">  
            <div class="container">

                <div class="slider mb-3">

                    <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="mylib/img/baner1.png" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="mylib/img/—Pngtree—black friday sale background design_1227059 1.png" class="d-block w-100" alt="...">
                            </div>

                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>

                </div>

                <div class="body1 py-3">KHÁM PHÁ DANH MỤC

                </div>
                <div class="body2 py-3">
                    <div class="cate ">
                        <div class="row ">
                            <div class="col-md-3">
                                <a href="#"><img src="mylib/img/chim.png" alt=""></a><br>
                                <a href="#">Chim cảnh</a>
                            </div>
                            <div class="col-md-3">
                                <a href="#"><img src="mylib/img/thucan.png" alt=""></a><br>
                                <a href="#">Thức ăn cho chim</a>

                            </div>
                            <div class="col-md-3">
                                <a href="#"><img src="mylib/img/mangan.png" alt=""></a><br>
                                <a href="#">Máng ăn, cóng</a>
                            </div>
                            <div class="col-md-3">
                                <a href="#"><img src="mylib/img/long.png" alt=""></a><br>
                                <a href="#">Lồng chim</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="top py-3">
            <div class="container mb-3">
                <div class="top1">
                    BIRD
                </div>
                <div class="my-3">
                    <div class="container text-center">
                        <div class="row">


                            <%
                                ArrayList<Bird> list = (ArrayList<Bird>) request.getAttribute("myBirdList");
                                if (list != null && !list.isEmpty()) {
                                    for (Bird b : list) {
                                        float vote = BirdDAO.getBirdVote(b.getBird_id());
                            %>

                            <div class="col">
                                <div class="card" style="width: 18rem;">
                                    <img src="<%= BirdDAO.getBirdImg(b.getBird_id()).get(0) %>" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title"><%= b.getBird_name()%></h5>

                                    </div>
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item" style="color: red"><%= b.getPrice()%> USD</li>
                                        <li class="list-group-item"><%= BirdDAO.getBirdAddress(b.getBird_id()) %></li>
                                            <%
                                                if (vote > 0) {
                                            %>
                                        <li class="list-group-item"><a style="color: red"><%= vote%> Star</a><a>, đã mua <%= BirdDAO.getBirdBuying(b.getBird_id())%></a></li>
                                            <%
                                            } else {
                                            %> 
                                        <li class="list-group-item">đã mua <%= BirdDAO.getBirdBuying(b.getBird_id())%></li>
                                            <%
                                                }
                                            %>

                                    </ul>
                                    <div class="card-body" style="background-color: rgba(1, 122, 71, 1)">                                      
                                        <a href="#" class="card-link" style="color: white" >Add to cart</a>
                                    </div>
                                </div>
                            </div>
                            <%                }
                                }
                            %>            


                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="banner2 py-3">
            <div class="container">

                <div class="slider mb-3">

                    <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="mylib/img/baner1.png" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="mylib/img/baner1.png" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="mylib/img/baner1.png" class="d-block w-100" alt="...">
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>

                </div>
            </div>
        </section>

        <section class="product py-3">
            <div class="container">
                <div class="p1">
                    BIRD

                </div>

                <div class="p2 mb-3">
                    <div class="row py-3">    
                        <%
                            ArrayList<Bird> list2 = (ArrayList<Bird>) request.getAttribute("myBirdList");
                            if (list2 != null && !list2.isEmpty()) {
                                for (Bird b : list2) {
                                    float vote = BirdDAO.getBirdVote(b.getBird_id());
                        %> 

                        <div class="col py-3">                       
                            <div class="card" style="width: 15rem;">
                                <img src="<%= BirdDAO.getBirdImg(b.getBird_id()).get(0) %>" class="card-img-top2" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title"><%= b.getBird_name()%></h5>

                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item" style="color: red"><%= b.getPrice()%> USD</li>
                                    <li class="list-group-item"><%= BirdDAO.getBirdAddress(b.getBird_id()) %></li>
                                        <%
                                            if (vote > 0) {
                                        %>
                                    <li class="list-group-item"><a style="color: red"><%= vote%> Star</a><a>, đã mua <%= BirdDAO.getBirdBuying(b.getBird_id())%></a></li>
                                        <%
                                        } else {
                                        %> 
                                    <li class="list-group-item">đã mua <%= BirdDAO.getBirdBuying(b.getBird_id())%></li>
                                        <%
                                            }
                                        %>
                                </ul>
                                <div class="card-body" style="background-color: rgba(1, 122, 71, 1)">
                                    <a href="#" class="card-link" style="color: white" >Add to cart</a>                                      
                                </div>
                            </div>
                        </div>          
                        <%                }
                            }
                        %>  

                    </div>
                </div>

            </div>
        </section>

        <section class="product py-3">
            <div class="container">
                <div class="p1">
                    ACCESSORIES FOR BIRD
                </div>
                <div class="p2 mb-3">
                    <div class="row py-3">
                        <%
                            ArrayList<Accessory> list3 = (ArrayList<Accessory>) request.getAttribute("myAccessoryList");
                            if (list2 != null && !list2.isEmpty()) {
                                for (Accessory a : list3) {
                                    float vote = AccessoryDAO.getAccessoryVote(a.getAccessory_id());
                        %> 
                        <div class="col py-3">
                            <div class="card" style="width: 15rem;">
                                <img src="<%= AccessoryDAO.getAccessoryImg(a.getAccessory_id()).get(0) %>" class="card-img-top2" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title"><%= a.getName() %></h5>

                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item" style="color: red"><%= a.getPrice() %> USD</li>
                                    <li class="list-group-item"><%= AccessoryDAO.getBirdAddress(a.getAccessory_id()) %></li>
                                <%
                                            if (vote > 0) {
                                        %>    
                                    <li class="list-group-item"><a style="color: red"><%= vote %> Star</a><a>, đã mua <%= AccessoryDAO.getAccessoryBuying(a.getAccessory_id()) %></a></li>
                                <%
                                        } else {
                                        %>   
                                <li class="list-group-item">đã mua <%= AccessoryDAO.getAccessoryBuying(a.getAccessory_id()) %></li>
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
        </section>

        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
