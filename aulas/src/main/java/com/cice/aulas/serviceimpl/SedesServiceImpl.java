package com.cice.aulas.serviceimpl;

/**
 * SedesServiceImpl es la clase que contiene los servicios necesarios para 
 * la gestión de la clase Sede.
 */

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

	/**
	 * Graba el registro de una nueva sede en la base de datos.
	 * @param sede Contiene los datos de la nueva sede.
	 */
	@Override
	public void agregarSede(Sede sede) {
		sedeRepository.save(sede);
	}
	
	/**
	 * Recupera el último registro de la tabla "sedes".
	 * @return Retorna la última sede que se encuentra en la tabla "sedes".
	 */	
	@Override
	public Sede obtenerUltSede() {
		return sedeRepository.findLastSede();
	}

	/**
	 * Consulta los datos de una sede a partir de su código si dicha sede existe.
	 * @return Retorna los datos de la sede consultada.
	 */
	@Override
	public Sede consultarSede(int idSede) {
		Optional<Sede> sede = sedeRepository.findById(idSede);
		if (sede.isPresent()) {
			return sede.get();
		} else {
			return null;
		}
	}

	/**
	 * Borra el registro de una sede a partir de su código.
	 * @return 0 indicando que se ha realizado correctamente.
	 */
	@Override
	public int borrarSede(int id) {
		sedeRepository.deleteById(id);
		return 0;
	}

	/**
	 * Devuelve un listado de todas las sedes dadas de alta en el sistema.
	 * @return Listado de todas las sedes.
	 */
	@Override
	public List<Sede> allSedes() {
		return sedeRepository.findAll();
	}

	/**
	 * Devuelve el nombre de una sede a partir de su código si dicha sede existe.
	 * @param idSede Código de la sede de la que obtener el nombre.
	 * @return Nombre de la sede si existe.
	 */
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
