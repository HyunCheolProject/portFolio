package com.its.project.repository;

import com.its.project.dto.ReviewDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReviewRepository {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;


    public void save(ReviewDTO reviewDTO) {
        sqlSessionTemplate.insert("Review.save", reviewDTO);
    }

    public List<ReviewDTO> findAll(Long productId) {
        return sqlSessionTemplate.selectList("Review.findAll", productId);
    }
}
