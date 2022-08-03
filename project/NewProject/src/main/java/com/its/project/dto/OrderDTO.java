package com.its.project.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class OrderDTO {
    private Long id;
    private String orderName;
    private String orderAddress;
    private String orderMobile;
    private Long cartId;
    private String orderProduct;
    private int orderAmount;
    private String orderPrice;
    private String orderState;
    private Timestamp orderCreatedDate;

    private ProductDTO productDTO;
    private CartDTO cartDTO;
}
