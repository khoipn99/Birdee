<%-- 
    Document   : categoryDetail
    Created on : Jun 7, 2023, 1:02:15 PM
    Author     : vudin
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
        <header>
            <%@include file="header.jsp" %>
        </header>
    </head>
    <body>

        <section>
            <div class="container">
                <div class="row">
                    <div class="col">


                        <%

                            ArrayList<Bird> list = (ArrayList<Bird>) request.getAttribute("birdListDetail");
                            if (list != null && !list.isEmpty()) {
                                for (Bird b : list) {

                        %> 
                        <div>             
                            <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel" style="height: 500px; width: 500px">
                                <div class="carousel-inner">
                                    <%                            int flag = 0;
                                        ArrayList<String> imgList = BirdDAO.getBirdImg(b.getBird_id());
                                        for (String i : imgList) {
                                            flag += 1;
                                            if (flag == 1) {
                                    %>
                                    <div class="carousel-item active" >
                                        <img src="<%= i%>" class="d-block w-100" alt="..." width="500px" height="500px">
                                    </div>
                                    <%
                                    } else {
                                    %>
                                    <div class="carousel-item">
                                        <img src="<%= i%>" class="d-block w-100" alt="..." width="500px" height="500px">
                                    </div>
                                    <%
                                            }
                                        }
                                    %>

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
                    <div class="col">



                        <ul>
                            <h2><%= b.getBird_name()%></h2>                            
                            <h5><a style="color: red"><%= BirdDAO.getBirdVote(b.getBird_id())%> Star | </a><a><%= BirdDAO.getBirdBuying(b.getBird_id())%> Ðã bán</a></h5>
                            <h5 style="color: red"><%= b.getPrice()%>00 VND</h5>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>

                            <h5>Số lượng  1  |  <%= b.getQuantity()%> sản phẩm có sẵn</h5>
                            <br>
                            <h5><a style="color: green; background-color: greenyellow; padding: 5px">Thêm vào giỏ hàng </a><a>  </a><a style="color: white; background-color: green; padding: 5px">mua ngay</a></h5>


                        </ul>
                    </div>                    
                    <%
                            }
                        }
                    %>
                </div>
                <br>
                <h5>Thông tin Shop</h5>    
                <br>
                <h5>CHI TIẾT SẢN PHẨM</h5>  
                <br>
                <div>
                    <div class="row">
                        <div class="col" >
                            <ul>
                                <h6>Ngày Sinh:</h6>
                                <h6>Giới tính:</h6>
                                <h6>Chiều cao:</h6>
                                <h6>Cân nặng:</h6>
                                <h6>Xuất xứ:</h6>
                                <h6>Số chim còn lại:</h6>
                                <h6>Gửi từ:</h6>
                            </ul>
                        </div>
                        <%
                            ArrayList<Bird> list2 = (ArrayList<Bird>) request.getAttribute("birdListDetail");
                            if (list != null && !list.isEmpty()) {
                                for (Bird b : list) {

                        %> 
                        <div class="col" >
                            <ul>
                                <h6><%= b.getDob().toString()%></h6>
                                <%if (b.isGender()) {
                                %>                                       
                                <h6>Giống cái</h6>
                                <%
                                } else {
                                %>
                                <h6>Giống đực</h6>
                                <%
                                    };
                                %>
                                <h6><%= b.getHeight()%> cm</h6>
                                <h6><%= b.getWeight()%> gam</h6>
                                <h6><%= b.getOrigin()%></h6>
                                <h6><%= b.getQuantity()%> con</h6>
                                <h6><%= BirdDAO.getBirdAddress(b.getBird_id())%></h6>
                            </ul>
                        </div>

                    </div>    
                </div>
                <br>
                <h5>MÔ TẢ SẢN PHẨM</h5>     
                <br>
                <h6><%= b.getDescription()%></h6> 

                <%
                        }
                    }
                %>
                <br>        
                <br>   
                <h5>ĐÁNH GIÁ SẢN PHẨM</h5>
                <br>        
                <br>


            </div>

        </section>

        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>


