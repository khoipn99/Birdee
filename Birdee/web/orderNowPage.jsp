<%-- 
    Document   : orderPage
    Created on : Jun 15, 2023, 1:42:22 PM
    Author     : vudin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dao.BirdDAO"%>
<%@page import="dto.Bird"%>
<%@page import="dao.AccountDAO"%>
<%@page import="dto.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <div class="py-5 text-center">
                <i class="fa fa-credit-card fa-4x" aria-hidden="true"></i>
                <h2>Thanh toán</h2>
                <p class="lead">Vui lòng kiểm tra thông tin Khách hàng, thông tin Giỏ hàng trước khi Đặt hàng.</p>
            </div>
        </div>
    </section>
    <br/>
    <section>
        <div class="container">
            <div class="row ">              
                <div class="col-md-8 order-md-1">
                    <h4 class="mb-3">Thông tin khách hàng</h4>
                    <%
                        Account acc = new Account("Phat@gmail.com", "", "phát vu", "", "Hai phòng", "0931526731");

                        //acc = (Account)request.getAttribute("customerInformation");

                    %>
                    <div class="row">                      
                        <div class="col-md-12">
                            <label for="kh_ten">Họ tên</label>
                            <input type="text" class="form-control" name="kh_ten" id="kh_ten"
                                   value="<%= acc.getUsername()%>">
                        </div>

                        <div class="col-md-12">
                            <label for="kh_diachi">Địa chỉ</label>
                            <input type="text" class="form-control" name="kh_diachi" id="kh_diachi"
                                   value="<%= acc.getEmail()%>" >
                        </div>
                        <div class="col-md-12">
                            <label for="kh_dienthoai">Điện thoại</label>
                            <input type="text" class="form-control" name="kh_dienthoai" id="kh_dienthoai"
                                   value="<%= acc.getPhone()%>" >
                        </div>
                        <div class="col-md-12">
                            <label for="kh_email">Email</label>
                            <input type="text" class="form-control" name="kh_email" id="kh_email"
                                   value="<%= acc.getEmail()%>" >
                        </div>                       


                        <h4 class="mb-3">Hình thức thanh toán</h4>

                        <div class="d-block my-3">
                            <div class="custom-control custom-radio">
                                <input id="httt-1" name="httt_ma" type="radio" class="custom-control-input" required=""
                                       value="1">
                                <label class="custom-control-label" for="httt-1">Tiền mặt</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input id="httt-2" name="httt_ma" type="radio" class="custom-control-input" required=""
                                       value="2">
                                <label class="custom-control-label" for="httt-2">Chuyển khoản</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input id="httt-3" name="httt_ma" type="radio" class="custom-control-input" required=""
                                       value="3">
                                <label class="custom-control-label" for="httt-3">Ship COD</label>
                            </div>
                        </div>
                        <hr class="mb-4">
                        <button class="btn btn-primary btn-lg btn-block" type="submit" name="btnDatHang" style="background-color: green">Đặt
                            hàng</button>

                    </div>
                    <br>
                </div>
                <%
                    int Quantity = 1;
                    int BirdId = Integer.parseInt(request.getParameter("birdIdForOrderNow"));
                    ArrayList<Bird> bird = BirdDAO.getBirdById(BirdId);
                    for (Bird b : bird) {
                %>
                <div class="col-md-4 order-md-2 mb-4">
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-muted">Giỏ hàng</span>
                        <span class="badge badge-secondary badge-pill">2</span>
                    </h4>
                    <ul class="list-group mb-3">  

                        <li class="list-group-item d-flex justify-content-between lh-condensed">
                            <div>
                                <form action="mainController" method="post">
                                    <h6 class="my-0"><%= b.getBird_name()%></h6>
                                    <%
                                        if (request.getParameter("SaveQuantity") == "" && request.getParameter("SaveQuantity") == null) {
                                    %>
                                    <small class="text-muted"><%= b.getPrice()%>00 VND x <input type="text" class="form-control" name="SaveQuantity" id="ProductNumber"
                                                                                                value="<%= Quantity%>" ></small>        
                                        <%
                                        } else {
                                            String tmp = request.getParameter("SaveQuantity");
                                            
                                        %>
                                    <small class="text-muted"><%= b.getPrice()%>00 VND x <input type="text" class="form-control" name="SaveQuantity" id="ProductNumber"
                                                                                                value="<%= Quantity%>" ></small>
                                        <%
                                            }
                                        %>                                                            
                                    <input type="submit" value="save" name="action">
                                </form>
                            </div>                          
                            <span class="text-muted" id="total"></span>
                        </li>                         


                        <li class="list-group-item d-flex justify-content-between">
                            <span>Tổng thành tiền</span>
                            <strong>143520000</strong>
                        </li>
                    </ul>


                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Mã khuyến mãi">
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-secondary">Xác nhận</button>
                        </div>
                    </div>

                </div>

                <%
                    }
                %>
            </div>
        </div>
    </section>    



    <!-- footer -->
    <footer>
        <%@include file="footer.jsp" %>
    </footer>
</body>
</html>
