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
	public List<Reserva> existeAnyo(Integer anoSelec) {
		return reservaRepo.existeAnyo(anoSelec);
	}

}