<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>상품 조회</title>
<style>
html {
    height: 100%;
}
img {
    border-radius: 30px;
}
.price-hr {
    border: solid 1px black;
}
.like-share {
    font-size: 30px;
    text-align: right;
}
.single-product-details h2 {
    font-weight: 200;
}

.card-event {
    width: 90%;
    height: 40px;
    margin: 10px;
    padding: 7px 20px;
    background-color: #E4FFEE;
    border-radius: 10px;
    font-weight: 200;
}
.product-quantity {
    width: 90%;
    margin: 10px;
    padding: 7px 20px;
    background-color: #E8E8E8;
    border-radius: 10px;
}
.product-quantity h3 {
    margin: 0 0 0 150px;
}
.basic-button-white {
    color: Turquoise;
    background-color: white;
    border: 1px solid Turquoise;
    font-size: 24px;
    padding: 10px 20px;
    border-radius: 10px;
    font-weight: 300;
}
.basic-button {
    color: white;
    background-color: Turquoise;
    font-size: 24px;
    padding: 10px 20px;
    border: none;
    border-radius: 10px;
    font-weight: 300;
}
.tabCommon .nav-tabs li {
    width: 180px;
    margin: 0;
}
.tabCommon mt-20.nav nav-tabs {
    flex-direction: column;
}
.shipping {
    margin: 10px;
    font-weight: 300;
    line-height: 30px;
}
.product-category {
    margin: 5px;
}
.button-set button{
    margin: 5px;
}
#content {
    border: solid 1px Turquoise;
    width: 90%;
}
.write-review-button {
    margin-bottom: 20px;
    background-color: Turquoise;
    color: white;
    border-radius: 10px;
    border: none;
    padding: 5px;
    height: 38px;
}
.addProductByadmin {
    color: white;
    background-color: Turquoise;
    margin: 10px;
}
</style>
</head>
<body>

<%@ include file="/WEB-INF/views/include/header.jspf" %>

<c:if test="${member.lv == 2}">
    <h3>관리자 메뉴</h3>
    <br><button class="admin-button" type="button" onclick="deleteProduct();">상품삭제</button>
    <button class="admin-button" type="button" onclick="location.href='/products/form/${product.productNum}'">상품수정</button>
</c:if>
<section class="single-product" style="padding: 0;">
	<div class="container">
		<div class="row mt-20">
			<div class="col-md-6" style="margin: 60px 0 40px 0;">
				<div class="single-product-slider">
					<div id='carousel-custom' class='carousel slide' data-ride='carousel'>
						<div class='carousel-outer'>
							<!-- me art lab slider -->
							<div class='carousel-inner '>
								<div class='item active'>
									<img src='${product.thumbnail}' alt='' width="600px" data-zoom-image="${product.thumbnail}" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="single-product-details">
				    <p class="like-share">
                        <span id="likeHeart"><a href='javascript:switchToLike();'>🤍</a></span>
                        <a href="javascript:urlClip();">🔗</a>
				    </p>
					<h2>${product.name}</h2>
					<hr class="price-hr">
					<h1>${product.price}원</h1>
					<div class="card-info">
                        <div class="card-event"><b>첫 구매시</b> 고양이간식 이벤트 참여가능 + 추가 1% 적립 </div>
                        <div class="card-event"><b>국민카드</b> 30,000원 이상 무료 배송 </div>
                        <div class="card-event"><b>야옹카드</b> 만원 이상 무료 배송 + 추가 0.5% 적립 </div>
					</div>
					<hr>
					<form method="post" id="buyOrCartProduct">
					    <div class="product-quantity">
                            <div class="product-quantity-slider">
                                <input id="quantity" type="text" value="1" name="quantity" style="width: 120px; border: none;">
                            </div>
                            <input type="hidden" name="productNum" value="${product.productNum}">
                            <input type="hidden" name="quantity">
                            <input type="hidden" name="id" value="${member.id}">
                            <input type="hidden" name="totalPrice" id="totalPrice" value="11000"><!-- 테스트값 -->
                            <h3>총 <span id="sum">${product.price}</span>원</h3>
                        </div>
                        <button type="button" class="basic-button-white" onclick="comingSoon();">🎁선물하기</button>
                        <button type="button" class="basic-button-white" onclick="addCart(${product.productNum})">🛒장바구니</button>
                        <button type="button" class="basic-button" onclick="buyProduct();">바로 구매하기</button>
					</form><br>
					<hr>
					<div class="shipping">
					    <span>
					    <c:if test="${product.freeShipping == 0}">🚚쌩쌩통운  |  배송비 3,000원</c:if>
					    <c:if test="${product.freeShipping == 1}"><b>🚚쌩쌩통운  |  배송비 무료</b></c:if>
					    </span><br>
					    <span> 🛍️스마트픽 - 내주변 픽업</span>
					</div>
					<hr>
					<div class="product-category">
						<span>검색태그</span>
						<c:if test="${product.searchTag == null}">미등록</c:if>
						${product.searchTag}
					</div>
				</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-xs-12">
				<div class="tabCommon mt-20">
					<ul class="nav nav-tabs">
						<li class="active">
						<a data-toggle="tab" href="#details" aria-expanded="true" style="background-color: Turquoise;">
						상세정보</a></li>
						<li class=""><a data-toggle="tab" href="#reviews" aria-expanded="false"
						style="background-color: Turquoise;">
						리뷰(${product.reviewCount})</a></li>
					</ul>
					<div class="tab-content patternbg">
						<div id="details" class="tab-pane fade active in" style="text-align: center;">
					        ${product.content}
						</div>
						<div id="reviews" class="tab-pane fade">
							<div class="product-reviews">
                                <ul class="media-list reviews-list m-bot-50 clearlist" style="flex-direction: column;">
                                    <div id="reviews-list"></div>
                                    <div id="reviews-page"></div>
                                </ul>
							</div>
							<div class="add-review">
                                <h5>리뷰 작성하기</h5>
                                <input name="content" id="content">
                                <button type="button" class="write-review-button" onclick="addReview();">리뷰쓰기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/views/include/footer.jspf" %>

