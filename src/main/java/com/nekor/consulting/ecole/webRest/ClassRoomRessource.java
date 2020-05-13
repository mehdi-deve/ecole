package com.nekor.consulting.ecole.webRest;


import com.nekor.consulting.ecole.model.ClassRoom;
import com.nekor.consulting.ecole.repository.ClassRoomRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;
import java.util.UUID;

@RestController
@RequestMapping("/api/classroom")
public class ClassRoomRessource {

    @Autowired
    ClassRoomRepository classRoomRepository;

    @PostMapping
    private void createUpdateClassRoom(@RequestBody ClassRoom classRoom) {
        if (classRoom.getId() == null) {
            classRoom.setId(UUID.randomUUID().toString());
        }
        classRoomRepository.save(classRoom);
    }

    @DeleteMapping("{classRoomId}")
    private void deleteClassRoom(@PathVariable(name = "classRoomId") String classRoomId) {
        classRoomRepository.deleteById(classRoomId);
    }

    @GetMapping
    private Optional<ClassRoom> findClassRoomById(@RequestParam(name = "classRoomId") String classRoomId) {
        return  classRoomRepository.findById(classRoomId);
    }

}
