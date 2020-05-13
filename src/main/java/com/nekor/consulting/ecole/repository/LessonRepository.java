package com.nekor.consulting.ecole.repository;

import com.nekor.consulting.ecole.model.Lesson;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface LessonRepository extends JpaRepository<Lesson, String>, JpaSpecificationExecutor<Lesson> {

}
