package com.nekor.consulting.ecole.model;

//import lombok.Data;;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.time.LocalDate;

//@Data
@Entity
@Table(name = "cours")
public class Lesson implements Serializable {
    private static final long serialVersionUID = 1L;

    @Column(name = "classe_id", nullable = false)
    private String classRoomId;

    @Column(name = "date_creation")
    private LocalDate createDate;

    @Id
    @Column(name = "id", insertable = false, nullable = false)
    private String id;

    @Column(name = "matiere_id", nullable = false)
    private String subjectId;

    @Column(name = "nom", nullable = false)
    private String name;

    @Column(name = "professeur_id", nullable = false)
    private String teacherId;

    public String getClassRoomId() {
        return classRoomId;
    }

    public void setClassRoomId(String classRoomId) {
        this.classRoomId = classRoomId;
    }

    public LocalDate getCreateDate() {
        return createDate;
    }

    public void setCreateDate(LocalDate createDate) {
        this.createDate = createDate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(String subjectId) {
        this.subjectId = subjectId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }
}
