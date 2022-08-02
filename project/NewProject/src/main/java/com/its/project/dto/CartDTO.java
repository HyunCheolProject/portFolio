package com.its.project.dto;

import lombok.Data;

@Data
public class CartDTO {
    private Long id;
    private Long memberId;
    private Long productId;
    private String orderProduct;
    private String orderName;
    private int cartAmount;


    private ProductDTO productDTO;
}
