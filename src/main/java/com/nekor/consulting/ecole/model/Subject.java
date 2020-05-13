package com.nekor.consulting.ecole.model;

//import lombok.Data;;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Table(name = "ref_matiere")
//@Data
@Entity
public class Subject implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id", insertable = false, nullable = false)
    private String id;

    @Column(name = "nom")
    private String name;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
