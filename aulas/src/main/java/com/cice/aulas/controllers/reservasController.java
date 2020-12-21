package com.cice.aulas.controllers;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cice.aulas.entities.Aula;
import com.cice.aulas.entities.Sede;
import com.cice.aulas.service.IAulasService;
import com.cice.aulas.service.ISedesService;

@Controller
public class reservasController {
	@Autowired
	ISedesService sedesService;
	@Autowired
	IAulasService aulasService;
	
	@GetMapping("/preReserva")
	public ModelAndView preReserva() {
		//Obtenemos el año en el que estamos para poner como placeholder de la variable año a seleccionar
		Calendar c1 = Calendar.getInstance();
		int anyoNum = c1.get(Calendar.YEAR);
		String anyo = Integer.toString(anyoNum);
		
		//Obtenemos todas las sedes para ponerlas en el desplegable para elegir una
		List<Sede> sedes = sedesService.allSedes();
		int codSede = sedes.get(0).getCod_sede();
		
		//Obtenemos todas las aulas de la primera sede de la BBDD
		List<Aula> aulasXSede = aulasService.aulasPorSede(sedes.get(0).getCod_sede()); 
		//quitar
		for (Aula aula : aulasXSede) {
			System.out.println("Aula: " + aula);
		}
		//quitar
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("anyo", anyo);
		mav.addObject("sedes", sedes);
		mav.addObject("sedeElegida", codSede);
		mav.addObject("aulasXSede", aulasXSede);

		mav.setViewName("preReserva");
		return mav;
	}

	@GetMapping("/cambiaSede")
	public ModelAndView cambiaSede(@RequestParam(required = true) int codSede) {
		//Obtenemos el año en el que estamos para poner como placeholder de la variable año a seleccionar
		Calendar c1 = Calendar.getInstance();
		int anyoNum = c1.get(Calendar.YEAR);
		String anyo = Integer.toString(anyoNum);
		
		//Obtenemos todas las sedes para ponerlas en el desplegable para elegir una
		List<Sede> sedes = sedesService.allSedes();
		
		//Obtenemos todas las aulas de la sede elegida
		List<Aula> aulasXSede = aulasService.aulasPorSede(codSede);
		//quitar
		for (Aula aula : aulasXSede) {
			System.out.println("Aula: " + aula);
		}
		//quitar
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("anyo", anyo);
		mav.addObject("sedes", sedes);
		mav.addObject("sedeElegida", codSede);
		mav.addObject("aulasXSede", aulasXSede);

		mav.setViewName("preReserva");
		return mav;
	}
}
