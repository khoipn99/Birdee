@@ -0,0 +1,116 @@
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Order Detail</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }

            h1 {
                color: #2e6da4;
                font-size: 2.25rem;
                margin-bottom: 24px;
                text-align: center;
            }

            h3 {
                color: #333;
                font-size: 1.5rem;
                margin-top: 48px;
                margin-bottom: 24px;
            }

            table {
                border-collapse: collapse;
                margin-left: auto;
                margin-right: auto;
                width: 100%;
            }

            th {
                background-color: #2e6da4;
                color: #fff;
                font-weight: bold;
                padding: 12px;
                text-align: left;
            }

            td {
                border: 1px solid #ddd;
                padding: 12px;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            a {
                color: #2e6da4;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <h1>View Order ${requestScope.oid} Detail</h1>
        <div style="text-align: center;">
            <a href="viewCusInfor.jsp">&larr; Back to Customer Information</a>
        </div>

        <c:set var="Blist" value="${requestScope.Blist}"/>
        <c:if test="${Blist!=null}">
            <h3>Birds</h3>
            <table>
                <thead>
                    <tr>
                        <th>Order Detail ID</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Bird ID</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="OB" items="${Blist}">
                        <tr>
                            <td>${OB.order_detail_id_B}</td>
                            <td>${OB.quantity}</td>
                            <td>${OB.price}</td>
                            <td>${OB.bird_id}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <c:set var="Alist" value="${requestScope.Alist}"/>
        <c:if test="${Alist!=null}">
            <h3>Accessories</h3>
            <table>
                <thead>
                    <tr>
                        <th>Order Detail ID</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Accessory ID</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="OA" items="${Alist}">
                        <tr>
                            <td>${OA.order_detail_id_A}</td>
                            <td>${OA.quantity}</td>
                            <td>${OA.order_price}</td>
                            <td>${OA.accessory_id}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </body>
</html>