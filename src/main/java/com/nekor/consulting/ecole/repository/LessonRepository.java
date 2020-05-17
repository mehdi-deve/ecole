package com.nekor.consulting.ecole.repository;

import com.nekor.consulting.ecole.model.ClassRoom;
import com.nekor.consulting.ecole.model.Lesson;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

public interface LessonRepository extends JpaRepository<Lesson, String>, JpaSpecificationExecutor<Lesson> {
    @Query(value = "SELECT * FROM ecole.cours where ecole.cours.classe_id=?1", nativeQuery = true)
    public List<Lesson> getLessonByClasseId(String classe_id);

    @Query(value = "SELECT * FROM ecole.cours where ecole.cours.professeur_id=?1", nativeQuery = true)
    public List<Lesson> getLessonByProfesseurId(String professeur_id);

    @Query(value="SELECT * FROM ecole.cours, ecole.eleve WHERE ecole.cours.classe_id=ecole.eleve.classe_id AND ecole.eleve.id=?1",nativeQuery = true)
    public List<Lesson> getLessonByEleveId(String eleve_id);

    @Query(value="SELECT * FROM ecole.cours, ecole.eleve WHERE ecole.cours.classe_id=ecole.eleve.classe_id " +
            "AND ecole.eleve.id=?1 AND ecole.cours.matiere_id=?2",nativeQuery = true)
    public List<Lesson> getLessonByEleveIdAndMatiereId(String eleve_id, String matiere_id);

    @Query(value="SELECT * FROM ecole.cours, ecole.eleve WHERE ecole.cours.classe_id=ecole.eleve.classe_id " +
            "AND ecole.eleve.id=?1 AND ecole.cours.creationDate=?2",nativeQuery = true)
    public List<Lesson> getLessonByEleveIdAndDate(String eleve_id, Date creationDate);

    @Query(value="SELECT * FROM ecole.cours, ecole.eleve WHERE ecole.cours.classe_id=ecole.eleve.classe_id " +
            "AND ecole.eleve.id=?1 AND ecole.cours.matiere_id=?2 AND ecole.cours.creationDate=?3",nativeQuery = true)
    public List<Lesson> getLessonByEleveIdAndMatiereIdAndDate(String eleve_id, String matiere_id, Date creationDate);

    @Query(value = "SELECT * FROM ecole.cours WHERE ecole.cours.date_creation > CURDATE()", nativeQuery = true)
    public List<Lesson> getNextCours();

    @Query(value = "SELECT * FROM ecole.cours WHERE ecole.cours.date_creation < CURDATE()", nativeQuery = true)
    public List<Lesson> getLastCours();
}
