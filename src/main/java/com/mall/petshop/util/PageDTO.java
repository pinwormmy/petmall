package com.mall.petshop.util;

import lombok.Data;

@Data
public class PageDTO {
	
	private int pageBeginPoint;
	private int postEndPoint;
	private int postBeginPoint;
	private int pageEndPoint;
	private int prevPageSetPoint;
	private int nextPageSetPoint;
	private int totalPage;
	private int totalPostCount;
	private int recentPage;
	private String sortType; // 정렬 옵션
	private String keyword;// 검색 결과도 페이징이 필요하기에, 검색단어 전달 포함
	private int productNum; // 리뷰 목록때문에 넣음
	private int freeShipping; // 무료배송 체크여부
	private int onDiscount; // 할인중 체크여부
	
}
