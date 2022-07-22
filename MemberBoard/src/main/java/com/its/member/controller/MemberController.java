package com.its.member.controller;

import com.its.member.dto.MemberDTO;
import com.its.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    // 회원가입 화면 요청
    @GetMapping("save-form")
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

    // 로그인 처리
    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session, Model model) {
        MemberDTO member = memberService.login(memberDTO);
        if ( member != null) {
            session.setAttribute("id", member.getId());
            session.setAttribute("memberId", member.getMemberId());
            model.addAttribute("member", memberDTO);
            return "member/mypage";
        } else {
            return "member/login";
        }
    }

    // 회원정보 수정화면 요청
    @GetMapping("/update-form")
    public String updateForm(HttpSession session, Model model) {
        Long updateId = (Long) session.getAttribute("id");
        MemberDTO memberDTO = memberService.findById(updateId);
        model.addAttribute("updateMember", memberDTO);
        return "member/update";
    }

    // 회원정보 수정 처리
    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO) {
        memberService.update(memberDTO);
        return "member/updatesSuccess";

    }

    // 회원정보 수정 완료 화면
    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model) {
        System.out.println("id = " + id);
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member", memberDTO);
        return "member/memberDetail";
    }

    // 관리자 페이지 화면 요청
    @GetMapping("/admin-form")
    public String adminForm() {
        return "member/admin";
    }

    // 관리자페이지 회원목록 화면 요청
    @GetMapping("/memberList-form")
    public String memberListForm() {
        return "redirect:/member/findAll";
    }

    // 회원목록
    @GetMapping("/findAll")
    public String findAll(Model model) {
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberList", memberDTOList);
        return "member/list";
    }



















}
