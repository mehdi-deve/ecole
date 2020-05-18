package com.nekor.consulting.ecole.repository;

import com.nekor.consulting.ecole.model.ClassRoom;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ClassRoomRepository extends JpaRepository<ClassRoom, String>, JpaSpecificationExecutor<ClassRoom> {

    @Query(value = "SELECT * FROM ecole.classe where ecole.classe.etablissement_id=?1", nativeQuery = true)
    public List<ClassRoom> getClassRoomByEtablissementId(String etablissement_id);

    @Query(value = "SELECT * FROM ecole.classe where ecole.classe.user_id=?1", nativeQuery = true)
    public List<ClassRoom> getClassRoomByUserId(String user_id);

}
