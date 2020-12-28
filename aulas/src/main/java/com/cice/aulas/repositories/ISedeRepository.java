package com.cice.aulas.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cice.aulas.entities.Sede;

public interface ISedeRepository extends JpaRepository<Sede,Integer>{
	// Query que recupera la última sede de la BD.
	@Query(value="SELECT * FROM sedes WHERE cod_sede = (SELECT MAX(cod_sede) FROM sedes)", nativeQuery=true)
	Sede findLastSede();  
}