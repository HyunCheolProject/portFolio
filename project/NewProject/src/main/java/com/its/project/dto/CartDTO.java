package com.its.project.dto;

import lombok.Data;

@Data
public class CartDTO {
    private Long id;
    private Long memberId;
    private Long productId;
    private int cartAmount;


    private ProductDTO productDTO;
}
