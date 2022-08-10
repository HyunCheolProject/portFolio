package com.its.project.controller;

import com.its.project.dto.OrderDTO;
import com.its.project.dto.ProductDTO;
import com.its.project.dto.ReviewDTO;
import com.its.project.service.ProductService;
import com.its.project.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductService productService;

    @Autowired
    private ReviewService reviewService;

    // 상품등록 (사진첨부) 화면 요청
    @GetMapping("/insert-form")
    public String insertForm() {
        return "product/insert";
    }

    // 상품등록 (사진첨부) 처리
    @PostMapping("/insert")
    public String insert(@ModelAttribute ProductDTO productDTO) throws IOException {
        System.out.println("productDTO = " + productDTO);
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
                                   defaultValue = "1") int page, HttpSession session) {
        List <OrderDTO> orderDTOList = new ArrayList<>();
        ProductDTO productDTO = productService.findById(id);
        model.addAttribute("product", productDTO);
        model.addAttribute("page", page);
        // 결제 한 회원만 후기 작성 가능
        String memberId = (String) session.getAttribute("memberId");
        orderDTOList = productService.orderFindById(memberId);
        model.addAttribute("order", orderDTOList);
        List<ReviewDTO> reviewList = reviewService.findAll(id);
        model.addAttribute("reviewList", reviewList);
        return "product/detail";
    }

    // 검색처리
    @GetMapping("/search")
    public String search(@RequestParam("searchType") String searchType,
                         @RequestParam("q") String q, Model model) {
        List<ProductDTO> searchList = productService.search(searchType, q);
        model.addAttribute("productList", searchList);
        return "product/list";
    }

    // 상품 수정 화면 요청
    @GetMapping("/update-form")
    public String updateForm(@RequestParam Long id, Model model) {
        ProductDTO productDTO = productService.findById(id);
        model.addAttribute("productUpdate",productDTO);
        return "product/update";
    }

    // 상품 수정처리
    @PostMapping("/update")
    public String update(@ModelAttribute ProductDTO productDTO) {
        productService.update(productDTO);
        return "redirect:/product/detail?id="+productDTO.getId();
    }

    // 비밀번호 체크페이지
    @GetMapping("/pwCheck")
    public String pwCheck(@RequestParam Long id, Model model) {
        ProductDTO productDTO = productService.findById(id);
        model.addAttribute("product", productDTO);
        return "product/pwCheck";
    }

    // 상품 삭제 처리
    @GetMapping("/delete")
    public String delete(@RequestParam Long id) {
        productService.delete(id);
        return "redirect:/product/findAll";
    }






}
