package com.its.project.controller;

import com.its.project.dto.CartDTO;
import com.its.project.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private CartService cartService;

    @PostMapping("/save")
    public @ResponseBody String save(@ModelAttribute CartDTO cartDTO) {
        return cartService.save(cartDTO);
        // @ResponseBody 를 안쓰면
        // cartService.save(cartDTO).jsp 라는 파일 띄워줘
    }

}
