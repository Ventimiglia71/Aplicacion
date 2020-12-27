package com.cice.aulas.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.cice.aulas.entities.Aula;

public interface IAulasRepository extends JpaRepository<Aula, Integer> {
	@Query(nativeQuery = true, value = "SELECT * FROM aulas WHERE cod_sede = :codSede")
	List<Aula> aulasPorSede(@Param("codSede") Integer codSede);

}
