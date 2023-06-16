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
        <script src="mylib/bt5/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="style.css" type="text/css"/>
    
    </head>
    <body>
        <header class="head123">
            <%@include file="header.jsp" %>
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

                <div class="body1 py-3">KHÁM PHÁ 

                </div>
                <div class="body2 py-3">
                    <div class="cate ">
                        <div class="row ">
                            <div class="col-md-3">
                                <a href="LoadByCate?cateID=1"><img src="mylib/img/chim.png" alt=""></a><br>
                                <a href="LoadByCate?cateID=1">Chim cảnh</a>
                            </div>
                            <div class="col-md-3">
                                <a href="LoadByCate?cateID=2"><img src="mylib/img/thucan.png" alt=""></a><br>
                                <a href="LoadByCate?cateID=2">Thức ăn cho chim</a>

                            </div>
                            <div class="col-md-3">
                                <a href="LoadByCate?cateID=3"><img src="mylib/img/mangan.png" alt=""></a><br>
                                <a href="LoadByCate?cateID=3">Máng ăn, cóng</a>
                            </div>
                            <div class="col-md-3">
                                <a href="LoadByCate?cateID=4"><img src="mylib/img/long.png" alt=""></a><br>
                                <a href="LoadByCate?cateID=4">Lồng chim</a>
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
                                int flag = 0;
                                ArrayList<Bird> list = (ArrayList<Bird>) request.getAttribute("myBirdList");
                                if (list != null && !list.isEmpty()) {
                                    for (Bird b : list) {
                                        
                                        flag += 1;
                                        if(flag < 5){
                            %>

                            <div class="col">
                                <div class="card" style="width: 18rem; height: 30rem;">
                                    <a href="MainController?action=viewBirdDetail&birdId=<%= b.getBird_id() %>"><img src="<%= BirdDAO.getMainBirdImg(b.getBird_id()) %>" class="card-img-top" alt="..."></a>
                                    
                                    <div class="card-body">

                                        <a style="text-decoration: none; color: #000000 " href="MainController?action=viewBirdDetail&birdId=<%= b.getBird_id() %>"><h5 class="card-title"><%= b.getBird_name()%></h5></a>

                                    </div>
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item" style="color: red"><%= b.getPrice()%>00 VND</li>
                                        <li class="list-group-item"><%= BirdDAO.getBirdAddress(b.getBird_id()) %></li>
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
                                        } else if (vote > 0 && vote < 1.5){
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
                                            } else if (vote >= 1.5 && vote < 2.5){
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
                                            } else if (vote >= 2.5 && vote < 3.5){
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
                                            } else if (vote >= 3.5 && vote < 4.5){
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
                                            } else if (vote >= 4.5 && vote <= 5){
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
                                        <a href="MainController?action=AddToCart&birdID=<%= b.getBird_id() %>&cateID=<%= b.getCate_id() %>" class="card-link" style="color: white" >Add to cart</a>
                                    </div>
                                </div>
                            </div>
                            <%                } else break;
                                    }
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
                                    
                        %> 

                        <div class="col py-3">                       
                            <div class="card text-center" style="width: 15rem; height: 25rem; text-decoration: none;">
                                <a href="MainController?action=viewBirdDetail&birdId=<%= b.getBird_id() %>"><img src="<%= BirdDAO.getMainBirdImg(b.getBird_id()) %>" class="card-img-top2" alt="..."></a>
                                <div class="card-body">
                                    <a style="text-decoration: none; color: #000000 " href="MainController?action=viewBirdDetail&birdId=<%= b.getBird_id() %>"><h5 class="card-title"><%= b.getBird_name()%></h5></a>

                                </div>
                                <div class="card-text">
                                    <p class="" style="color: red"><%= b.getPrice()%>00 VND</p>
                                    <p class=""><%= BirdDAO.getBirdAddress(b.getBird_id()) %></p>
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
                                        } else if (vote > 0 && vote < 1.5){
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
                                            } else if (vote >= 1.5 && vote < 2.5){
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
                                            } else if (vote >= 2.5 && vote < 3.5){
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
                                            } else if (vote >= 3.5 && vote < 4.5){
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
                                            } else if (vote >= 4.5 && vote <= 5){
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
                                </div>
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
                                    
                        %> 
                        <div class="col py-3">
                            <div class="card" style="width: 15rem;">
                                <a href="MainController?action=viewAccessoryDetail&accessorydId=<%= a.getAccessory_id() %>"><img src="<%= AccessoryDAO.getMainAccessoryImg(a.getAccessory_id()) %>" class="card-img-top2" alt="..."></a>
                                <div class="card-body">
                                    <a style="text-decoration: none; color: #000000 " href="MainController?action=viewAccessoryDetail&accessorydId=<%= a.getAccessory_id() %>"><h5 class="card-title"><%= a.getName() %></h5></a>

                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item" style="color: red"><%= a.getPrice() %>00 VND</li>

                                    <li class="list-group-item"><%= AccessoryDAO.getAccessoryAddress(a.getAccessory_id()) %></li>
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
                                        </a><a>, đã mua <%= AccessoryDAO.getAccessoryBuying(a.getAccessory_id()) %></a></li>
                                        <%
                                        } else if (vote > 0 && vote < 1.5){
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
                                            } else if (vote >= 1.5 && vote < 2.5){
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
                                            } else if (vote >= 2.5 && vote < 3.5){
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
                                            } else if (vote >= 3.5 && vote < 4.5){
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
                                            } else if (vote >= 4.5 && vote <= 5){
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
        </section>

        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
