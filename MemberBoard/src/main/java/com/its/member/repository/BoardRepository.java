package com.its.member.repository;

import com.its.member.dto.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public void save(BoardDTO boardDTO) {
        sqlSessionTemplate.insert("Board.save", boardDTO);
    }
}
