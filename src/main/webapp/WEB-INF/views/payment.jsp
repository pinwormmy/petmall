

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>펫몰 결제하기</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Construction Html5 Template">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
<meta name="author" content="Themefisher">
<meta name="generator" content="Themefisher Constra HTML Template v1.0">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />

<!-- Themefisher Icon font -->
<link rel="stylesheet" href="plugins/themefisher-font/style.css">
<!-- bootstrap.min css -->
<link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">

<!-- Animate css -->
<link rel="stylesheet" href="plugins/animate/animate.css">
<!-- Slick Carousel -->
<link rel="stylesheet" href="plugins/slick/slick.css">
<link rel="stylesheet" href="plugins/slick/slick-theme.css">
<!-- Main Stylesheet -->
<link rel="stylesheet" href="css/style.css">

<style>
.page-wrapper {
    width: 375px;
    height: 667px;
}
.table {
    border: 1px solid Turquoise;
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

<div class="page-wrapper">
  	<div class="purchase-confirmation shopping">
    	<div class="container">
      		<div class="row">
        		<div class="col-md-8 col-md-offset-2">
          			<div class="block">
            			<div class="purchase-confirmation-details">
				            <table id="purchase-receipt" class="table">
				                <thead>
									<tr>
					                    <th width="80px"><strong>주문번호: #</strong></th>
					                    <th>${order.orderNum}</th>
				                  	</tr>
				                </thead>
				                <tbody>
				                  	<tr>
				                    	<td><strong>받는이:</strong></td>
				                    	<td>${id}</td>
				                  	</tr>
				                  	<tr>
                                        <td><strong>연락처:</strong></td>
                                        <td>010-1111-2222</td>
                                    </tr>
				                  	<tr>
				                    	<td><strong>주소:</strong></td>
				                    	<td>고양시 고양구 고양이마을 냥냥코미도리 아파트 123-123</td>
				                  	</tr>
				                  	<tr>
				                    	<td><strong>결제수단:</strong></td>
				                    	<td>
				                    	    <select>
                                                <option value="creditCard">신용카드</option>
                                                <option value="withoutBankbook">무통장입금</option>
                                                <option value="phoneBill">휴대폰결제</option>
                                            </select>
				                    	</td>
				                  	</tr>
				                  	<tr>
				                    	<td><strong>결제금액</strong></td>
				                    	<td>${totalPrice}원</td>
				                    </tr>
				                    <tr>
				                      	<td></td>
				                      	<td><button type="button" class="pay-button" onclick="fakeResult();">결제하기</button></td>
				                    </tr>
				                </tbody>
				            </table>
              			</div>
            		</div>
          		</div>
        	</div>
      	</div>
    </div>
</div>

<!--
Essential Scripts
=====================================-->

<!-- Main jQuery -->
<script src="plugins/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.1 -->
<script src="plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- Bootstrap Touchpin -->
<script src="plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
<!-- Instagram Feed Js -->
<script src="plugins/instafeed/instafeed.min.js"></script>
<!-- Video Lightbox Plugin -->
<script src="plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
<!-- Count Down Js -->
<script src="plugins/syo-timer/build/jquery.syotimer.min.js"></script>

<!-- slick Carousel -->
<script src="plugins/slick/slick.min.js"></script>
<script src="plugins/slick/slick-animation.min.js"></script>

<!-- Google Mapl -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
<script type="text/javascript" src="plugins/google-map/gmap.js"></script>

<!-- Main Js File -->
<script src="js/script.js"></script>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>

function fakeResult() {
    window.close();
}

</script>
</body>
</html>

