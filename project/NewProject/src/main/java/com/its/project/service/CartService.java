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

    // 장바구니 상품 담기
    public CartDTO findByProductId(CartDTO cartDTO) {
        return cartRepository.findByProductId(cartDTO);
    }

    public String update(CartDTO cartDTO) {
        int result = cartRepository.update(cartDTO);
        if (result > 0) {
            return "ok";
        } else {
            return "no";
        }
    }

    public void delete(Long id) {
        cartRepository.delete(id);
    }

    // orderDetail 회원정보 불러오기
    public CartDTO findById(Long id) {
        return cartRepository.findById(id);
    }
}
