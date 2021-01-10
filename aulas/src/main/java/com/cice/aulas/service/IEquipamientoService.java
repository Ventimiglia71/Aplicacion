package com.cice.aulas.service;

import java.util.List;

import com.cice.aulas.entities.Equipamiento;

public interface IEquipamientoService {
	
	public Equipamiento findByCodEquipo(int cod_equipo);
	public List<Equipamiento> findAll();
	public List<Equipamiento> listaEquipos();
	public Equipamiento listarId(int id);
	public Equipamiento addEquipo(Equipamiento equipo);
	public void delete(int id);	

}
