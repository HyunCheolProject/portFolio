package com.its.member.service;

import com.its.member.dto.BoardDTO;
import com.its.member.dto.PageDTO;
import com.its.member.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;

    public void save(BoardDTO boardDTO) throws IOException {
        MultipartFile boardFile = boardDTO.getBoardFile();
        String boardFileName = boardFile.getOriginalFilename();
        boardFileName = System.currentTimeMillis() + "-" + boardFileName;
        boardDTO.setBoardFileName(boardFileName);
        String savePath = "C:\\KHC_development\\git_portFolio\\MemberBoard\\src\\main\\webapp\\resources\\files\\" + boardFileName;
        if (!boardFile.isEmpty()) {
            boardFile.transferTo(new File(savePath));
        }
        boardRepository.save(boardDTO);
    }

    public List<BoardDTO> findAll() {
        return boardRepository.findAll();
    }

    public BoardDTO findById(Long id) {
        boardRepository.updateHits(id);
        return boardRepository.findById(id);
    }

    public void delete(Long id) {
        boardRepository.delete(id);
    }

    public void update(BoardDTO boardDTO) {
        boardRepository.update(boardDTO);
    }

    private static final int PAGE_LIMIT = 3;
    private static final int BLOCK_LIMIT = 5;

    public List<BoardDTO> pagingList(int page) {
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<BoardDTO> pagingList = boardRepository.pagingList(pagingParam);
        return pagingList;
    }


    public PageDTO paging(int page) {
        int boardCount = boardRepository.boardCount();
        int maxPage = (int)(Math.ceil((double)boardCount / PAGE_LIMIT));
        int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
        int endPage = startPage + BLOCK_LIMIT - 1;
        if(endPage > maxPage)
            endPage = maxPage;
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;
    }

    public List<BoardDTO> search(String searchType, String q) {
        Map<String, String> searchParam = new HashMap<>();
        searchParam.put("type", searchType);
        searchParam.put("q", q);
        List<BoardDTO> searchList = boardRepository.search(searchParam);
        return searchList;
    }
}
