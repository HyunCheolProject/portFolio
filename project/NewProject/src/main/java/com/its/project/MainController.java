package com.its.project;

import com.its.project.dto.ProductDTO;
import com.its.project.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {
    private final ProductService productService;
    @GetMapping("/")
    public String index(Model model) {
        List<ProductDTO> productDTOList = productService.popular();
        model.addAttribute("productList", productDTOList);
        return "index";
    }

}
