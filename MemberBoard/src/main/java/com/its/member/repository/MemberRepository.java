package com.its.member.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberRepository {
    private SqlSessionTemplate sql;
}
