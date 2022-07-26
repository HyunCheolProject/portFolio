package com.its.member.repository;

import com.its.member.dto.CommentDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentRepository {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public void save(CommentDTO commentDTO) {
        sqlSessionTemplate.insert("Comment.save", commentDTO);
    }

    public List<CommentDTO> findAll(Long boardId) {
        return sqlSessionTemplate.selectList("Comment.findAll", boardId);
    }
}
