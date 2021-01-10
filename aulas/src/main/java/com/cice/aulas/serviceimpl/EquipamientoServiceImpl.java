package com.cice.aulas.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cice.aulas.entities.Equipamiento;
import com.cice.aulas.repositories.IEquipamientoRepository;
import com.cice.aulas.service.IEquipamientoService;

@Service
public class EquipamientoServiceImpl implements IEquipamientoService  {
	
	@Autowired
	IEquipamientoRepository repository;

	@Override
	public Equipamiento findByCodEquipo(int cod_equipo) {
		return repository.findByCodEquipo(cod_equipo);
	}

	@Override
	public List<Equipamiento> findAll() {
		return repository.findAll();
	}
	
}
