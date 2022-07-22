package com.its.member.repository;

import com.its.member.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public void save(MemberDTO memberDTO) {
        sqlSessionTemplate.insert("Member.save", memberDTO);
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return sqlSessionTemplate.selectOne("Member.login", memberDTO);
    }

    public MemberDTO findById(Long id) {
        return sqlSessionTemplate.selectOne("Member.findById", id);
    }

    public void update(MemberDTO memberDTO) {
        sqlSessionTemplate.update("Member.update", memberDTO);
    }

    public List<MemberDTO> findAll() {
        return sqlSessionTemplate.selectList("Member.findAll");
    }

    public int delete(Long id) {
        return sqlSessionTemplate.delete("Member.delete", id);
    }
}
