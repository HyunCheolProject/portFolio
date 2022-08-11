package com.its.project.repository;

import com.its.project.dto.OrderDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.test.context.jdbc.Sql;

import java.util.List;

@Repository
public class OrderRepository {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public void save(OrderDTO orderDTO) {
        sqlSessionTemplate.insert("Order.save", orderDTO);
    }


    public OrderDTO findById(Long id) {
        return sqlSessionTemplate.selectOne("Order.findById", id);
    }

    public List<OrderDTO> findAll(String memberId) {
        return sqlSessionTemplate.selectList("Order.findAll", memberId);
    }

    public void update(OrderDTO orderDTO) {
        sqlSessionTemplate.update("Order.update", orderDTO);
    }

    public void delete(Long id) {
        sqlSessionTemplate.delete("Order.delete", id);
    }

    public List<OrderDTO> adminFindAll() {
        return sqlSessionTemplate.selectList("Order.adminFindAll");
    }
}
