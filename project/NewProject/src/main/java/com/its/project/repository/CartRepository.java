package com.its.project.repository;

import com.its.project.dto.CartDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartRepository {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public int save(CartDTO cartDTO) {
        return sqlSessionTemplate.insert("Cart.save", cartDTO);
    }
}
