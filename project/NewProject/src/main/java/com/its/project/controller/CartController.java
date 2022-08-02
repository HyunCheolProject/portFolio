package com.its.project.controller;

import com.its.project.dto.CartDTO;
import com.its.project.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private CartService cartService;

    // 장바구니에 상품 담기
    @PostMapping("/save")
    public @ResponseBody String save(@ModelAttribute CartDTO cartDTO) {
        return cartService.save(cartDTO);
        // @ResponseBody 를 안쓰면
        // cartService.save(cartDTO).jsp 라는 파일 띄워줘
    }

    // 주문목록 출력
    @GetMapping("/findAll")
    public String findAll(Model model) {
        List<CartDTO> cartDTOList = cartService.findAll();
        model.addAttribute("cartList", cartDTOList);
        return "cart/orderList";
    }





}
