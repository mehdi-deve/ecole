package com.nekor.consulting.ecole.repository;

import com.nekor.consulting.ecole.model.Subject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.Optional;

public interface SubjectRepository extends JpaRepository<Subject, String>, JpaSpecificationExecutor<Subject> {
}
