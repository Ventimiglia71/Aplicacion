package com.cice.aulas.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cice.aulas.entities.Sede;

public interface ISedesRepository  extends JpaRepository<Sede, Integer> {
	@Query(nativeQuery = true, value = "SELECT * FROM sedes")
	List<Sede> allSedes();

}
