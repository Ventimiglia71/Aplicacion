package com.cice.aulas.serviceimpl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cice.aulas.entities.Sede;
import com.cice.aulas.repositories.ISedeRepository;
import com.cice.aulas.service.ISedeServices;

@Service
public class SedeServicesImpl implements ISedeServices {
	@Autowired
	ISedeRepository sedeRepository ;

	@Override
	public void agregarSede(Sede sede) {
		sedeRepository.save(sede);
	}
	
	@Override
	public Sede obtenerUltSede() {
		return sedeRepository.findLastSede();
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
	public List<Sede> listarSedes() {
		return sedeRepository.findAll();
	}
}
