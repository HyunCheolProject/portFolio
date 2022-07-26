package com.its.project.service;

import com.its.project.dto.MemberDTO;
import com.its.project.repository.MemberRepository;
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

    public MemberDTO login(MemberDTO memberDTO) {
        return memberRepository.login(memberDTO);
    }

    public String memberIdCheck(String memberId) {
        String checkResult = memberRepository.memberIdCheck(memberId);
        if (checkResult == null) {
            return "ok";
        } else {
            return "no";
        }
    }

    public MemberDTO findById(Long updateId) {
        return memberRepository.finById(updateId);
    }

    public void update(MemberDTO memberDTO) {
        memberRepository.update(memberDTO);
    }

    public boolean deleteForm(Long id) {
        int deleteResult = memberRepository.deleteForm(id);
        if (deleteResult > 0) {
            return true;
        } else {
            return false;
        }
    }

    public List<MemberDTO> findAll() {
        return memberRepository.findAll();
    }

    public boolean delete(Long id) {
        int deleteResult = memberRepository.delete(id);
        if (deleteResult > 0) {
            return true;
        } else {
            return false;
        }
    }
}
