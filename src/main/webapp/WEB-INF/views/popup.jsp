

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
.popup {
    color: white;
    background-color: black;
}
.popup a {
    color: white;
}
</style>

</head>
<body>

<div class="popup" id="popup" style="text-align: right;">
    <img src="img/petpizza.jpg">
    <span onclick=""><input type='checkbox' name='notSeenOneWeekCheck' id='notSeenOneWeekCheck' value='Y'>오늘은 그만보기😌</span>
    <a href='#' onclick="javascript:closeWin(1);">창닫기❌</a>
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

    //쿠키설정
    function setCookie( name, value, expiredays ) {
        var todayDate = new Date();
        todayDate.setDate( todayDate.getDate() + expiredays );
        document.cookie = name + '=' + escape( value ) + '; path=/; expires=' + todayDate.toGMTString() + ';'
    }

    //닫기 버튼 클릭시
    function closeWin(key) {
        if($("#notSeenOneWeekCheck").prop("checked")) {
            setCookie('popup'+key, 'Y' , 1 );
            //alert("쿠키생성 확인");
        }
        window.close();
    }

</script>
</body>
</html>

