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

        <section class="top py-3 ${not empty requestScope.BirdList ? '' : 'hidden'}" >
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
                                                <c:forEach var="url" items="${BirdDAO.getBirdImg(BL.getBird_id())}">
                                                    <img class="card-img-top" alt="..." src="${url}">
                                                </c:forEach>
                                                <div class="card-body">
                                                    <h5>${BL.getBird_name()}</h5>
                                                </div>
                                                <ul class="list-group list-group-flush">
                                                    <li class="list-group-item" style="color: red">${BL.getPrice()} USD</li>
                                                    <li class="list-group-item">${BirdDAO.getBirdAddress(BL.getBird_id())}</li>
                                                        <c:set var="vote" value="${BirdDAO.getBirdVote(BL.bird_id)}" />
                                                    <li class="list-group-item">
                                                        <c:if test="${vote > 0}">
                                                            <a style="color: red">${vote} Star</a><a>, đã mua ${BirdDAO.getBirdBuying(BL.bird_id)}</a>
                                                        </c:if>
                                                        <c:if test="${vote <= 0}">
                                                            đã mua ${BirdDAO.getBirdBuying(b.bird_id)}
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
                                                <c:forEach var="url" items="${AccessoryDAO.getAccessoryImg(AL.getAccessory_id()).get(0)}">
                                                    <img class="card-img-top" alt="..." src="${url}">
                                                </c:forEach>
                                                <div class="card-body">
                                                    <h5>${AL.getName()}</h5>
                                                </div>
                                                <ul>
                                                    <li class="list-group-item" style="color: red">${AL.getPrice()} USD</li>
                                                    <li class="list-group-item" style="color: red">${AccessoryDAO.getAccessoryAddress(AL.getAccessory_id())}</li>
                                                        <c:set var="vote" value="${AccessoryDAO.getAccessoryVote(AL.accessory_id)}" />
                                                    <li class="list-group-item">
                                                        <c:if test="${vote > 0}">
                                                            <a style="color: red">${vote} Star</a><a>, đã mua ${AccessoryDAO.getAccessoryBuying(AL.accessory_id)}</a>
                                                        </c:if>
                                                        <c:if test="${vote <= 0}">
                                                            đã mua ${AccessoryDAO.getAccessoryBuying(AL.accessory_id)}
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
