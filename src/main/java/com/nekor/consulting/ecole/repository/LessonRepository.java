package com.nekor.consulting.ecole.repository;

import com.nekor.consulting.ecole.model.ClassRoom;
import com.nekor.consulting.ecole.model.Lesson;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface LessonRepository extends JpaRepository<Lesson, String>, JpaSpecificationExecutor<Lesson> {
    @Query(value = "SELECT * FROM ecole.cours where ecole.cours.classe_id=?1", nativeQuery = true)
    public List<Lesson> getLessonByClasse_id(String classe_id);
}
