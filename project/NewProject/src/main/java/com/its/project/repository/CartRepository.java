package com.its.project.repository;

import com.its.project.dto.CartDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CartRepository {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public int save(CartDTO cartDTO) {
        return sqlSessionTemplate.insert("Cart.save", cartDTO);
    }

    public List<CartDTO> findAll(Long memberId) {
        List<CartDTO> cartDTOList = sqlSessionTemplate.selectList("Cart.findAll", memberId);
        return cartDTOList;
    }

    public CartDTO findByProductId(CartDTO cartDTO) {
        return sqlSessionTemplate.selectOne("Cart.findByProductId", cartDTO);
    }

    public int update(CartDTO cartDTO) {
        return sqlSessionTemplate.update("Cart.update", cartDTO);
    }

    public void delete(Long id) {
        sqlSessionTemplate.delete("Cart.delete", id);
    }

    public CartDTO findById(Long id) {
        return sqlSessionTemplate.selectOne("Cart.findById", id);
    }
}
