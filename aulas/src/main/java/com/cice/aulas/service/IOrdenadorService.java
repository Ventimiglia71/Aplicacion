package com.cice.aulas.service;

import java.util.List;

import com.cice.aulas.entities.Ordenador;

public interface IOrdenadorService {
	public void createOrdenador(Ordenador ordenador);
	public List<Ordenador> findAll();
	void addOrdenador(Ordenador o);
	Ordenador findByTipo_ordenador(String tipo_ordenador);
	void findByCod_ordenador(int cod_ordenador);
	void deleteOrdenador(int cod_ordenador);
	void updateOrdenador(int cod_ordenador);
	Ordenador findById(int cod_ordenador); 
}
