<%-- 
    Document   : displayByCate
    Created on : Jun 9, 2023, 11:00:48 PM
    Author     : ACE
--%>

<%@page import="dao.BirdDAO"%>
<%@page import="dao.AccessoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Birdee</title>
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <script src="mylib/bt5/bootstrap-5.0.2-dist/js/popper.min.js"></script>
        <script src="mylib/bt5/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
        <script src="mylib/bt5/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>       
    </head>
    <body>
        <header>
            <%@ include file="header.jsp" %>
        </header>
            <c:set var="cateID" value="${requestScope.cateID}"/>
            <c:set var="list" value="${requestScope.listByCate}"/>
            <c:set var="cateName" value="${cateName}" />                       
 
            <section class="top py-3">
            <div class="container mb-3">
                <div class="top1">
                ${cateName}
                </div>
                <div class="my-3">
                    <div class="container text-center">
                        <div class="row">
                            <c:if test="${list != null}">
                                <c:if test="${cateID == 1}">  <!-- BIRD -->
                                    <div><h5>Kết quả tìm được: ${list.size()}</h5></div>
                                    <c:forEach var="b" items="${list}">
                                        <c:set var="vote" value="${BirdDAO.getBirdVote(b.getBird_id())}"/>
                                        <div class="col py-3">
                                            <div class="card" style="width: 18rem;">
                                                <a href="MainController?action=viewBirdDetail&birdId=${b.getBird_id()}"><img src="${BirdDAO.getBirdImg(b.getBird_id()).get(0)}" class="card-img-top" alt="..."></a>
                                                <div class="card-body">
                                                    <a style="text-decoration: none; color: #000000 " href="MainController?action=viewBirdDetail&birdId=${b.getBird_id()}"><h5 class="card-title"> ${b.getBird_name()}</h5></a>
                                                </div>
                                                <ul class="list-group list-group-flush">
                                                    <li class="list-group-item" style="color: red">${b.getPrice()}00 VND</li>
                                                    <li class="list-group-item" style="height: 5rem;">${BirdDAO.getBirdAddress(b.getBird_id())}</li>
                                                    <c:if test="${vote > 0}">
                                                        <li class="list-group-item"><a style="color: red">${vote} Star</a><a>, đã mua ${BirdDAO.getBirdBuying(b.getBird_id())}</a></li>
                                                    </c:if>
                                                    <c:if test="${vote <= 0}">
                                                        <li class="list-group-item">đã mua ${BirdDAO.getBirdBuying(b.getBird_id())} </li>
                                                    </c:if>                                                        

                                                </ul>
                                                <div class="card-body" style="background-color: rgba(1, 122, 71, 1)">                                      
                                                    <a href="#" class="card-link" style="color: white" >Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                                
                                <c:if test="${cateID != 1}"> <!-- ACCESSORY -->
                                    <div><h5>Kết quả tìm được: ${list.size()}</h5></div>
                                    <c:forEach var="a" items="${list}">
                                        
                                        <c:set var="vote" value="${AccessoryDAO.getAccessoryVote(a.getAccessory_id())}"/>
                                        <div class="col">
                                            <div class="card" style="width: 18rem;">
                                                <a href="MainController?action=viewAccessoryDetail&accessorydId=${a.getAccessory_id()}"><img src="${AccessoryDAO.getAccessoryImg(a.getAccessory_id()).get(0)}" class="card-img-top" alt="..."></a>
                                                <div class="card-body">
                                                    <a style="text-decoration: none; color: #000000 " href="MainController?action=viewAccessoryDetail&accessorydId=${a.getAccessory_id()}"><h5 class="card-title"> ${a.getName()}</h5></a>
                                                </div>
                                                <ul class="list-group list-group-flush">
                                                    <li class="list-group-item" style="color: red">${a.getPrice()}00 VND</li>
                                                    <li class="list-group-item">${AccessoryDAO.getAccessoryAddress(a.getAccessory_id())}</li>
                                                    <c:if test="${vote > 0}">
                                                        <li class="list-group-item"><a style="color: red">${vote} Star</a><a>, đã mua ${AccessoryDAO.getAccessoryBuying(a.getAccessory_id())}</a></li>
                                                    </c:if>
                                                    <c:if test="${vote <= 0}">
                                                        <li class="list-group-item">đã mua ${AccessoryDAO.getAccessoryBuying(a.getAccessory_id())} </li>
                                                    </c:if>                                                        

                                                </ul>
                                                <div class="card-body" style="background-color: rgba(1, 122, 71, 1)">                                      
                                                    <a href="#" class="card-link" style="color: white" >Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>

                            </c:if>                                        


                        </div>
                    </div>
                </div>
            </div>
        </section>
                            
    </body>
</html>
