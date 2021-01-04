package com.cice.aulas.serviceimpl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cice.aulas.entities.Sede;
import com.cice.aulas.repositories.ISedesRepository;
import com.cice.aulas.service.ISedesService;

@Service
public class SedesServiceImpl implements ISedesService {
	@Autowired
	ISedesRepository sedeRepository ;

	@Override
	public void agregarSede(Sede sede) {
		sedeRepository.save(sede);
	}
	
	@Override
	public Sede obtenerUltSede() {
		return null;
		//		return sedeRepository.findLastSede();
	}

	@Override
	public Sede consultarSede(int idSede) {
		Optional<Sede> sede = sedeRepository.findById(idSede);
		if (sede.isPresent()) {
			return sede.get();
		} else {
			return null;
		}
	}

	@Override
	public int borrarSede(int id) {
		sedeRepository.deleteById(id);
		return 0;
	}

	@Override
	public List<Sede> allSedes() {
		return sedeRepository.findAll();
	}

	@Override
	public String nombreSedePorCodSede(int idSede) {
		Sede sede = consultarSede(idSede);
		if(sede != null) {
			return sede.getNombre_sede();
		} else {
			return null;
		}
	}
}
