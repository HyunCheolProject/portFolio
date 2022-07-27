package com.its.project.controller;

import com.its.project.dto.MemberDTO;
import com.its.project.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    // 회원가입 화면 요청
    @GetMapping("/save-form")
    public String saveForm() {
        return "member/save";
    }

    // 회원가입 처리
    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) {
        memberService.save(memberDTO);
        return "member/login";
    }

    // 로그인 화면 요청
    @GetMapping("/login-form")
    public String loginForm() {
        return "member/login";
    }

    // 아이디 중복 확인
    @PostMapping("/memberId-check")
    public @ResponseBody String memberIdCheck(@RequestParam String memberId) {
        String checkResult = memberService.memberIdCheck(memberId);
        return checkResult;
    }

    // 로그인 처리
    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session, Model model) {
        MemberDTO member = memberService.login(memberDTO);
        if (member != null) {
            session.setAttribute("id", member.getId());
            session.setAttribute("memberId", member.getMemberId());
            model.addAttribute("member", member);
            return "member/mypage";
        } else {
            return "member/login";
        }
    }



}
