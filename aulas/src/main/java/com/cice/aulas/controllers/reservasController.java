package com.cice.aulas.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cice.aulas.entities.Aula;
import com.cice.aulas.entities.Reserva;
import com.cice.aulas.entities.Sede;
import com.cice.aulas.service.IAulasService;
import com.cice.aulas.service.IReservasService;
import com.cice.aulas.service.ISedesService;

@Controller
public class reservasController {
	@Autowired
	ISedesService sedesService;
	@Autowired
	IAulasService aulasService;
	@Autowired
	IReservasService reservasService;
	
	@GetMapping("/preReserva")
	public ModelAndView preReserva() {
		//Obtenemos todas las sedes para ponerlas en el desplegable para elegir una
		List<Sede> sedes = sedesService.allSedes();
		int codSede = sedes.get(0).getCod_sede();
		
		//Obtenemos todas las aulas de la primera sede de la BBDD
		List<Aula> aulasXSede = aulasService.aulasPorSede(sedes.get(0).getCod_sede()); 
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("sedes", sedes);
		mav.addObject("sedeElegida", codSede);
		mav.addObject("aulasXSede", aulasXSede);

		mav.setViewName("preReserva");
		return mav;
	}

	@GetMapping("/cambiaSede")
	public ModelAndView cambiaSede(	@RequestParam(required = true) int anyo,
									@RequestParam(required = true) int codSede) {
		//Obtenemos todas las sedes para ponerlas en el desplegable para elegir una
		List<Sede> sedes = sedesService.allSedes();
		
		//Obtenemos todas las aulas de la sede elegida
		List<Aula> aulasXSede = aulasService.aulasPorSede(codSede);
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("anyo", anyo);
		mav.addObject("sedes", sedes);
		mav.addObject("sedeElegida", codSede);
		mav.addObject("aulasXSede", aulasXSede);

		mav.setViewName("preReserva");
		return mav;
	}

	@GetMapping("/reserva")
	public ModelAndView reserva(@RequestParam(required = true) String anoSelec,
								@RequestParam(required = true) String usuario,
								@RequestParam(required = true) int sedeSelec,
								@RequestParam(required = true) int aulaSelec) {
		ModelAndView mav = new ModelAndView();
		
		//Si han rellenado el año seguimos con el proceso
		if (anoSelec.length() > 1) {
			//Revisamos si existe el calendario para los datos solicitados por el usuario
			List<Reserva> reservasAula = reservasService.existeAnyoAula(Integer.parseInt(anoSelec) , aulaSelec);
			//Si hay datos, continuamos mostrando el calendario por pantalla, si no hay, los creamos.
			if (reservasAula.size() == 0) {
				for (int i = 1; i < 13; i++) {
					for (int j = 1; j < 32; j++) {
						reservasService.grabarReserva(new Reserva(0, Integer.parseInt(anoSelec), i, j, aulaSelec, usuario, 0, 0));
						if (i == 2) {
							if (Integer.parseInt(anoSelec) % 2020 == 0) {
								if (j > 28) {
									j = 99;
								} 
							} else {
								if (j > 27) {
									j= 99;
								}
							}
						}
						if ((i == 4 || i == 6 || i == 9 || i == 11) && j > 29) {
							j = 99;
						}
					}
				}
				reservasAula = reservasService.existeAnyoAula(Integer.parseInt(anoSelec) , aulaSelec);
			}
			String nombreSede = sedesService.nombreSedePorCodSede(sedeSelec);
			String nombreAula = aulasService.nombreAulaPorCodAula(aulaSelec);

			mav.addObject("anoSelec", anoSelec);
			mav.addObject("usuario", usuario);
			mav.addObject("nombreSede", nombreSede);
			mav.addObject("nombreAula", nombreAula);
			mav.addObject("reservasAula", reservasAula);

			mav.setViewName("reserva");
			return mav;
		//Si no se ha rellenado el año damos error
		} else {

			String texto = "No ha introducido el año, por favor, introdúzcalo";
			String ruta = "/aulas/preReserva";

			mav.addObject("texto", texto);
			mav.addObject("ruta", ruta);
			
			mav.setViewName("mensaje");
			return mav;
		}
	}

}
