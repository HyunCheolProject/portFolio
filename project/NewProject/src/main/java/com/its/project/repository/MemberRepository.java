package com.its.project.repository;

import com.its.project.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

    public String memberIdCheck(String memberId) {
        return sqlSessionTemplate.selectOne("Member.memberIdCheck", memberId);
    }

    public void update(MemberDTO memberDTO) {
        sqlSessionTemplate.update("Member.update", memberDTO);
    }

    public MemberDTO finById(Long updateId) {
        return sqlSessionTemplate.selectOne("Member.findById", updateId);
    }
}
