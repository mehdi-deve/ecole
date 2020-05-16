package com.nekor.consulting.ecole.webRest;


import com.nekor.consulting.ecole.model.Category;
import com.nekor.consulting.ecole.model.ContentType;
import com.nekor.consulting.ecole.repository.ContentTypeRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/ContenuType")
public class ContentTypeRessource {

    @Autowired
    ContentTypeRepository contentTypeRepository;

    private final Logger logger = LoggerFactory.getLogger(ContentTypeRessource.class);

    @GetMapping
    public List<ContentType> getAllCategories() {
        logger.info("Enter getAllContentType");
        return this.contentTypeRepository.findAll();
    }
}
