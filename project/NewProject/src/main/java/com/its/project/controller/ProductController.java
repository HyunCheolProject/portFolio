package com.its.project.controller;

import com.its.project.dto.BoardDTO;
import com.its.project.dto.CommentDTO;
import com.its.project.dto.ProductDTO;
import com.its.project.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductService productService;

    // 상품등록 (사진첨부) 화면 요청
    @GetMapping("/insert-form")
    public String insertForm() {
        return "product/insert";
    }

    // 상품등록 (사진첨부) 처리
    @PostMapping("/insert")
    public String insert(@ModelAttribute ProductDTO productDTO) throws IOException {
        productService.insert(productDTO);
        return "redirect:/product/findAll";
    }

    // 상품 목록 출력
    @GetMapping("/findAll")
    public String findAll(Model model) {
        List<ProductDTO> productDTOList = productService.findAll();
        model.addAttribute("productList", productDTOList);
        return "product/list";
    }

    // 상세조회
    @GetMapping("/detail")
    public String findById(@RequestParam Long id, Model model,
                           @RequestParam(value = "page", required = false,
                                   defaultValue = "1") int page) {
        ProductDTO productDTO = productService.findById(id);
        model.addAttribute("product", productDTO);
        model.addAttribute("page", page);
//        List<CommentDTO> commentList = commentService.findAll(id);
//        model.addAttribute("commentList", commentList);
        return "product/detail";
    }


}
