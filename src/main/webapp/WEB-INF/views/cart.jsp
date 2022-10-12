<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>P E T M A L L</title>
<style>
.cart-title {
    margin: 30px;
}
.full-price {
    font-size: 26px;
}
.pay-button {
    font-size: 24px;
    height: 40px;
    width: 130px;
    color: white;
    background-color: Turquoise;
    border: none;
    border-radius: 10px;
}
#inputQuantity {
    width: 90px;
    height: 30px;
}
</style>



</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jspf" %>

<div class="cart-title">
        <h1>🛒장바구니</h1>
</div>

<div class="page-wrapper" style="padding: 0 0 30px 0;">
<hr class="color-hr">
    <div class="cart shopping">
        <div class="container" style="width: 1100px; padding: 10px;">
            <div class="row">
                <div class="col-md-12">
                    <div class="block">
                        <div class="product-list">
                            <table class="table" >
                            <thead>
                                <tr>
                                    <th>상품명</th>
                                    <th>수량</th>
                                    <th>가격</th>
                                    <th></th>
                                </tr>
                            </thead>
                                <tbody>
                                    <c:if test="${empty cartList}">
                                        <tr>
                                            <td>
                                                <h3>장바구니가 비었습니다. 마음에 드는 제품을 담아보세요~!</h3>
                                            </td>
                                        </tr>
                                    </c:if>
                                    <c:forEach var="cart" items="${cartList}">
                                        <tr class="">
                                            <td class="">
                                                <div class="product-info">
                                                    <img width="100" src="${cart.productDTO.thumbnail}" alt="" />
                                                    <a href="/readProduct?productNum=${cart.productNum}"
                                                    style="font-weight: 400;">${cart.productDTO.name}</a>
                                                </div>
                                            </td>
                                            <td>
                                                <input type="text" id="inputQuantity" name="quantity" value="${cart.quantity}" placeholder="수량입력">
                                            </td>
                                            <td><span id="totalPrice">${cart.productDTO.price}</span>원</td>
                                            <td class="">
                                                <a class="product-remove" href="/deleteCart?cartNum=${cart.cartNum}&id=${member.id}">삭제</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <hr class="color-hr"><br>
                            <c:if test="${!empty cartList}">
                                <form method="post" id="buyProductInCart">
                                    <input type="hidden" name="productNum" id="productNum" value="100"> <!-- 장바구니 모든 품번 들어갈 수 있게 수정해야함 -->
                                    <input type="hidden" name="id" value="${member.id}">
                                    <input type="hidden" name="totalPrice" id="totalPrice" value="31500"> <!-- 테스트값 입력 -->
                                    <button type="button" class="pay-button pull-right" onclick="buyProduct();">구매하기</button>
                                </form>
                                <span class="full-price pull-right">총 31,500원 &nbsp;</span>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jspf" %>
<script>
    //alert("js test 05");
    function comingSoon() {
        alert("업데이트 예정입니다.");
    }

    function buyProduct() {
        let buyProductInCart = document.getElementById("buyProductInCart");
        let popTitle = "장바구니 상품 구매하기";
        if(${member == null}) {
            alert("로그인이 필요합니다.");
            return false;
        }
        console.log("창이름 확인 : ", popTitle);
        window.open("", popTitle, "width=375, height=500");
        buyProductInCart.target = popTitle;
        buyProductInCart.action = "/payment";
        buyProductInCart.submit();
    }

</script>
</body>
</html>



