

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>P E T M A L L</title>
<style>

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jspf" %>


<div class="page-wrapper">
    <div class="cart shopping">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="block">
                        <div class="product-list">
                            <form method="post">
                                <table class="table">
                                <thead>
                                    <tr>
                                        <th class="">Item Name</th>
                                        <th class="">Item Price</th>
                                        <th class="">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <tr class="">
                                    <td class="">
                                        <div class="product-info">
                                            <img width="80" src="images/shop/cart/cart-1.jpg" alt="" />
                                            <a href="#!">Sunglass</a>
                                        </div>
                                    </td>
                                    <td class="">$200.00</td>
                                    <td class="">
                                        <a class="product-remove" href="#!">Remove</a>
                                    </td>
                                </tr>
                                <tr class="">
                                    <td class="">
                                    <div class="product-info">
                                    <img width="80" src="images/shop/cart/cart-2.jpg" alt="" />
                                    <a href="#!">Airspace</a>
                                    </div>
                                    </td>
                                    <td class="">$200.00</td>
                                    <td class="">
                                    <a class="product-remove" href="#!">Remove</a>
                                    </td>
                                </tr>
                                <tr class="">
                                <td class="">
                                <div class="product-info">
                                <img width="80" src="images/shop/cart/cart-3.jpg" alt="" />
                                <a href="#!">Bingo</a>
                                </div>
                                </td>
                                <td class="">$200.00</td>
                                <td class="">
                                <a class="product-remove" href="#!">Remove</a>
                                </td>
                                </tr>
                                </tbody>
                                </table>
                                <a href="checkout.html" class="btn btn-main pull-right">Checkout</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<%@ include file="/WEB-INF/views/include/footer.jspf" %>

<script>
    //alert("js test 00");

    function comingSoon() {
        alert("업데이트 예정입니다.");
    }


</script>

</body>
</html>

