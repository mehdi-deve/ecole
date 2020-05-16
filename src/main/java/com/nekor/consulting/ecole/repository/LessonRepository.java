package com.nekor.consulting.ecole.repository;

import com.nekor.consulting.ecole.model.ClassRoom;
import com.nekor.consulting.ecole.model.Lesson;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDate;
import java.util.List;

public interface LessonRepository extends JpaRepository<Lesson, String>, JpaSpecificationExecutor<Lesson> {
    @Query(value = "SELECT * FROM ecole.cours where ecole.cours.classe_id=?1", nativeQuery = true)
    public List<Lesson> getLessonByClasseId(String classe_id);

    @Query(value = "SELECT * FROM ecole.cours WHERE ecole.cours.date_creation > CURDATE()", nativeQuery = true)
    List<Lesson> getNextCours();

    @Query(value = "SELECT * FROM ecole.cours WHERE ecole.cours.date_creation < CURDATE()", nativeQuery = true)
    List<Lesson> getLastCours();
}
