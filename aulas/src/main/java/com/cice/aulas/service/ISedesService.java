package com.cice.aulas.service;

/**
 * ISedesService es una interface con los servicios necesarios para gestionar
 * todo el mantenimiento de la clase Sede.
 */

import java.util.List;

import com.cice.aulas.entities.Sede;

public interface ISedesService {
	public void agregarSede(Sede sede);
	public Sede consultarSede(int codSede);
	public int borrarSede(int id);
	public List<Sede> allSedes();
	public Sede obtenerUltSede();
	public String nombreSedePorCodSede(int codSede);
}
