package com.nekor.consulting.ecole.model;

//import lombok.Data;;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

//@Data
@Entity
@Table(name = "eleve")
public class Student implements Serializable {
    private static final long serialVersionUID = 1L;

    @Column(name = "classe_id", nullable = false)
    private String classRoomId;

    @Id
    @Column(name = "id", insertable = false, nullable = false)
    private String id;

    public String getClassRoomId() {
        return classRoomId;
    }

    public void setClassRoomId(String classRoomId) {
        this.classRoomId = classRoomId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
