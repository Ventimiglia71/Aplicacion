package com.cice.aulas.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.cice.aulas.entities.Sede;

public interface ISedesRepository  extends JpaRepository<Sede, Integer> {
	@Query(nativeQuery = true, value = "SELECT * FROM sedes")
	List<Sede> allSedes();

	@Query(nativeQuery = true, value = "SELECT nombre_sede FROM sedes where cod_sede = :sedeSelec")
	String nombreSedePorCodSede(@Param("sedeSelec") Integer sedeSelec);

}
