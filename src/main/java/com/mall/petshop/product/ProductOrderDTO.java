package com.mall.petshop.product;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class ProductOrderDTO {

    private int orderNum;
    private int productNum;
    private int quantity;
    private String id;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+9")
    private Date orderDate;
    private int totalPrice;
    private int status; // 0: 구매버튼만 누름 1: 결제 (2~: 배송상태관련. 추후업데이트)
}
