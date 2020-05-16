package com.nekor.consulting.ecole.webRest;


import com.nekor.consulting.ecole.model.ClassRoom;
import com.nekor.consulting.ecole.model.Lesson;
import com.nekor.consulting.ecole.repository.ClassRoomRepository;
import com.nekor.consulting.ecole.repository.LessonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@RestController
@RequestMapping("/api/lesson")
public class LessonRessource {

    @Autowired
    LessonRepository lessonRepository;

    @PostMapping
    private void createUpdateLesson(@RequestBody Lesson lesson) {
        if (lesson.getId() == null) {
            lesson.setId(UUID.randomUUID().toString());
        }
        lessonRepository.save(lesson);
    }

    @DeleteMapping("{lesson}")
    private void deleteLesson(@PathVariable(name = "lessonId") String lessonId) {
        lessonRepository.deleteById(lessonId);
    }

    @GetMapping
    private Optional<Lesson> findLessonId(@RequestParam(name = "lessonId") String lessonId) {
        return  lessonRepository.findById(lessonId);
    }

    @GetMapping("/classe")
    private ResponseEntity<List<Lesson>> getLessonByClasse_id(@RequestParam(name = "id") String id) {
        return ResponseEntity.
                ok().
                contentType(MediaType.APPLICATION_JSON).
                body( lessonRepository.getLessonByClasse_id(id));
    }
}
