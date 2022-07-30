package com.its.project.service;

import com.its.project.dto.BoardDTO;
import com.its.project.dto.ProductDTO;
import com.its.project.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;


    public void insert(ProductDTO productDTO) throws IOException {
        MultipartFile productFile = productDTO.getProductFile();
        String productFileName = productFile.getOriginalFilename();
        productFileName = System.currentTimeMillis() + "-" + productFileName;
        productDTO.setProductFileName(productFileName);
        String savePath = "C:\\KHC_development\\git_portFolio\\project\\NewProject\\src\\main\\webapp\\resources\\files\\" + productFileName;
        if (!productFile.isEmpty()) {
            productFile.transferTo(new File(savePath));
        }
        productRepository.insert(productDTO);
    }

    public List<ProductDTO> findAll() {
        return productRepository.findAll();
    }

    public ProductDTO findById(Long id) {
        productRepository.updateHits(id);
        return productRepository.findById(id);
    }

    public List<ProductDTO> search(String searchType, String q) {
        Map<String, String> searchParam = new HashMap<>();
        searchParam.put("type", searchType);
        searchParam.put("q", q);
        List<ProductDTO> searchList = productRepository.search(searchParam);
        return searchList;
    }

    public void update(ProductDTO productDTO) {
        productRepository.update(productDTO);
    }

    public void delete(Long id) {
        productRepository.delete(id);
    }

    public List<ProductDTO> popular() {
        return productRepository.popular();
    }
}
