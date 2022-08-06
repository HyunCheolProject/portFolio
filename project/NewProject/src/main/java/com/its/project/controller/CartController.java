package com.its.project.controller;

import com.its.project.dto.CartDTO;
import com.its.project.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private CartService cartService;

    // 장바구니에 상품 담기
    @PostMapping("/save")
    public @ResponseBody String save(@ModelAttribute CartDTO cartDTO) {
        CartDTO cartDTO1 = cartService.findById(cartDTO);
        if (cartDTO1 == null) {
            return cartService.save(cartDTO);
        } else {
            return cartService.update(cartDTO);
        }
        // @ResponseBody 를 안쓰면
        // cartService.save(cartDTO).jsp 라는 파일 띄워줘
    }

    // 장바구니 주문목록 출력
    @GetMapping("/findAll")
    public String findAll(Model model, HttpSession session) {
        Long memberId = (Long) session.getAttribute("id");
        List<CartDTO> cartDTOList = cartService.findAll(memberId);
        model.addAttribute("cartList", cartDTOList);
        return "cart/cartList";
    }

    // 장바구니 목록 삭제
    @GetMapping("/delete")
    public String delete(@RequestParam Long id) {
        System.out.println("id = " + id);
        cartService.delete(id);
        return "redirect:/cart/findAll";
    }

    // 주문페이지 출력

    @GetMapping("/orderDetail")
    public String orderDetail() {
        return "cart/orderDetail";
    }



}
