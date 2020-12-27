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
		Reserva reserva = new Reserva(0, 2020, 1, 1, 3, "alberto", 0, 0);
		reservaRepo.save(reserva);
		reserva = new Reserva(0, 2020, 1, 2, 3, "alberto", 0, 0);
		reservaRepo.save(reserva);
	}

}
