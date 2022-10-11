package com.mall.petshop.product;

import lombok.Data;

@Data
public class CartDTO {

    private int CartNum;
    private int productNum;
    private int quantity;
    private String id;

    private ProductDTO productDTO;
}
