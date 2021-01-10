package com.cice.aulas.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.cice.aulas.entities.Aula;

public interface IAulasRepository extends JpaRepository<Aula, Integer> {
	@Query(nativeQuery = true, value = "SELECT * FROM aulas WHERE cod_sede = :codSede")
	List<Aula> aulasPorSede(@Param("codSede") Integer codSede);

	@Query(nativeQuery = true, value = "SELECT nombre_aula FROM aulas WHERE cod_aula = :aulaSelec")
	String nombreAulaPorCodAula(@Param("aulaSelec") Integer aulaSelec);

	@Query(nativeQuery = true, value = "SELECT * FROM aulas WHERE  cod_sede 	= 	:sedeSelec 		and "
																+ "cod_tipord 	=	:tipoElegido	and "
																+ "num_puestos	>=	:numPuestos")
	List<Aula> seleccionAulas(	@Param("sedeSelec") Integer sedeSelec,
								@Param("tipoElegido") Integer tipoElegido,
								@Param("numPuestos") Integer numPuestos);

}
