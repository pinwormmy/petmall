package com.mall.petshop.product;

import lombok.Data;

import java.util.Date;

@Data
public class ProductDTO {

    private int productNum;
    private String searchTag;
    private String name;
    private String price;
    private String content;
    private String thumbnail;
    private int freeShipping;
    private int onDiscount;
    private Date regDate;
    private int reviewCount;

    private LikeItDTO likeItDTO;
}
