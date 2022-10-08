

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
                            <form method="post">
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
                                <tr class="">
                                    <td class="">
                                        <div class="product-info">
                                            <img width="100" src="img/2022/10/08/2a664834-b6eb-4461-9f4f-5aa6b1c94b50_dogrope.png" alt="" />
                                            <a href="#!" style="font-weight: 400;">세트(목줄+리드줄) 대형견 중형견 개줄 체인 산책줄</a>
                                        </div>
                                    </td>
                                    <td>
                                        <select name="quantity" id="quantity">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="input">수량입력</option>
                                        </select>
                                        <input type="text" id="inputQuantity" name="quantity" placeholder="수량직접입력">
                                    </td>
                                    <td class="">9900원</td>
                                    <td class="">
                                        <a class="product-remove" href="#!">삭제</a>
                                    </td>
                                </tr>
                                <tr class="">
                                    <td class="">
                                        <div class="product-info">
                                            <img width="100" src="img/2022/10/08/2a664834-b6eb-4461-9f4f-5aa6b1c94b50_dogrope.png" alt="" />
                                            <a href="#!" style="font-weight: 400;">세트(목줄+리드줄) 대형견 중형견 개줄 체인 산책줄</a>
                                        </div>
                                    </td>
                                    <td>
                                        <select name="quantity" id="quantity">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="input">수량입력</option>
                                        </select>
                                        <input type="text" id="inputQuantity" name="quantity" placeholder="수량직접입력">
                                    </td>
                                    <td class="">9900원</td>
                                    <td class="">
                                        <a class="product-remove" href="#!">삭제</a>
                                    </td>
                                </tr>
                                <tr class="">
                                    <td class="">
                                        <div class="product-info">
                                            <img width="100" src="img/2022/10/08/2a664834-b6eb-4461-9f4f-5aa6b1c94b50_dogrope.png" alt="" />
                                            <a href="#!" style="font-weight: 400;">세트(목줄+리드줄) 대형견 중형견 개줄 체인 산책줄</a>
                                        </div>
                                    </td>
                                    <td>
                                        <select name="quantity" id="quantity">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="input">수량입력</option>
                                        </select>
                                        <input type="text" id="inputQuantity" name="quantity" placeholder="수량직접입력">
                                    </td>
                                    <td class="">9900원</td>
                                    <td class="">
                                        <a class="product-remove" href="#!">삭제</a>
                                    </td>
                                </tr>
                                <tr class="">
                                    <td class="">
                                        <div class="product-info">
                                            <img width="100" src="img/2022/10/08/2a664834-b6eb-4461-9f4f-5aa6b1c94b50_dogrope.png" alt="" />
                                            <a href="#!" style="font-weight: 400;">세트(목줄+리드줄) 대형견 중형견 개줄 체인 산책줄</a>
                                        </div>
                                    </td>
                                    <td>
                                        <select name="quantity" id="quantity">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="input">수량입력</option>
                                        </select>
                                        <input type="text" id="inputQuantity" name="quantity" placeholder="수량직접입력">
                                    </td>
                                    <td class="">9900원</td>
                                    <td class="">
                                        <a class="product-remove" href="#!">삭제</a>
                                    </td>
                                </tr>
                                <tr class="">
                                    <td class="">
                                        <div class="product-info">
                                            <img width="100" src="img/2022/10/08/2a664834-b6eb-4461-9f4f-5aa6b1c94b50_dogrope.png" alt="" />
                                            <a href="#!" style="font-weight: 400;">세트(목줄+리드줄) 대형견 중형견 개줄 체인 산책줄</a>
                                        </div>
                                    </td>
                                    <td>
                                        <select name="quantity" id="quantity">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="input">수량입력</option>
                                        </select>
                                        <input type="text" id="inputQuantity" name="quantity" placeholder="수량직접입력">
                                    </td>
                                    <td class="">9900원</td>
                                    <td class="">
                                        <a class="product-remove" href="#!">삭제</a>
                                    </td>
                                </tr>
                                </tbody>
                                </table>
                                <hr class="color-hr"><br>
                                <button type="button" class="pay-button pull-right">구매하기</button>
                                <span class="full-price pull-right">총 120,000원 &nbsp;</span>
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

