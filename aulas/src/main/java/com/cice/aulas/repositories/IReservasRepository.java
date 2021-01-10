package com.cice.aulas.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.cice.aulas.entities.Reserva;

public interface IReservasRepository extends JpaRepository<Reserva, Integer> {
	@Query(nativeQuery = true, value = "SELECT * FROM reservas WHERE anyo = :anoSelec and cod_aula = :aulaSelec")
	List<Reserva> existeAnyoAula(	@Param("anoSelec") Integer anoSelec,
									@Param("aulaSelec") Integer aulaSelec);
	
	@Query(nativeQuery = true, value = "SELECT * FROM reservas WHERE anyo 		= 	:anoSelec "
														      + "and mes 		= 	:mesSelec "
														      + "and dia		=	:diaSelec "
														      + "and cod_aula 	= 	:aulaSelec "
														      + "and hora 		=	:horaSelec")
	List<Reserva> buscarVacios(	@Param("anoSelec") Integer anoSelec,
								@Param("mesSelec") Integer mesSelec,
								@Param("diaSelec") Integer diaSelec,
								@Param("aulaSelec") Integer aulaSelec,
								@Param("horaSelec") Integer horaSelec);
	
	@Query(nativeQuery = true, value = "SELECT * FROM reservas WHERE	cod_aula 	= 	:aulaSelec and "
																	 + "anyo 		= 	:anoSelec and "
																	 + "mes 			= 	:mesSelec "
																	 + "ORDER BY dia asc, hora asc")
	List<Reserva> reservasHechas(	@Param("aulaSelec") Integer aulaSelec,
									@Param("anoSelec") Integer anoSelec,
									@Param("mesSelec") Integer mesSelec);

	
}
