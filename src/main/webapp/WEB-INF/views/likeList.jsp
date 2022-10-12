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
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jspf" %>

<div class="cart-title">
    <h1>❤️찜한 목록</h1>
</div>

<div class="page-wrapper" style="padding: 0 0 30px 0;">
<hr class="color-hr">

    </P>
    <div class="cart shopping">
        <div class="container" style="width: 1100px; padding: 10px;">
            <div class="row">
                <div class="col-md-12">
                    <div class="block">
                        <div class="product-list">
                            <form method="post">
                                <table class="table" >
                                <thead>
                                    <tr>
                                        <th>상품명</th>
                                        <th>가격</th>
                                        <th>찜하기 취소</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${empty likeList}">
                                        <tr class="">
                                            <td class="">
                                               🤍를 누르면 해당 상품을 찜할 수 있습니다. 마음에 드는 상품을 찜해보세요~!
                                            </td>
                                        </tr>
                                    </c:if>
                                    <c:forEach var="like" items="${likeList}" >
                                        <tr class="">
                                            <td class="">
                                                <div class="product-info">
                                                    <img width="150" src="${like.productDTO.thumbnail}" alt="" />
                                                    <a href="/readProduct?productNum=${like.productNum}" style="font-weight: 400;">${like.productDTO.name}</a>
                                                </div>
                                            </td>
                                            <td class="">${like.productDTO.price}원</td>
                                            <td class="">
                                                <a class="product-remove" href="/deleteLike?productNum=${like.productNum}&id=${member.id}">취소</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                </table>
                                <hr class="color-hr"><br>
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

    // 상품수량 select 태그에서 직접입력으로 전환
    // 여러 항목 개별로 돌아가게 수정해야함(가격계산항목도 마찬가지)
    $(function(){
        $("#inputQuantity").hide();
        $("#quantity").change(function() {
            if($("#quantity").val() == "input") {
                $("#inputQuantity").show();
                $("#quantity").hide();
            }else {
                $("#inputQuantity").hide();
            }
        })
    });

</script>

</body>
</html>

