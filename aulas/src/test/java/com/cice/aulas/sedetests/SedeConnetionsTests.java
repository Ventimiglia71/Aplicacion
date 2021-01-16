package com.cice.aulas.sedetests;

import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.cice.aulas.entities.Sede;
import com.cice.aulas.repositories.ISedesRepository;

/**
 * SedeConnetionsTests es una clase que contiene pruebas unitarias para comprobar
 * distintas conexiones a la tabla "sedes" de la base de datos.
 *
 */

@SpringBootTest
public class SedeConnetionsTests {
	private static final int ID_SEDE = 2;
	
	@Autowired
	ISedesRepository sedeRepository;
		
	/**
	 * listarSedes() es el primer método ejecutado tras la creación de la base de datos.
	 * Con él se comprueba que se accede a la tabla "sedes" correctamente y que se
	 * pueden recuperar todos los registros visualizándolos en la consola.
	 */
	@Test
	void listarSedes() {
		List<Sede> lista = sedeRepository.findAll();
		System.out.println();
		for(Sede sede : lista) {
			System.out.println("**** Sede: " + sede.toString());
		}
		System.out.println();
	}
		
	/**
	 * consultarSede() es un método que además de comprobar que se accede bien a la base
	 * de datos es capaz de devolver un registro determinado por su código (ID_SEDE).
	 */
	@Test
	void consultarSede() {
		int idSede = ID_SEDE;
		Optional<Sede> sede = sedeRepository.findById(idSede);
		System.out.println();
		if (sede.isPresent()) {	
			System.out.println("**** Sede consultada:" + sede.toString());
		} else {
			System.out.println("**** No existe sede con código " + ID_SEDE); 
		}
		System.out.println();
	}
}
