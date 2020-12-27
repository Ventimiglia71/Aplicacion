package com.cice.aulas.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cice.aulas.entities.Sede;
import com.cice.aulas.repositories.ISedesRepository;
import com.cice.aulas.service.*;

@Service
public class SedesServiceImpl implements ISedesService{
	@Autowired
	ISedesRepository sedesRepo;
		
	@Override
	public List<Sede> allSedes() {
		return sedesRepo.allSedes();
	}

	@Override
	public String nombreSedePorCodSede(Integer sedeSelec) {
		return sedesRepo.nombreSedePorCodSede(sedeSelec);
	}

}
