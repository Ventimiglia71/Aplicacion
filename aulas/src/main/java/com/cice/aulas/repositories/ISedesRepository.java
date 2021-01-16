package com.cice.aulas.repositories;

/**
 * ISedesRepository contiene métodos de acceso a la tabla "sedes".
 * Contiene métodos propios de Spring y métodos personalizados.
 */

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cice.aulas.entities.Sede;

public interface ISedesRepository extends JpaRepository<Sede,Integer>{
	/**
	 * Recupera la última sede contenida en la tabla "sedes".
	 * No requiere parámetros de entrada.
	 * @return Sede
	 */
	@Query(value="SELECT * FROM sedes WHERE cod_sede = (SELECT MAX(cod_sede) FROM sedes)", nativeQuery=true)
	Sede findLastSede();  
}