package com.its.project.service;

import com.its.project.dto.OrderDTO;
import com.its.project.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {
    @Autowired
    private OrderRepository orderRepository;

    public void save(OrderDTO orderDTO) {
        orderRepository.save(orderDTO);
    }

//    public List<OrderDTO> findAll(Long cartId) {
//        return orderRepository.findAll(cartId);
//    }

    public OrderDTO findById(Long id) {
        return orderRepository.findById(id);
    }

    public List<OrderDTO> findAll(String memberId) {
        return orderRepository.findAll(memberId);
    }
}
