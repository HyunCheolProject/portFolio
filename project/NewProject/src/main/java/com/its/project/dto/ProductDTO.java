package com.its.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

@Data
public class ProductDTO {
    private Long id;
    private String productName;
    private String productWriter;
    private String productPw;
    private String productContents;
    private int productPrice;
    private int productHits;
    private Timestamp productCreatedDate;
    private MultipartFile productFile;
    private String productFileName;
    private String productCategory;

}
