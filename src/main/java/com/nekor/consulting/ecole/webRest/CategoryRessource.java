package com.nekor.consulting.ecole.webRest;

import com.nekor.consulting.ecole.model.Category;
import com.nekor.consulting.ecole.repository.CategoryRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/categories")
public class CategoryRessource {


    @Autowired
    private CategoryRepository categoryRepository;

    private final Logger logger = LoggerFactory.getLogger(CategoryRessource.class);

    @GetMapping
    public List<Category> getAllCategories() {
        logger.info("Enter getAllCategories");
        return this.categoryRepository.findAll();
    }
}
