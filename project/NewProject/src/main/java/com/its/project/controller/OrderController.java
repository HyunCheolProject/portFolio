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

    @PostMapping("/save")
    public String save(@ModelAttribute OrderDTO orderDTO, @RequestParam Long cartId) {
        System.out.println("orderDTO = " + orderDTO);
        orderService.save(orderDTO);
        cartService.delete(cartId);
        return "order/list";
    }

    // 배송조회 페이지 출력
    @GetMapping("/list")
    public String findAll(Model model, HttpSession session) {
        String memberId = (String) session.getAttribute("memberId");
//        List<OrderDTO> orderDTOList = orderService.findAll(cartId);
        List<OrderDTO> orderDTOList = orderService.findAll(memberId);
        System.out.println("orderDTOList = " + orderDTOList);
        model.addAttribute("orderList", orderDTOList);
        return "order/list";
    }

    // 배송상태 변경
    @PostMapping("/update")
    public String update(@ModelAttribute OrderDTO orderDTO) {
        orderService.update(orderDTO);
        return "redirect:/order/list";
    }

    // 배송목록 삭제
    @GetMapping("/delete")
    public String delete(@RequestParam Long id) {
        orderService.delete(id);
        return "redirect:/order/list";
    }


}
