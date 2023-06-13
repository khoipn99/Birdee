<%-- 
    Document   : accessoryDetail
    Created on : Jun 7, 2023, 1:10:39 PM
    Author     : vudin
--%>
<%@page import="dao.ReviewDAO"%>
<%@page import="dto.Review_Accessory"%>
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
    <header>
        <%@include file="header.jsp" %>
    </header>
</head>
<body>

    <section>
        <div class="container">
            <div class="backgroundDetail">
                <div class="row py-3">
                    <div class="col">


                        <%

                            ArrayList<Accessory> list = (ArrayList<Accessory>) request.getAttribute("accessoryListDetail");
                            if (list != null && !list.isEmpty()) {
                                for (Accessory a : list) {
                                
                        %> 
                        <div>             
                            <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel" style="height: 500px; width: 500px">
                                <div class="carousel-inner">
                                    <%                            int flag = 0;
                                        ArrayList<String> imgList = AccessoryDAO.getAccessoryImg(a.getAccessory_id());
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
                            <h2><%= a.getName()%></h2>                            
                            <h5><a style="color: red"><%= AccessoryDAO.getAccessoryVote(a.getAccessory_id())%> Star | </a><a><%= AccessoryDAO.getAccessoryBuying(a.getAccessory_id())%> Ðã bán</a></h5>
                            <h5 style="color: red"><%= a.getPrice()%>00 VND</h5>
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

                            <h5>Số lượng  1  |  <%= a.getQuantity()%> sản phẩm có sẵn</h5>
                            <br>
                            <h5><a style="color: green; background-color: greenyellow; padding: 5px">Thêm vào giỏ hàng </a><a>  </a><a style="color: white; background-color: green; padding: 5px">mua ngay</a></h5>


                        </ul>
                    </div>                    


                </div>
            </div>
            <br>

            <div class="backgroundDetail">
                <div class="form-detail">
                    <h5>Thông tin Shop</h5>               
                </div> 

            </div>    
            <br>
            <div class="backgroundDetail">
                <div class="form-detail"><h5>CHI TIẾT SẢN PHẨM</h5></div>    
                <br>
                <div>
                    <div class="row">
                        <div class="col-md-2" >
                            <ul>
                                <h6>Số sản phẩm còn lại:</h6>                              
                                <h6>Gửi từ:</h6>
                            </ul>
                        </div>

                        <div class="col" >
                            <ul>                              
                                <h6><%= a.getQuantity()%></h6>
                                <h6><%= AccessoryDAO.getAccessoryAddress(a.getAccessory_id())%></h6>
                            </ul>
                        </div>

                    </div>    
                </div>
            </div>
            <br>
            <div class="backgroundDetail">
                <div class="form-detail"><h5>MÔ TẢ SẢN PHẨM</h5></div> 

                <br>
                <h6><%= a.getDescription()%></h6>
                <br>
            </div>         
            <br>        
            <div class="backgroundDetail">
                <div class="form-detail" style=""><h5>ĐÁNH GIÁ SẢN PHẨM</h5></div>                
                <br>        
                <div style="padding-top: 20px; padding-bottom: 20px; background-color: #fff4f4;">                   
                    <p><h5 style="color: red"><%= AccessoryDAO.getAccessoryVote(a.getAccessory_id()) %> Star trên 5</h5></p>
                </div>
                <br>
                <%

                    ArrayList<Review_Accessory> list2 = (ArrayList<Review_Accessory>) request.getAttribute("accessoryListReview");
                    if (list != null && !list.isEmpty()) {
                        for (Review_Accessory r : list2) {


                %>
                <div style="border-bottom: 1px; border-top: 0px; border-right: 0px; border-left: 0px;border-style: solid;">

                    <div><%= ReviewDAO.getReviewerAccessoryName(r.getEmail_customer()) %></div>
                    <div style="color: red"><%= r.getRating()%> Star</div>
                    <div><%= ReviewDAO.getReviewAccessoryDate(r.getOrder_detail_id_A()) %></div>
                    <br>
                    <div><%= r.getComment()%></div>                   
                    <div>
                        <%
                            ArrayList<String> img = ReviewDAO.getReviewAccessoryImg(r.getOrder_detail_id_A());
                            for (String elem : img) {
                                    
                                
                            %>
                            
                        <img src="<%= elem %>" style="width: 10%; height: 130px;">
                        
                        <%
                            }
                            %>
                    </div>
                    <br>
                </div> 
                <br>
                <%
                        }
                    }
                %>
                
                <br>    
            </div>
            <%
                    }
                }
            %>
         <br>   
        </div>

    </section>

    <footer>
        <%@include file="footer.jsp" %>
    </footer>
</body>
</html>


