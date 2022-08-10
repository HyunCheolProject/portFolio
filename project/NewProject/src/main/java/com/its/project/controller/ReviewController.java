package com.its.project.controller;

import com.its.project.dto.ReviewDTO;
import com.its.project.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/review")
public class ReviewController {
    @Autowired
    private ReviewService reviewService;

    // 리뷰등록
    @PostMapping("/save")
    public @ResponseBody List<ReviewDTO> save(@ModelAttribute ReviewDTO reviewDTO) {
        System.out.println("reviewDTO = " + reviewDTO);
        reviewService.save(reviewDTO);
        List<ReviewDTO> reviewDTOList = reviewService.findAll(reviewDTO.getProductId());
        return reviewDTOList;
    }


}
