package com.nekor.consulting.ecole.webRest;


import com.nekor.consulting.ecole.model.ClassRoom;
import com.nekor.consulting.ecole.model.Lesson;
import com.nekor.consulting.ecole.repository.ClassRoomRepository;
import com.nekor.consulting.ecole.repository.LessonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Date;
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
    private ResponseEntity<List<Lesson>> getLessonByClasseId(@RequestParam(name = "id") String id) {
        return ResponseEntity.
                ok().
                contentType(MediaType.APPLICATION_JSON).
                body( lessonRepository.getLessonByClasseId(id));
    }

    @GetMapping("/professeur")
    private ResponseEntity<List<Lesson>> getLessonByProfesseurId(@RequestParam(name = "id") String id) {
        return ResponseEntity.
                ok().
                contentType(MediaType.APPLICATION_JSON).
                body( lessonRepository.getLessonByProfesseurId(id));
    }

    @GetMapping("/nextCours")
    private List<Lesson> getNextLesson(){
        return lessonRepository.getNextCours();
    }

    @GetMapping("/lastCours")
    private List<Lesson> getLastLesson(){
        return lessonRepository.getLastCours();
    }
}
