package com.its.project.dto;

import lombok.Data;

@Data
public class CartDTO {
    private Long id;
    private Long memberId;
    private Long productId;
    private String cartProduct;
    private String cartName;
    private int cartAmount;
    private int cartPrice;


    private ProductDTO productDTO;
}
