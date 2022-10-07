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
</style>
</head>
<body>

<%@ include file="/WEB-INF/views/include/header.jspf" %>

<c:if test="${member.lv == 2}">
    <h3>관리자 메뉴</h3>
    <br><button type="button" onclick="location.href='/deleteProduct?productNum=${product.productNum}'">상품삭제</button>
    <button type="button" onclick="location.href='/modifyProduct'">상품수정</button>
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
					<div class="product-quantity">
						<div class="product-quantity-slider">
							<input id="product-quantity" type="text" value="0" name="product-quantity">
						</div>
						<h3>총 19,800원</h3>
					</div>
					<button href="cart.html" class="basic-button-white" onclick="comingSoon();">🎁선물하기</button>
					<button href="cart.html" class="basic-button-white">🛒장바구니</button>
					<button href="cart.html" class="basic-button">바로 구매하기</button><br><br>
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
						<li class="active"><a data-toggle="tab" href="#details" aria-expanded="true">상세정보</a></li>
						<li class=""><a data-toggle="tab" href="#reviews" aria-expanded="false">리뷰(3)</a></li>
					</ul>
					<div class="tab-content patternbg">
						<div id="details" class="tab-pane fade active in" style="text-align: center;">
					        ${product.content}
						</div>
						<div id="reviews" class="tab-pane fade">
							<div class="product-reviews">
                                <ul class="media-list reviews-list m-bot-50 clearlist" style="flex-direction: column;">
                                    <!-- Review Item start-->
                                    <li class="media">
                                        <div class="media-body" style="text-align: left;">
                                            <div class="review-info">
                                                <h4 class="review-author">
                                                    <a href="#!">${review.id}</a>
                                                </h4>
                                                <time datetime="2013-04-06T13:53">${review.regDate}</time>
                                                <a class="review-button" href="#!"><i class="tf-ion-chatbubbles"></i>Reply</a>
                                            </div>
                                            <p>
                                                ${review.content}
                                            </p>
                                        </div>
                                    </li>
                                    <!-- End Review Item -->
                                    <div id="reviews-list"></div>
                                    <div id="reviews-page"></div>
                                </ul>
							</div>
							<div class="add-review">
                                <h4>리뷰 작성하기</h4>
                                <input name="content" id="content">
                                <button onclick="addReview();">리뷰쓰기</button>
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

alert("js test 18");

let likeHeart = document.getElementById("likeHeart");
let loginId;

if(${member == null}) // 함수에 로그인아이디 전달하되 널값 안들어가게끔 조정
    loginId = "";
else
    loginId = "${member.id}";

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
    fetch("/checkLike?id=" + loginId + "&productNum=" + ${product.productNum})
    .then(response => response.json())
    .then(data => {
        console.log("좋아요 상태 확인", data);
        showHeartAboutLike(data);
    });
}

function switchToLike() {
    if(${member == null}){
        location.href="/login";
        return false;
    }
    console.log("좋아요 상태 추가 ㄱㄱ");
    fetch("/switchToLike", {
        method: "POST",
        headers: {"Content-Type" : "application/json"},
        body: JSON.stringify({
            id: loginId,
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
        location.href="/login";
        return false;
    }
    console.log("좋아요 상태 취소 ㄱㄱ");
    fetch("/switchToUnlike?id=" + loginId + "&productNum=" + "${product.productNum}", {
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
    console.log("리뷰입력 값 : ", reviewContent.value);
    if(reviewContent == "") {
        alert("리뷰 내용을 작성해주세요~");
        return false;
    }
    fetch("/addReview", {
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
    reviewContent = "";
}

function showReviewList(reviewPage) {
    pageSettingAndLoadReview(reviewPage);
}

function pageSettingAndLoadReview(reviewPage) {
    fetch("/reviewPageSetting", {
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

function loadReviewFetch(pageDTO) {
    console.log("리뷰 불러오기 펫치 시작전");
    fetch("/showReviewList", {
        method: "POST",
        headers: {"Content-Type" : "application/json"},
        body: JSON.stringify(pageDTO),
    })
    .then((response) => response.json())
    .then((data) => showReviewWithHtml(data));
}

function showReviewWithHtml(ReviewDTOList) {
    let reviewDivTag = document.getElementById("reviews-list");
    reviewDivTag.innerHTML = "";
    let reviewListHtml = "";
    reviewDivTag.innerHTML += reviewHtmlWithString(reviewListHtml, ReviewDTOList);
    console.log("댓글 코맨트 소스 작업  반영 확인");
}

function reviewHtmlWithString(reviewListHtml, ReviewDTOList) {
    console.log("댓글 코맨트 소스 반복문 준비 확인");
    for(let review of ReviewDTOList) {
        reviewListHtml += "<div class='media'><div class='media-body'><div class='well'><div class='media-heading'>";
        reviewListHtml += review.regDate + "</small></div><p>" + review.content + "</p>";
        reviewListHtml = displayDeleteButton(reviewListHtml, review) + "</div></div></div>";
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
    fetch("/deleteReview?reviewNum=" + reviewNum, {method:"DELETE"})
    .then(data => {
        updateReviewCount(${product.productNum});
        showReviewList();
    })
    .catch(error => alert("댓글 삭제 오류"));
}

function updateReviewCount(productNum) {
    fetch("/updateReviewCount?productNum=" + productNum, {method:"PUT"})
        .then(data => console.log("댓글 업데이트"))
        .catch(error => alert("댓글수 갱신 오류"));
}

</script>

</body>
</html>