package com.its.project.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class OrderDTO {
    private Long id;
    private String orderName;
    private String postcode;
    private String address;
    private String detailAddress;
    private String extraAddress;
    private String requests;
    private String orderMobile;
//    private Long cartId;
    private String orderProduct;
    private int orderAmount;
    private int orderPrice;
    private String orderStatus;
    private Timestamp orderCreatedDate;

    private ProductDTO productDTO;
    private CartDTO cartDTO;
}
