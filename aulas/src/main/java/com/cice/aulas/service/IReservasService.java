package com.cice.aulas.service;

import java.util.List;

import com.cice.aulas.entities.Reserva;

public interface IReservasService {
	public List<Reserva> existeAnyoAula(Integer anoSelec, Integer aulaSelec);
	public void grabarReserva(Reserva reserva);
	
}
