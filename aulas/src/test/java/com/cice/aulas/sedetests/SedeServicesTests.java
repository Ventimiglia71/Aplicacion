package com.cice.aulas.sedetests;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.cice.aulas.entities.Sede;
import com.cice.aulas.service.ISedesService;

/**
 * SedeServicesTests es una clase que contiene pruebas unitarias para comprobar
 * distintos servicios para la clase Sede.
 *
 */

@SpringBootTest
public class SedeServicesTests {
	private static final int ID_SEDE = 1;
	
	@Autowired
	ISedesService sedesServicio;

	/**
 	 * obtenerUltimaSede() es un servicio que devuelve la última sede contenida en la tabla "sedes".
	 * Servicio incluido en el controlador.	 
	 */
	@Test
	void obtenerUltimaSede(){
		Sede sede = sedesServicio.obtenerUltSede();
		System.out.println();
		System.out.println("********** Última sede: " + sede.toString());
		System.out.println();
	}
	
	/**
	 * nombreSede() es un servicio que devuelve el nombre de una sede a partir de su código.
	 * Servicio no incluido en el controlador.
	 */
	@Test
	void nombreSede(){
		int codSede = ID_SEDE;
		String nombre = sedesServicio.nombreSedePorCodSede(codSede);
		System.out.println();
		System.out.println("********** Nombre: " + nombre);
		System.out.println();
	}
}
