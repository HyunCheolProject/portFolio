package com.its.project.repository;

import com.its.project.dto.ProductDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ProductRepository {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;


    public void insert(ProductDTO productDTO) {
        sqlSessionTemplate.insert("Product.insert", productDTO);
    }

    public List<ProductDTO> findAll() {
        return sqlSessionTemplate.selectList("Product.findAll");
    }

    public ProductDTO findById(Long id) {
        return sqlSessionTemplate.selectOne("Product.findById", id);
    }

    public void updateHits(Long id) {
        sqlSessionTemplate.update("Product.updateHits", id);

    }

    public List<ProductDTO> search(Map<String, String> searchParam) {
        return sqlSessionTemplate.selectList("Product.search", searchParam);

    }

    public void update(ProductDTO productDTO) {
        sqlSessionTemplate.update("Product.update", productDTO);
    }

    public void delete(Long id) {
        sqlSessionTemplate.delete("Product.delete", id);
    }
}
