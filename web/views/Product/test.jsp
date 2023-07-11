<%-- 
    Document   : test
    Created on : Jul 5, 2023, 7:48:55 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="targetDiv">
            <!-- Existing content in the target div -->
        </div>

        <div id="sourceDiv" style="display: none">
            <input type="text" value="0" id="productID" name="productID">
            <img class="img_item_in_cart"
                 src="https://bizweb.dktcdn.net/thumb/compact/100/450/808/products/cfa1d6c5-ffa0-4fcd-8349-51e83792254e.jpg"
                 alt="Bé lừa bông Winnie">
            <p id="name">Original Div</p>
        </div>

        <button onclick="createNewDiv()">Create New Div</button>

        <script>
            function createNewDiv() {
                var targetDiv = document.getElementById('targetDiv');
                var sourceDiv = document.getElementById('sourceDiv');

                // Show the sourceDiv before cloning
                sourceDiv.style.display = 'block';

                // Clone the sourceDiv
                var newDiv = sourceDiv.cloneNode(true);

                // Hide the sourceDiv again
                sourceDiv.style.display = 'none';

                // Generate a new id by incrementing the existing id
                var currentProductId = parseInt(newDiv.querySelector('#productID').value);
                var newProductId = currentProductId + 1;
                newDiv.querySelector('#productID').value = newProductId;

                // Change the src attribute of the <img> tag
                newDiv.querySelector('.img_item_in_cart').src = 'new_image_url';

                // Change the content of the <p> tag with id = "name"
                newDiv.querySelector('#name').innerHTML = 'New Div';

                // Change the id of the newDiv
                var newDivId = 'newDiv' + newProductId;
                newDiv.id = newDivId;


                // Append the newDiv to the targetDiv
                targetDiv.appendChild(newDiv);

                // Get the value of the productID input
                var productIDValue = newDiv.querySelector('#productID').value;

                // Get the existing value of the "cart" cookie or an empty string if it doesn't exist
                var cartValue = getCookie('cart') || '';

                // Concatenate the productIDValue with the existing cartValue
                var newCartValue = cartValue + productIDValue;

                // Set the "cart" cookie with the new value
                document.cookie = 'cart=' + newCartValue;
            }

            function getCookie(cookieName) {
                var name = cookieName + '=';
                var decodedCookie = decodeURIComponent(document.cookie);
                var cookieArray = decodedCookie.split(';');
                for (var i = 0; i < cookieArray.length; i++) {
                    var cookie = cookieArray[i].trim();
                    if (cookie.indexOf(name) === 0) {
                        return cookie.substring(name.length, cookie.length);
                    }
                }
                return '';
            }
        </script>
    </body>
</html>
