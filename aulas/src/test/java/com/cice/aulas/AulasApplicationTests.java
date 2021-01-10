package com.cice.aulas;


import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.cice.aulas.entities.Reserva;
import com.cice.aulas.repositories.IReservasRepository;

@SpringBootTest
class AulasApplicationTests {
	@Autowired
	IReservasRepository reservaRepo;

	@Test
	void pruGrabarReserva() {
		Reserva reserva = new Reserva(0, "Alberto", 3, 2021, 1, 1, 9);
		reservaRepo.save(reserva);
		reserva = new Reserva(0, "Alberto", 3, 2021, 1, 1, 9);
		reservaRepo.save(reserva);
	} 
	
	
	
/*  *** Pruebas unitarias de SEDES *** 	
	@Autowired
	ISedeRepository sedeRepository;
	
	@Autowired
	ISedesService sedesServicio;
	
	// Prueba de conexión a la BD.
	@Test
	void listarSedes() {
		List<Sede> lista = sedeRepository.findAll();
		for(Sede sede : lista) {
			System.out.println("**** Sede: " + sede.toString());
		}
	}
		
	// Prueba para comprobar la búsqueda de un registro.
	@Test
	void consultarSede() {
		int idSede = 1;
		Optional<Sede> sede = sedeRepository.findById(idSede);
		System.out.println("**** Sede consultada:" + sede.toString());
	}
	
	// Prueba para comprobar el servicio que devuelve el nombre de una sede a partir de su código.
	@Test
	void nombreSede(){
		int codSede = 1;
		String nombre = sedesServicio.nombreSedePorCodSede(codSede);
		System.out.println("********** Nombre: " + nombre);
	}
	*/
}
