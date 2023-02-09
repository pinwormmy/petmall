<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>상품 수정</title>
<style>
html {
    height: 100%;
}
img {
    border-radius: 30px;
}

</style>
</head>
<body>

<%@ include file="/WEB-INF/views/include/header.jspf" %>

<br>
<form action="/products/${product.productNum}" method="post" enctype="multipart/form-data">
    <input type="hidden" name="_method" value="put">
    상품명 : <input type="text" name="name" size="100" value="${product.name}"><br>
    가  격 : <input type="text" name="price" value="${product.price}">원<br>
    검색태그 : <textarea name="searchTag" cols="100" rows="5">${product.searchTag}</textarea><br><br>
    <textarea name="content" id="content">${product.content}</textarea><br>
    <input type="checkbox" name="freeShipping" value="${product.freeShipping}">무료배송
    <input type="checkbox" name="onDiscount" value="${product.onDiscount}">할인 중 <br><br>

    <div class="selectThumbnail">
        <label for="thumbnailPath">썸네일 이미지용</label><br>
        <input type="file" id="thumbnailPath" name="file">
        <div class="showThumbnailImage">
            <img src="${product.thumbnail}">
        </div>
    </div>
    <hr><br>
    <button>상품 등록</button>
    <button type="button" onclick="location.href='/'">취소</button><br><br>
</form>

<%@ include file="/WEB-INF/views/include/footer.jspf" %>

<script>
    alert("js test03");
    CKEDITOR.replace('content', {
        filebrowserUploadUrl : '/ckUpload/imageUpload.do',
        width : '70%',
        height : 500
    });

    $("#thumbnailPath").change(
            function() {
                if (this.files && this.files[0]) {
                    var reader = new FileReader;
                    reader.onload = function(data) {
                        $(".showThumbnailImage img").attr("src",
                                data.target.result).width(300);
                    }
                    reader.readAsDataURL(this.files[0]);
                }
            });
</script>

</body>
</html>

