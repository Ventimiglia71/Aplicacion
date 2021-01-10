package com.cice.aulas.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.cice.aulas.entities.Equipamiento;

public interface IEquipamientoRepository extends JpaRepository<Equipamiento, Integer>{
	
	@Query(nativeQuery = true, value = "SELECT * FROM equipamientos WHERE cod_equipo = :codEquipo")
	Equipamiento findByCodEquipo(@Param("codEquipo") Integer codEquipo);
}
