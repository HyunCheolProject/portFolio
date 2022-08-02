package com.its.project.service;

import com.its.project.dto.CartDTO;
import com.its.project.repository.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartService {
    @Autowired
    private CartRepository cartRepository;

    public String save(CartDTO cartDTO) {
        int result =  cartRepository.save(cartDTO);
        if (result > 0) {
            return "ok";
        } else {
            return "no";
        }
    }

    public List<CartDTO> findAll(Long memberId) {
        return cartRepository.findAll(memberId);
    }

    public CartDTO findById(CartDTO cartDTO) {
        return cartRepository.findById(cartDTO);
    }

    public String update(CartDTO cartDTO) {
        int result = cartRepository.update(cartDTO);
        if (result > 0) {
            return "ok";
        } else {
            return "no";
        }
    }
}
