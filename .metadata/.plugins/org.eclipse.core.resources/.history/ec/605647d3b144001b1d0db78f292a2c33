package com.cice.aulas.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.cice.aulas.entities.Reserva;

public interface IReservasRepository extends JpaRepository<Reserva, Integer> {
	@Query(nativeQuery = true, value = "SELECT * FROM reservas WHERE ano = :anoSelec")
	List<Reserva> existeAnyo(@Param("anoSelec") Integer anoSelec);
	
}
