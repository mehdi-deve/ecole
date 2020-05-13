package com.nekor.consulting.ecole.webRest;


import com.nekor.consulting.ecole.model.ClassRoom;
import com.nekor.consulting.ecole.model.Subject;
import com.nekor.consulting.ecole.repository.SubjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;
import java.util.UUID;

@RestController
@RequestMapping("/api/subject")
public class SubjectRessource {

    @Autowired
    SubjectRepository subjectRepository;

    @PostMapping
    private void createUpdateSubject(@RequestBody Subject subject) {
        if (subject.getId() == null) {
            subject.setId(UUID.randomUUID().toString());
        }
        subjectRepository.save(subject);
    }

    @DeleteMapping("{subjectId}")
    private void deleteSubject(@PathVariable(name = "subjectId") String subjectId) {
        subjectRepository.deleteById(subjectId);
    }

    @GetMapping
    private Optional<Subject> findSubjectById(@RequestParam(name = "subjectId") String subjectId) {
        return  subjectRepository.findById(subjectId);
    }
}
