package com.cice.aulas.service;

import java.util.List;

import com.cice.aulas.entities.Sede;

public interface ISedeServices {
	public void agregarSede(Sede sede);
	public Sede consultarSede(int id);
	public int borrarSede(int id);
	public List<Sede> listarSedes();
	public Sede obtenerUltSede();
}
