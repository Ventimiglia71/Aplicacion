package com.cice.aulas.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cice.aulas.entities.Reserva;
import com.cice.aulas.repositories.IReservasRepository;
import com.cice.aulas.service.IReservasService;

@Service
public class ReservasSeviceImpl implements IReservasService{
	@Autowired
	IReservasRepository reservaRepo;
	
	@Override
	public List<Reserva> existeAnyoAula(Integer anoSelec, Integer aulaSelec) {
		return reservaRepo.existeAnyoAula(anoSelec, aulaSelec);
	}

	@Override
	public void grabarReserva(Reserva reserva) {
		reservaRepo.save(reserva);
	}

}
