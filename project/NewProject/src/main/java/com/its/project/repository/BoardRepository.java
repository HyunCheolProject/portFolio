package com.its.project.repository;

import com.its.project.dto.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;


    public void save(BoardDTO boardDTO) {
        sqlSessionTemplate.insert("Board.save", boardDTO);
    }

    public List<BoardDTO> pagingList(Map<String, Integer> pagingParam) {
        return sqlSessionTemplate.selectList("Board.pagingList", pagingParam);
    }

    public int boardCount() {
        return sqlSessionTemplate.selectOne("Board.count");
    }


    public BoardDTO findById(Long id) {
        return sqlSessionTemplate.selectOne("Board.findById", id);
    }

    public void updateHits(Long id) {
        sqlSessionTemplate.update("Board.updateHits", id);
    }


    public List<BoardDTO> search(Map<String, String> searchParam) {
        return sqlSessionTemplate.selectList("Board.search", searchParam);

    }

    public void update(BoardDTO boardDTO) {
        sqlSessionTemplate.update("Board.update", boardDTO);

    }

    public void delete(Long id) {
        sqlSessionTemplate.delete("Board.delete", id);

    }
}
