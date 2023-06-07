<%@ page import="dao.AccessoryDAO" %>
<%@ page import="dao.BirdDAO" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Birdee</title>
        <style>
            .hidden {
                display: none;
            }
        </style>
        <link rel="stylesheet" href="style.css" type="text/css"/>
    </head>
    <body>
        <header>
            <%@ include file="header.jsp" %>
        </header>

        <section class="top py-3 ${not empty requestScope.BirdList ? '' : 'hidden'}">
            <div class="container mb-3">
                <h1 class="top1">BIRD</h1>
                <div class="my-3">
                    <div class="container text-center">
                        <div class="row">
                            <c:if test="${not empty requestScope.BirdList}">
                                <c:forEach var="BL" items="${requestScope.BirdList}">
                                    <div class="col">
                                        <div class="card" style="width: 18rem;">
                                            <form action="MainController" method="post">
                                                <c:set var="imageUrls" value="${BirdDAO.getBirdImg(BL.getBird_id())}" />
                                                <c:set var="isMainImages" value="${BirdDAO.getBird_Isimg(BL.getBird_id())}" />
                                                <c:set var="mainImageUrl" value="" />

                                                <c:forEach var="url" items="${imageUrls}" varStatus="loop">
                                                    <c:if test="${isMainImages[loop.index] == 1}">
                                                        <c:set var="mainImageUrl" value="${url}" />
                                                    </c:if>
                                                </c:forEach>

                                                <a href="MainController?action=viewBirdDetail&birdId=${BL.getBird_id()}"><img class="card-img-top" alt="..." src="${mainImageUrl}"></a>
                                                
                                                <div class="card-body">
                                                    <a style="text-decoration: none; color: #000000 " href="MainController?action=viewBirdDetail&birdId=${BL.getBird_id()}"><h5>${BL.getBird_name()}</h5></a>
                                                </div>
                                                <ul class="list-group list-group-flush">
                                                    <li class="list-group-item" style="color: red">${BL.getPrice()} USD</li>
                                                    <li class="list-group-item">${BirdDAO.getBirdAddress(BL.getBird_id())}</li>
                                                        <c:set var="vote" value="${BirdDAO.getBirdVote(BL.getBird_id())}" />
                                                    <li class="list-group-item">
                                                        <c:if test="${vote > 0}">
                                                            <a style="color: red">${vote} Star</a><a>, đã mua ${BirdDAO.getBirdBuying(BL.getBird_id())}</a>
                                                        </c:if>
                                                        <c:if test="${vote <= 0}">
                                                            đã mua ${BirdDAO.getBirdBuying(BL.getBird_id())}
                                                        </c:if>
                                                    </li>
                                                </ul>
                                                <div class="card-body" style="background-color: rgba(1, 122, 71, 1)">
                                                    <a href="#" class="card-link" style="color: white">Add to cart</a>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <section class="top py-3 ${not empty requestScope.AccessoryList ? '' : 'hidden'}">
            <div class="container mb-3">
                <h1 class="top1">ACCESSORY</h1>
                <div class="my-3">
                    <div class="container text-center">
                        <div class="row">
                            <c:if test="${not empty requestScope.AccessoryList}">
                                <c:forEach var="AL" items="${requestScope.AccessoryList}">
                                    <div class="col">
                                        <div class="card" style="width: 18rem;">
                                            <form action="MainController" method="post">
                                                <c:set var="imageUrls" value="${AccessoryDAO.getAccessoryImg(AL.getAccessory_id())}" />
                                                <c:set var="isMainImages" value="${AccessoryDAO.getAccessory_Isimg(AL.getAccessory_id())}" />
                                                <c:set var="mainImageUrl" value="" />

                                                <c:forEach var="url" items="${imageUrls}" varStatus="loop">
                                                    <c:if test="${isMainImages[loop.index] == 1}">
                                                        <c:set var="mainImageUrl" value="${url}" />
                                                    </c:if>
                                                </c:forEach>

                                                <img class="card-img-top" alt="..." src="${mainImageUrl}">
                                                <div class="card-body">
                                                    <h5>${AL.getName()}</h5>
                                                </div>
                                                <ul class="list-group list-group-flush">
                                                    <li class="list-group-item" style="color: red">${AL.getPrice()} USD</li>
                                                    <li class="list-group-item" style="color: red">${AccessoryDAO.getAccessoryAddress(AL.getAccessory_id())}</li>
                                                        <c:set var="vote" value="${AccessoryDAO.getAccessoryVote(AL.getAccessory_id())}" />
                                                    <li class="list-group-item">
                                                        <c:if test="${vote > 0}">
                                                            <a style="color: red">${vote} Star</a><a>, đã mua ${AccessoryDAO.getAccessoryBuying(AL.getAccessory_id())}</a>
                                                        </c:if>
                                                        <c:if test="${vote <= 0}">
                                                            đã mua ${AccessoryDAO.getAccessoryBuying(AL.getAccessory_id())}
                                                        </c:if>
                                                    </li>
                                                </ul>
                                                <div class="card-body" style="background-color: rgba(1, 122, 71, 1)">
                                                    <a href="#" class="card-link" style="color: white">Add to cart</a>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <h3 class="top1" style="color: red"><c:out value="${requestScope.ERROR}" default=""/></h3>

        <footer>
            <%@ include file="footer.jsp" %>
        </footer>
    </body>
</html>
