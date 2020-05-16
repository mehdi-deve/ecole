package com.nekor.consulting.ecole.webRest;


import com.nekor.consulting.ecole.exceptions.MyException;
import com.nekor.consulting.ecole.model.Category;
import com.nekor.consulting.ecole.model.Subject;
import com.nekor.consulting.ecole.repository.CategoryRepository;
import com.nekor.consulting.ecole.repository.SubjectRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@RestController
@RequestMapping("/api/subject")
public class SubjectRessource {

    @Autowired
    private SubjectRepository subjectRepository;

    private final Logger logger = LoggerFactory.getLogger(SubjectRessource.class);

    @GetMapping
    public List<Subject> getAllSubjects() {
        logger.info("Enter getAllSubjects");
        return this.subjectRepository.findAll();
    }

}
