package com.its.project.controller;

import com.its.project.dto.CartDTO;
import com.its.project.dto.OrderDTO;
import com.its.project.service.CartService;
import com.its.project.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private CartService cartService;

    // 주문페이지 출력
    @GetMapping("/orderDetail")
    public String orderDetail(@RequestParam Long id,Model model) {
        CartDTO cartDTO = cartService.findById(id);
        model.addAttribute("cart", cartDTO);
        return "order/orderDetail";
    }

    // 주문페이지 작성
//    @PostMapping("/save")
//    public String save(@ModelAttribute OrderDTO orderDTO) {
//        System.out.println("orderDTO = " + orderDTO);
//        orderService.save(orderDTO);
//        return "order/list";
//    }

    @PostMapping("/save")
    public String save() {
        return "order/list";
    }

    // 주문조회목록
    @GetMapping("/detail")
    public String findAll(Model model, HttpSession session) {
        Long id = (Long) session.getAttribute("id");
//        List<OrderDTO> orderDTOList = orderService.findAll(cartId);
        OrderDTO orderDTO = orderService.findById(id);
        model.addAttribute("order", orderDTO);
        return "order/orderDetail";
    }


}
