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

    // 아이디 중복 확인
    @PostMapping("/email-check")
    public @ResponseBody String emailCheck(@RequestParam("memberId") String memberId) {
        String checkResult = memberService.emailCheck(memberId);
        return checkResult;
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
        if (member != null) {
            session.setAttribute("id", member.getId());
            session.setAttribute("memberId", member.getMemberId());
            model.addAttribute("member", member);
            return "member/mypage";
        } else {
            return "member/login";
        }
    }

    // 로그아웃
    @RequestMapping(value = "/logout-form", method = RequestMethod.GET)
    public String logout(HttpSession session) throws Exception {
        session.invalidate();
        return "redirect:/";
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
        return "redirect:/member/detail";

    }

    // 회원정보 상세보기
    @GetMapping("/detail")
    public String findById(HttpSession session, Model model) {
        Long id = (Long) session.getAttribute("id");
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member", memberDTO);
        return "member/detail";
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

    // 회원삭제
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        boolean deleteResult = memberService.delete(id);
        if (deleteResult) {
            return "redirect:/member/findAll";
        } else {
            return "delete-fail";
        }
    }



















}
