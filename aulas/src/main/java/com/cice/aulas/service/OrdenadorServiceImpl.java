package com.cice.aulas.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cice.aulas.entities.Ordenador;
import com.cice.aulas.repositories.IOrdenadorRepository;

@Service
public class OrdenadorServiceImpl implements IOrdenadorService {
	@Autowired
	IOrdenadorRepository repository;

	@Override
	public void createOrdenador(Ordenador ordenador) {
		repository.save(ordenador);
	}

	@Override
	public List<Ordenador> findAll() {
		return repository.findAll();
	}

	@Override
	public void addOrdenador(Ordenador o) {
		// TODO Auto-generated method stub

	}

	@Override
	public Ordenador findByTipo_ordenador(String tipo_ordenador) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteOrdenador(int cod_ordenador) {
		repository.deleteById(cod_ordenador);

	}
	

	@Override
	public void findByCod_ordenador(int cod_ordenador) {
	/*	Optional<Ordenador> ordenador = repository.findById(cod_ordenador);
		if (ordenador.isPresent()) {
			return ordenador.get();
		} else {
			return null;
		}  */
		
		repository.findById(cod_ordenador);
	}

	@Override
	public Ordenador findById(int cod_ordenador)
	{
		return null;
	}

	@Override
	public void updateOrdenador(int cod_ordenador) {
		// TODO Auto-generated method stub
		
	}

}
