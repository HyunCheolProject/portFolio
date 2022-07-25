package com.its.member.service;

import com.its.member.dto.MemberDTO;
import com.its.member.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    public void save(MemberDTO memberDTO) {
        memberRepository.save(memberDTO);
    }
    public String emailCheck(String memberId) {
        String checkResult = memberRepository.emailCheck(memberId);
        if (checkResult == null) {
            return "ok";
        } else {
            return "no";
        }
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return memberRepository.login(memberDTO);
    }

    public MemberDTO findById(Long id) {
        return memberRepository.findById(id);
    }

    public void update(MemberDTO memberDTO) {
        memberRepository.update(memberDTO);
    }

    public List<MemberDTO> findAll() {
        return memberRepository.findAll();
    }

    public boolean delete (Long id) {
        int deleteResult = memberRepository.delete(id);
        if (deleteResult > 0) {
            return true;
        } else {
            return false;
        }
    }


}
