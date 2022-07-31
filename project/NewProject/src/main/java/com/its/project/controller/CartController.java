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
        System.out.println("CartController.save");
        System.out.println("cartDTO = " + cartDTO);
        return cartService.save(cartDTO);
    }

}
