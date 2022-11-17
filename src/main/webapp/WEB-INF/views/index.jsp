

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>P E T M A L L</title>
<style>
.page-navigation {
    text-align: center;
}
.checkbox-list {
    padding: 10px;
}
.checkbox-list label {
    font-weight: 400;
}
.bage {
    background: Turquoise;
    color: white;
    font-size: 10px;
    padding: 1px 5px;
    font-weight: 200;
    display: inline-block;
}
.product-item {
    min-height: 265px;
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jspf" %>
<div class="body-wrap">
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
			    <h2 class="page-name" align="center"><b>${page.keyword}</b>에 대한 검색결과</h1>
				<div class="related-keyword">
                    <button type="button" class="keyword-button">연관단어</button>
                    <!-- 홈컨트롤러 경로 수정되면 전부다 경로 바꿔야함 ㅋ 어떻게 하는게 좋은지 검토필요 -->
                    <c:choose>
                        <c:when test="${page.keyword == '고양이용품'}">
                            <a href="/?sortType=${page.sortType}&keyword=고양이">고양이</a>
                            <a href="/?sortType=${page.sortType}&keyword=야옹이">야옹이</a>
                            <a href="/?sortType=${page.sortType}&keyword=고양이모래">고양이모래</a>
                            <a href="/?sortType=${page.sortType}&keyword=고양이장난감">고양이장난감</a>
                            <a href="/?sortType=${page.sortType}&keyword=고양이스크래쳐">고양이스크래쳐</a>
                            <a href="/?sortType=${page.sortType}&keyword=고양이숨숨집">고양이숨숨집</a>
                            <a href="/?sortType=${page.sortType}&keyword=고양이캣타워">고양이캣타워</a>
                            <a href="/?sortType=${page.sortType}&keyword=고양이스티커">배변패드</a>
                        </c:when>
                        <c:when test="${page.keyword == '강아지용품'}">
                            <a href="/?sortType=${page.sortType}&keyword=개">개</a>
                            <a href="/?sortType=${page.sortType}&keyword=멍멍이">멍멍이</a>
                            <a href="/?sortType=${page.sortType}&keyword=강아지">강아지</a>
                            <a href="/?sortType=${page.sortType}&keyword=중형견">중형견</a>
                            <a href="/?sortType=${page.sortType}&keyword=대형견">대형견</a>
                            <a href="/?sortType=${page.sortType}&keyword=산책용품">산책용품</a>
                            <a href="/?sortType=${page.sortType}&keyword=리드줄">리드줄</a>
                            <a href="/?sortType=${page.sortType}&keyword=하네스">배변패드</a>
                        </c:when>
                        <c:when test="${page.keyword == '토끼용품'}">
                            <a href="/?sortType=${page.sortType}&keyword=토끼">토끼</a>
                            <a href="/?sortType=${page.sortType}&keyword=베딩">베딩</a>
                            <a href="/?sortType=${page.sortType}&keyword=토끼화장실">토끼화장실</a>
                            <a href="/?sortType=${page.sortType}&keyword=은신처">은신처</a>
                            <a href="/?sortType=${page.sortType}&keyword=케이지">케이지</a>
                            <a href="/?sortType=${page.sortType}&keyword=둥지">둥지</a>
                            <a href="/?sortType=${page.sortType}&keyword=이갈이">이갈이</a>
                        </c:when>
                        <c:when test="${page.keyword == '물고기용품'}">
                            <a href="/?sortType=${page.sortType}&keyword=물고기">물고기</a>
                            <a href="/?sortType=${page.sortType}&keyword=관상용">관상용</a>
                            <a href="/?sortType=${page.sortType}&keyword=열대어">열대어</a>
                            <a href="/?sortType=${page.sortType}&keyword=수족관">수족관</a>
                            <a href="/?sortType=${page.sortType}&keyword=어항">어항</a>
                            <a href="/?sortType=${page.sortType}&keyword=뜰채">뜰채</a>
                        </c:when>
                        <c:when test="${page.keyword == '갑각류용품'}">
                            <a href="/?sortType=${page.sortType}&keyword=새우">새우</a>
                            <a href="/?sortType=${page.sortType}&keyword=가재">가재</a>
                            <a href="/?sortType=${page.sortType}&keyword=어항">어항</a>
                            <a href="/?sortType=${page.sortType}&keyword=은신처">은신처</a>
                            <a href="/?sortType=${page.sortType}&keyword=수족관">수족관</a>
                        </c:when>
                        <c:when test="${page.keyword == '기타용품'}">
                            <a href="/?sortType=${page.sortType}&keyword=고양이">고양이</a>
                            <a href="/?sortType=${page.sortType}&keyword=개">개</a>
                            <a href="/?sortType=${page.sortType}&keyword=배변패드">배변패드</a>
                            <a href="/?sortType=${page.sortType}&keyword=은신처">은신처</a>
                            <a href="/?sortType=${page.sortType}&keyword=어항">어항</a>
                            <a href="/?sortType=${page.sortType}&keyword=열대어">열대어</a>
                        </c:when>
                        <c:when test="${page.keyword == '고양이사료'}">
                            <a href="/?sortType=${page.sortType}&keyword=고양이">고양이</a>
                            <a href="/?sortType=${page.sortType}&keyword=야옹이">야옹이</a>
                            <a href="/?sortType=${page.sortType}&keyword=간식">간식</a>
                            <a href="/?sortType=${page.sortType}&keyword=챠오츄르">챠오츄르</a>
                            <a href="/?sortType=${page.sortType}&keyword=참치">참치</a>
                            <a href="/?sortType=${page.sortType}&keyword=닭가슴살">닭가슴살</a>
                            <a href="/?sortType=${page.sortType}&keyword=고양이캔">고양이캔</a>
                            <a href="/?sortType=${page.sortType}&keyword=건사료">건사료</a>
                        </c:when>
                        <c:when test="${page.keyword == '강아지사료'}">
                            <a href="/?sortType=${page.sortType}&keyword=개밥">개밥</a>
                            <a href="/?sortType=${page.sortType}&keyword=강아지밥">강아지밥</a>
                            <a href="/?sortType=${page.sortType}&keyword=유기농">유기농</a>
                            <a href="/?sortType=${page.sortType}&keyword=강아지캔">강아지캔</a>
                            <a href="/?sortType=${page.sortType}&keyword=이즈칸">이즈칸</a>
                            <a href="/?sortType=${page.sortType}&keyword=관절">관절</a>
                            <a href="/?sortType=${page.sortType}&keyword=치킨">치킨</a>
                        </c:when>
                        <c:when test="${page.keyword == '토끼사료'}">
                            <a href="/?sortType=${page.sortType}&keyword=토끼밥">토끼밥</a>
                            <a href="/?sortType=${page.sortType}&keyword=건초">건초</a>
                            <a href="/?sortType=${page.sortType}&keyword=먹이">먹이</a>
                            <a href="/?sortType=${page.sortType}&keyword=홍화씨">홍화씨</a>
                            <a href="/?sortType=${page.sortType}&keyword=당근">당근</a>
                            <a href="/?sortType=${page.sortType}&keyword=옥수수">옥수수</a>
                            <a href="/?sortType=${page.sortType}&keyword=비타민">비타민</a>
                        </c:when>
                        <c:when test="${page.keyword == '기타사료'}">
                            <a href="/?sortType=${page.sortType}&keyword=고양이밥">고양이밥</a>
                            <a href="/?sortType=${page.sortType}&keyword=멍멍이밥">멍멍이밥</a>
                            <a href="/?sortType=${page.sortType}&keyword=사료">사료</a>
                            <a href="/?sortType=${page.sortType}&keyword=먹이">먹이</a>
                            <a href="/?sortType=${page.sortType}&keyword=급여기">급여기</a>
                            <a href="/?sortType=${page.sortType}&keyword=간식">간식</a>
                        </c:when>
                        <c:otherwise>
                            <a href="/?sortType=${page.sortType}&keyword=고양이">고양이</a>
                            <a href="/?sortType=${page.sortType}&keyword=멍멍이">멍멍이</a>
                            <a href="/?sortType=${page.sortType}&keyword=토끼">토끼</a>
                            <a href="/?sortType=${page.sortType}&keyword=물고기">물고기</a>
                            <a href="/?sortType=${page.sortType}&keyword=먹이">먹이</a>
                            <a href="/?sortType=${page.sortType}&keyword=사료">사료</a>
                            <a href="/?sortType=${page.sortType}&keyword=패드">패드</a>
                            <a href="/?sortType=${page.sortType}&keyword=간식">간식</a>
                        </c:otherwise>
                    </c:choose>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="products section">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="widget">
					<h4 class="widget-title">필터</h4>
					<hr>
					<div class="checkbox-list">
                        <input type="checkbox" id="freeShipping" value="1" onclick="clickFreeShipping();"
                        <c:if test="${page.freeShipping == 1}">checked</c:if>  >
                        <label for="freeShipping">무료배송</label> <br><br>
                        <input type="checkbox" id="onDiscount" value="1" onclick="clickOnDiscount();"
                        <c:if test="${page.onDiscount == 1}">checked</c:if> >
                        <label for="onDiscount">할인 중</label>
                    </div>
	            </div>
	            <hr>
				<div class="widget product-category">
					<h4 class="widget-title">카테고리</h4>
					<div class="panel-group commonAccordion" id="accordion" role="tablist" aria-multiselectable="true">
					  	<div class="panel panel-default" style="border-color: Turquoise; border-radius: 10px;">
						    <div class="panel-heading" role="tab" id="headingOne">
						      	<h4 class="panel-title">
						        	<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
						          	애완용품
						        	</a>
						      	</h4>
						    </div>
					    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">
								<ul>
									<li><a href="/?sortType=${page.sortType}&keyword=고양이용품">고양이용품</a></li>
									<li><a href="/?sortType=${page.sortType}&keyword=강아지용품">강아지용품</a></li>
									<li><a href="/?sortType=${page.sortType}&keyword=토끼용품">토끼용품</a></li>
									<li><a href="/?sortType=${page.sortType}&keyword=거북이용품">거북이용품</a></li>
                                    <li><a href="/?sortType=${page.sortType}&keyword=물고기용품">물고기용품</a></li>
                                    <li><a href="/?sortType=${page.sortType}&keyword=갑각류용품">갑각류용품</a></li>
                                    <li><a href="/?sortType=${page.sortType}&keyword=기타용품">기타용품</a></li>
								</ul>
							</div>
					    </div>
					</div>

					<div class="panel panel-default" style="border-color: Turquoise; border-radius: 10px;">
					    <div class="panel-heading" role="tab" id="headingTwo">
					      <h4 class="panel-title">
					        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
					        href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					         	사료/간식
					        </a>
					      </h4>
					    </div>
					    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
					    	<div class="panel-body">
					     		<ul>
									<li><a href="/?sortType=${page.sortType}&keyword=고양이사료">고양이사료</a></li>
                                    <li><a href="/?sortType=${page.sortType}&keyword=강아지사료">강아지사료</a></li>
                                    <li><a href="/?sortType=${page.sortType}&keyword=토끼사료">토끼사료</a></li>
                                    <li><a href="/?sortType=${page.sortType}&keyword=거북이사료">거북이사료</a></li>
                                    <li><a href="/?sortType=${page.sortType}&keyword=물고기사료">물고기사료</a></li>
                                    <li><a href="/?sortType=${page.sortType}&keyword=갑각류사료">갑각류사료</a></li>
                                    <li><a href="/?sortType=${page.sortType}&keyword=기타사료">기타사료</a></li>
								</ul>
					    	</div>
					    </div>
					  </div>
					</div>
				</div>
			</div>
			<div class="col-md-9">
			    <div class="sort-option">
                    <ul>
                        <li><c:if test="${page.sortType == 'recent'}">✔️</c:if>
                        <a href="/?sortType=recent&keyword=${page.keyword}">최신 입고순</a>
                        </li>
                        <li><c:if test="${page.sortType == 'lowPrice'}">✔️</c:if>
                        <a href="/?sortType=lowPrice&keyword=${page.keyword}">낮은 가격순</a>
                        </li>
                        <li><c:if test="${page.sortType == 'highPrice'}">✔️</c:if>
                        <a href="/?sortType=highPrice&keyword=${page.keyword}">높은 가격순</a>
                        </li>
                        <li><c:if test="${page.sortType == 'bestReview'}">✔️</c:if>
                        <a href="/?sortType=bestReview&keyword=${page.keyword}">리뷰많은 순</a>
                        </li>
                    </ul>
			    </div>
			    <hr><br>
				<div class="row">
				    <c:if test="${empty productList}">
				        <h3>검색 결과가 없습니다 😿</h3>
				        <img src="/img/midori1.jpg" height="500px">
				    </c:if>
				    <c:forEach items="${productList}" var="product">
                        <div class="col-md-4">
                            <div class="product-item" style="margin-bottom: 15px;">
                                <div class="product-thumbnail">
                                    <a href="/products/${product.productNum}">
                                        <img class="img-responsive" src="${product.thumbnail}"/>
                                    </a>
                                </div>
                                <div class="product-content">
                                    <a href="/readProduct?productNum=${product.productNum}">${product.name}</a>
                                    <p class="price"><c:if test="${product.onDiscount == 1}"><span class="bage">할인중</span></c:if>
                                    ${product.price}원
                                        <a href="javascript:addCart(${product.productNum});">🛒</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
			</div>
		</div>
	</div>
</section>
</div>

<hr>

<div class="page-navigation">
    <c:if test="${page.prevPageSetPoint >= 1}">
        <a class="pull-left btn btn-theme"
        href="/?recentPage=${page.prevPageSetPoint}&sortType=${page.sortType}&keyword=${page.keyword}">
        이전</a>
    </c:if>
    <c:forEach var="countPage" begin="${page.pageBeginPoint}" end="${page.pageEndPoint}">
        <c:if test="${page.recentPage != countPage}">
            <a class="pull-center btn btn-theme"
            href="/?recentPage=${countPage}&sortType=${page.sortType}&keyword=${page.keyword}">
            ${countPage}</a>
        </c:if>
        <c:if test="${page.recentPage == countPage}">${countPage}</c:if>
    </c:forEach>
    <c:if test="${page.nextPageSetPoint <= page.totalPage}">
        <a class="pull-right btn btn-theme"
        href="/?recentPage=${page.nextPageSetPoint}&sortType=${page.sortType}&keyword=${page.keyword}">
        다음</a>
    </c:if>
</div>
<c:if test="${member.lv == 2}">
    <button class="admin-button" onclick="location.href='/products/form'">상품등록</button>
</c:if>

<%@ include file="/WEB-INF/views/include/footer.jspf" %>

<script>
    //alert("js test 03");

    function comingSoon() {
        alert("업데이트 예정입니다.");
    }

    function clickFreeShipping() {
        let freeShippingBox = document.getElementById("freeShipping");
        if(freeShippingBox.checked) {
            location.href=
            "/?sortType=${page.sortType}&keyword=${page.keyword}&onDiscount=${page.onDiscount}&freeShipping=1";
        }else {
            location.href=
            "/?sortType=${page.sortType}&keyword=${page.keyword}&onDiscount=${page.onDiscount}&freeShipping=0";
        }
    }

    function clickOnDiscount() {
        let onDiscountBox = document.getElementById("onDiscount");
        if(onDiscountBox.checked) {
            location.href=
            "/?sortType=${page.sortType}&keyword=${page.keyword}&freeShipping=${page.freeShipping}&onDiscount=1";
        }else {
            location.href=
            "/?sortType=${page.sortType}&keyword=${page.keyword}&freeShipping=${page.freeShipping}&onDiscount=0";
        }
    }

    //쿠키 불러오기
    function getCookie(name) {
        // alert("js test 쿠키몬스터");
        var obj = name + "=";
        var x = 0;
        while ( x <= document.cookie.length )
        {
            var y = (x+obj.length);
            if ( document.cookie.substring( x, y ) == obj ) {
                if ((endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
                    endOfCookie = document.cookie.length;
                return unescape( document.cookie.substring( y, endOfCookie ) );
            }
            x = document.cookie.indexOf( " ", x ) + 1;

            if ( x == 0 ) break;
        }
        return "";
    }

    $(function(){
        console.log(getCookie("popup"));
        if(getCookie("popup1") !="Y"){
            window.open("/popup", "event", "width=500, height=525");
        }
    });

    function addCart(productNum) {
        if(${member == null}) {
            alert("로그인이 필요합니다.");
            return false;
        };
        fetch("/addCart", {
            method: 'POST',
            headers: {"Content-Type" : "application/json"},
            body: JSON.stringify({
                productNum : productNum,
                id : "${member.id}",
                quantity : 1,
            })
        })
        .then((data) => alert("장바구니에 담았습니다."));
    }

</script>

</body>
</html>

