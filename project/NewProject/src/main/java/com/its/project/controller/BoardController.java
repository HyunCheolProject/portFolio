package com.its.project.controller;

import com.its.project.dto.BoardDTO;
import com.its.project.dto.PageDTO;
import com.its.project.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;

    // 글작성 (사진첨부) 화면 요청
    @GetMapping("/save-form")
    public String saveForm() {
        return "board/save";
    }

    // 글작성 (사진첨부) 처리
    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.save(boardDTO);
        return "redirect:/board/paging";
    }

    // 페이징 처리
    @GetMapping("/paging")
    public String paging(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model) {
        List<BoardDTO> boardList = boardService.pagingList(page);
        PageDTO paging = boardService.paging(page);
        model.addAttribute("boardList", boardList);
        model.addAttribute("paging", paging);
        return "board/list";
    }

    // 상세조회
    @GetMapping("/detail")
    public String findById(@RequestParam Long id, Model model,
                           @RequestParam(value = "page", required = false,
                                   defaultValue = "1") int page) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        model.addAttribute("page", page);
        return "board/detail";
    }





}