<script>

    //alert("js test 20");

    function comingSoon() {
        alert("업데이트 예정입니다.");
    }

    let likeHeart = document.getElementById("likeHeart");
    let Id;

    if(${member == null}) // 함수에 로그인아이디 전달하되 널값 안들어가게끔 조정
        Id = "";
    else
        Id = "${member.id}";

    let likeProduct = 0;
    function showHeartAboutLike(likeProduct) {
        console.log("하트 띄우기 - 인수 확인 : ", likeProduct);
        if(likeProduct == 1)
            likeHeart.innerHTML = "<a href='javascript:switchToUnlike();'>❤️</a>";
        else
            likeHeart.innerHTML = "<a href='javascript:switchToLike();'>🤍</a>";
    }

    checkLike(); // 로그인했는지 보고 갱신

    function comingSoon() {
        alert("업데이트 예정입니다.");
    }

    function checkLike() {
        if(${member == null}) { return false; }
        fetch("/checkLike?id=" + Id + "&productNum=" + ${product.productNum})
        .then(response => response.json())
        .then(data => {
            console.log("좋아요 상태 확인", data);
            showHeartAboutLike(data);
        });
    }

    function switchToLike() {
        if(${member == null}){
            location.href="/login/form";
            return false;
        }
        console.log("좋아요 상태 추가 ㄱㄱ");
        fetch("/switchToLike", {
            method: "POST",
            headers: {"Content-Type" : "application/json"},
            body: JSON.stringify({
                id: Id,
                productNum: "${product.productNum}",
            }),
        })
        .then((data) => {
            console.log("좋아요로 전환함",);
            checkLike();
        });
    }

    function switchToUnlike() {
        if(${member == null}){
            location.href="/";
            return false;
        }
        console.log("좋아요 상태 취소 ㄱㄱ");
        fetch("/switchToUnlike?id=" + Id + "&productNum=" + "${product.productNum}", {
            method: "DELETE",
        })
        .then((data) => {
            console.log("좋아요 취소함");
            checkLike();
        });
    }

    function urlClip(){
        let url = '';
        let urlText = document.createElement("textarea");
        document.body.prepend(urlText);
        url = window.document.location.href;
        urlText.value = url;
        urlText.select();
        document.execCommand("copy");
        document.body.removeChild(urlText);
        alert("해당 상품의 주소가 복사되었습니다. 가족, 친구들에게 소개해주세요~!")
    }

    let reviewContent = document.getElementById("content");
    showReviewList();

    function addReview() {
        if(${member == null}) {
            location.href='/login/form';
            return false;
        };

        console.log("리뷰입력 값 : ", reviewContent.value);
        if(reviewContent.value == "") {
            alert("리뷰 내용을 작성해주세요~");
            return false;
        }
        fetch("/reviews", {
            method: 'POST',
            headers: {"Content-Type" : "application/json"},
            body: JSON.stringify({
                productNum : ${product.productNum},
                id : "${member.id}",
                content : reviewContent.value,
            })
        })
        .then((data) => {
            console.log(data);
            updateReviewCount(${product.productNum});
            showReviewList();
        });
        reviewContent.value = "";
    }

    function showReviewList(reviewPage) {
        pageSettingAndLoadReview(reviewPage);
    }

    function pageSettingAndLoadReview(reviewPage) {
        fetch("/reviews/page", {
                method: 'POST',
                headers: {"Content-Type" : "application/json"},
                body: JSON.stringify({
                    recentPage : reviewPage,
                    productNum : ${product.productNum}
                })
            })
        .then((response) => response.json())
        .then((data) => {
            console.log(data);
            loadReviewFetch(data);
            let reviewPageDivTag = document.getElementById("reviews-page");
            reviewPageDivTag.innerHTML = "";
            let reviewPageHtml = "";

            if(data.prevPageSetPoint >= 1) {
                reviewPageHtml +="<a href='javascript:pageSettingAndLoadReview(" + data.prevPageSetPoint + ")'>◁</a>";
            }
            if(data.totalPage > 1) {
                for(let i=data.pageBeginPoint; i<=data.pageEndPoint; i++) {
                    if(i == data.recentPage) {
                        reviewPageHtml += " " + i + " ";
                    }else {
                        reviewPageHtml += "<a href='javascript:pageSettingAndLoadReview(" + i + ")'>" + i + " </a>";
                    }
                }
            }
            if(data.nextPageSetPoint <= data.totalPage) {
                reviewPageHtml +="<a href='javascript:pageSettingAndLoadReview(" + data.nextPageSetPoint + ")'>▷</a>";
            }
            reviewPageDivTag.innerHTML += reviewPageHtml;
        });
    }

    function loadReviewFetch() {
        console.log("리뷰 불러오기 펫치 시작전");
        fetch("/reviews/" + ${product.productNum}, {
            method: "GET",
            headers: {"Content-Type" : "application/json"}
        })
        .then((response) => response.json())
        .then((data) => showReviewWithHtml(data));
    }

    function showReviewWithHtml(ReviewDTOList) {
        let reviewDivTag = document.getElementById("reviews-list");
        reviewDivTag.innerHTML = "";
        let reviewListHtml = "";
        reviewDivTag.innerHTML += reviewHtmlWithString(reviewListHtml, ReviewDTOList);
        console.log("댓글 코맨트 소스 작업  반영 확인 : " + JSON.stringify(ReviewDTOList));
    }

    function reviewHtmlWithString(reviewListHtml, ReviewDTOList) {
        console.log("댓글 코맨트 소스 반복문 준비 확인");
        for(let review of ReviewDTOList) {
            reviewListHtml += "<div class='media'><div class='media-body'><div class='well'><div class='media-heading'><b>";
            reviewListHtml += review.id +" </b><small> " + review.regDate + "</small></div><p>" + review.content;
            reviewListHtml = displayDeleteButton(reviewListHtml, review) + "</p></div></div></div>";
        }
        return reviewListHtml;
    }

    function displayDeleteButton(reviewListHtml, reviewDTO) {
        if( ("${member.id}" == reviewDTO.id) || ("${member.lv}" == 2) ) {
            reviewListHtml += "<button class='pull-right btn btn-theme' onclick='deleteReview(";
            reviewListHtml += reviewDTO.reviewNum + ");'>삭제</button>";
        }
        return reviewListHtml;
    }

    function deleteReview(reviewNum) {
        fetch("/reviews/" + reviewNum, {method:"DELETE"})
        .then(data => {
            updateReviewCount(${product.productNum});
            showReviewList();
        })
        .catch(error => alert("댓글 삭제 오류"));
    }

    function updateReviewCount(productNum) {
        fetch("/reviews/count/" + productNum, {method:"PUT"})
            .then(data => console.log("댓글 업데이트"))
            .catch(error => alert("댓글수 갱신 오류"));
    }

    $('#totalPrice').val(${product.price});
    console.log("초기화 가격 확인 : ", $('#totalPrice').val());

    $( document ).ready( function() {
        $('#quantity').on( 'focus keyup', function() {
            var a = $('#quantity').val();
            var b = ${product.price};
            console.log(a, b);
            var sum = a * b;
            $( '#sum' ).text( sum );
            $('#totalPrice').val(sum);
            console.log("합계인풋 테스트 : ", $('#totalPrice').val());
        });
    } );

    let buyOrCartProduct = document.getElementById("buyOrCartProduct");

    function buyProduct() {
        if(${member == null}) {
            alert("로그인이 필요합니다.");
            return false;
        }
        let popTitle = "바로 구매하기";
        window.open("", popTitle, "width=375, height=500");
        buyOrCartProduct.target = popTitle;
        buyOrCartProduct.action = "/payment";
        buyOrCartProduct.submit();
    }

    let quantity = document.getElementById("quantity");

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
                quantity : quantity.value,
            })
        })
        .then((data) => alert("장바구니에 담았습니다."));
    }

    function deleteProduct() {
        if(confirm("해당 상품을 삭제하시겠습니까?")) {
            fetch("/products/" + ${product.productNum}, {method: 'DELETE'})
            .then(() => {
                alert("상품이 삭제되었습니다.");
                location.href="/";
            });
        }
    }

</script>

</body>
</html>