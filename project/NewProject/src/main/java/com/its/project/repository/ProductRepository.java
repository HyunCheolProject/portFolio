package com.its.project.repository;

import com.its.project.dto.ProductDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductRepository {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;


    public void save(ProductDTO productDTO) {
        sqlSessionTemplate.insert("Product.save", productDTO);
    }

    public List<ProductDTO> findAll() {
        return sqlSessionTemplate.selectList("Product.findAll");
    }

    public ProductDTO findById(Long id) {
        return sqlSessionTemplate.selectOne("Product.findById", id);
    }
}
