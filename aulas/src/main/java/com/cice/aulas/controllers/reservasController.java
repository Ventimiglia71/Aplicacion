package com.cice.aulas.controllers;

import java.time.LocalDate;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cice.aulas.entities.Aula;
import com.cice.aulas.entities.Reserva;
import com.cice.aulas.entities.Sede;
import com.cice.aulas.entities.TipOrd;
import com.cice.aulas.service.IAulasService;
import com.cice.aulas.service.IReservasService;
import com.cice.aulas.service.ISedesService;
import com.cice.aulas.service.ITipordService;

@Secured("ROLE_USER")
@Controller
public class reservasController {
	@Autowired
	ISedesService sedesService;
	@Autowired
	IAulasService aulasService;
	@Autowired
	IReservasService reservasService;
	@Autowired
	ITipordService tipordService;
	
	@GetMapping("/preReservaUnitaria")
	public ModelAndView preReservaUnitaria(	@RequestParam("modo") String modo,
											@RequestParam("mensaje") String mensaje) {
		//usuario
		String usuario = "albertorpon@gmail.com";
		
		//Obtenemos todas las aulas de la primera sede de la BBDD
		List<Aula> allAulas = aulasService.AllAulas(); 
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("usuario", usuario);
		mav.addObject("allAulas", allAulas);
		mav.addObject("modo", modo);
		mav.addObject("mensaje", mensaje);


		mav.setViewName("preReservaUnitaria");
		return mav;
	}

	@RequestMapping(value = "/reservaUnitaria", method = RequestMethod.GET)
	public String reservaUnitaria(
			@RequestParam("usuario") String usuario,
			@RequestParam("codAulaSelec") int codAulaSelec,
			@RequestParam("fechaDesde") @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate fechaDesde,
			@RequestParam("fechaHasta") @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate fechaHasta,
			@RequestParam("horaDesde") int horaDesde,
			@RequestParam("horaHasta") int horaHasta) {
		//Preparamos variables de trabajo
		String mensaje = "";
		String fechaDesdeTexto = fechaDesde.toString();
		String fechaHastaTexto = fechaHasta.toString();
		if(fechaHastaTexto.contains("9999-12-31")) {
			fechaHastaTexto = fechaDesdeTexto;
		}
		int anyoDesde	= Integer.parseInt(fechaDesdeTexto.substring(0, 4));
		int mesDesde	= Integer.parseInt(fechaDesdeTexto.substring(5,7));
		int diaDesde	= Integer.parseInt(fechaDesdeTexto.substring(8));
		int anyoHasta	= Integer.parseInt(fechaHastaTexto.substring(0, 4));
		int mesHasta	= Integer.parseInt(fechaHastaTexto.substring(5,7));
		int diaHasta	= Integer.parseInt(fechaHastaTexto.substring(8));
		
		if (anyoHasta 	< 	anyoDesde 		||
			(anyoHasta 	==  anyoDesde &&
			 mesHasta 	<	mesDesde	) 	||
			(anyoHasta 	==  anyoDesde &&
			 mesHasta 	==	mesDesde  &&
			 diaHasta	<	diaDesde)		||
			 horaHasta 	<	horaDesde		) {
			mensaje = "La fecha/hora hasta debe ser mayor o igual que la fecha/hora desde, nunca menor";
			if(fechaDesdeTexto.contains(fechaHastaTexto)) {
				return "redirect:/preReservaUnitaria?modo=0&mensaje=" + mensaje;
			} else {
				return "redirect:/preReservaUnitaria?modo=3&mensaje=" + mensaje;
			}
		}

		//Validamos que estén libres los registros que queremos grabar
		Boolean hayDatos = false;
		for (int i = anyoDesde; i < anyoHasta + 1; i++) {
			for (int j = mesDesde; j < mesHasta + 1; j++) {
				for (int k = diaDesde; k < diaHasta + 1; k++) {
					for (int l = horaDesde; l < horaHasta + 1; l++) {
						List<Reserva> comprobacion = reservasService.buscarVacios(i, j, k, codAulaSelec, l);
						if (comprobacion.size() != 0) {
							hayDatos = true;
							break;
						}
					}
				}
			}
		}
		
		if (!hayDatos) {
			System.out.println("NO HAY");
			//Creamos un bucle para grabar todas los días y horas que se hayan seleccionado
			for (int i = anyoDesde; i < anyoHasta + 1; i++) {
				for (int j = mesDesde; j < mesHasta + 1; j++) {
					for (int k = diaDesde; k < diaHasta + 1; k++) {
						for (int l = horaDesde; l < horaHasta + 1; l++) {
							if (diaSemana(k, j, i) != 7) {
								reservasService.grabarReserva(new Reserva(0, usuario, codAulaSelec, i, j, k, l));
							}
						}
					}
				}
			}
			mensaje = "Reserva grabada correctamente";
			if(fechaDesdeTexto.contains(fechaHastaTexto)) {
				return "redirect:/preReservaUnitaria?modo=1&mensaje=" + mensaje;
			} else {
				return "redirect:/preReservaUnitaria?modo=2&mensaje=" + mensaje;
			}
			
		} else {
			mensaje = "La reserva no es posible, AULA ya ocupada en estos horarios y fechas";
			if(fechaDesdeTexto.contains(fechaHastaTexto)) {
				return "redirect:/preReservaUnitaria?modo=0&mensaje=" + mensaje;
			} else {
				return "redirect:/preReservaUnitaria?modo=3&mensaje=" + mensaje;
			}
		}
	}
	
	@GetMapping("/preConsulta")
	public ModelAndView preConsulta() {
		//Obtenemos el año en el que estamos para ofrecerlo como opción y que no haya que teclearlo
		Calendar c1 = Calendar.getInstance();
		int anyoEnCurso = c1.get(Calendar.YEAR);
		String anyo = Integer.toString(anyoEnCurso);

		//Obtenemos todas las sedes para ponerlas en el desplegable para elegir una
		String usuario = "albertorpon@gmail.com";

		//Recuperamos todas las sedes para alimentar el combo para elegirlas
		List<Sede> sedes = sedesService.allSedes();
		int codSede = sedes.get(0).getCod_sede();
		
		//Recuperamos todos los tipos de ordenadores que hay para alimentar el combo para elegirlos
		List<TipOrd> tipos = tipordService.allTiposOrdenador();
		int codTipo = tipos.get(0).getCod_tipord();
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("usuario", usuario);
		mav.addObject("anyo", anyo);
		mav.addObject("sedes", sedes);
		mav.addObject("codSede", codSede);
		mav.addObject("tipos", tipos);
		mav.addObject("codTipo", codTipo);

		mav.setViewName("preConsulta");
		return mav;
	}
	
	@GetMapping("/reserva")
	public ModelAndView reserva(@RequestParam(required = true) String usuario,
								@RequestParam(required = true) int sedeSelec,
								@RequestParam(required = true) int tipoElegido,
								@RequestParam(required = true) int numPuestos) {
		//Recuperamos todas las sedes para alimentar el combo para elegirlas
		List<Sede> sedes = sedesService.allSedes();
		
		//Indicamos cual es la sede elegida
		int codSede = sedeSelec;

		//Recuperamos todos los tipos de ordenadores que hay para alimentar el combo para elegirlos
		List<TipOrd> tipos = tipordService.allTiposOrdenador();
		int codTipo = tipoElegido;
		
		//Obtenemos todas las aulas de la primera sede de la BBDD
		List<Aula> seleccionAulas = aulasService.seleccionAulas(sedeSelec, tipoElegido, numPuestos); 
		// Si ningún aula cumple los requisitos devolvemos ese mensaje
		if(seleccionAulas.size() == 0) {
			Aula noHayAula = new Aula(0, "No hay Aula Disp.", 0, 0, 0, 0, 0);
			seleccionAulas.add(noHayAula);
		}

		ModelAndView mav = new ModelAndView();
		
		mav.addObject("usuario", usuario);
		mav.addObject("sedes", sedes);
		mav.addObject("codSede", codSede);
		mav.addObject("tipos", tipos);
		mav.addObject("codTipo", codTipo);
		mav.addObject("numPuestos", numPuestos);
		mav.addObject("seleccionAulas", seleccionAulas);
		
		mav.setViewName("reserva");
		return mav;
	}

	@GetMapping("/calendario")
	public ModelAndView calendario(	@RequestParam(required = true) String usuario,
									@RequestParam(required = true) int sedeSelec,
									@RequestParam(required = true) int tipoElegido,
									@RequestParam(required = true) int numPuestos,
									@RequestParam(required = true) int aulaSelec,
									@RequestParam(required = true) int anoSelec,
									@RequestParam(required = true) int mesSelec) {
		//Recuperamos todas las sedes para alimentar el combo para elegirlas
		List<Sede> sedes = sedesService.allSedes();
		
		//Indicamos cual es la sede elegida
		int codSede = sedeSelec;

		//Recuperamos todos los tipos de ordenadores que hay para alimentar el combo para elegirlos
		List<TipOrd> tipos = tipordService.allTiposOrdenador();

		//Indicamos cual es el tipo de ordenador elegido
		int codTipo = tipoElegido;
		
		//Obtenemos todas las aulas de la primera sede de la BBDD
		List<Aula> seleccionAulas = aulasService.seleccionAulas(sedeSelec, tipoElegido, numPuestos); 
		
		//Indicamos cual es el aula elegida
		int codAula = aulaSelec;
		
		//Montamos el mes requerido completo con las marcas de reservadas o no
		int diasMes = 0;
		if (mesSelec == 1 || mesSelec == 3 || mesSelec == 5 || mesSelec == 7 || mesSelec == 8 || mesSelec == 10 || mesSelec == 12) {
			diasMes = 31;
			System.out.println("31");
		} else if (mesSelec == 4 || mesSelec == 6 || mesSelec == 9 || mesSelec == 11) {
			diasMes = 30;
		} else if (anoSelec % 2020 == 0) {
			diasMes = 29;
		} else {
			diasMes = 28;
		}
		
		//Creamos la tabla del mes completo con todas sus horas y la iniciamos a no reservada (false)
		boolean[][] reservado = new boolean[diasMes + 1][14];
		for (int i = 1; i < diasMes + 1; i++) {
			for (int j = 1; j < 14; j++) {
				reservado[i][j] = false;
			}
		}

		//Vamos a buscar las reservas que hay hechas con los datos introducidos
		List<Reserva> reservasHechas = reservasService.reservasHechas(aulaSelec, anoSelec, mesSelec);
		
		//revisamos las reservas recuperadas y actualizamos como true en la tabla del mes
		for (Reserva reserva : reservasHechas) {
			reservado[reserva.getDia()][reserva.getHora() - 8] = true;
		}
			
		//Conseguimos el nombre del mes
		String mesNombre = nombreMes(mesSelec - 1);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("usuario", usuario);
		mav.addObject("sedes", sedes);
		mav.addObject("codSede", codSede);
		mav.addObject("tipos", tipos);
		mav.addObject("codTipo", codTipo);
		mav.addObject("numPuestos", numPuestos);
		mav.addObject("anoSelec", anoSelec);
		mav.addObject("seleccionAulas", seleccionAulas);
		mav.addObject("codAula", codAula);
		mav.addObject("diasMes", diasMes);
		mav.addObject("reservado", reservado);
		mav.addObject("mesNombre", mesNombre);
		
		mav.setViewName("calendario");
		return mav;
	}

	int diaSemana (int dia, int mes, int ano)
	   {
	    int diaSem = 0;
	    int nD = 0;
	    Calendar c = Calendar.getInstance();

	    c.set(ano, mes, dia);
	    nD=c.get(Calendar.DAY_OF_WEEK) - 4; 
	    System.out.println(nD);
	    switch (nD){
	        case 1: diaSem = 1;
	            break;
	        case 2: diaSem = 2;
	            break;
	        case 3: diaSem = 3;
	            break;
	        case -3: diaSem = 4;
	            break;
	        case -2: diaSem = 5;
	            break;
	        case -1: diaSem = 6;
	            break;
	        case 0: diaSem = 7;
	            break;
	    }

	    return diaSem;
	}
	
	String nombreMes(int month) {
		String result = "";
		
		switch(month){
		  case 0:
		    {
		      result="Enero";
		      break;
		    }
		  case 1:
		    {
		      result="Febrero";
		      break;
		    }
		  case 2:
		    {
		      result="Marzo";
		      break;
		    }
		  case 3:
		    {
		      result="Abril";
		      break;
		    }
		  case 4:
		    {
		      result="Mayo";
		      break;
		    }
		  case 5:
		    {
		      result="Junio";
		      break;
		    }
		  case 6:
		    {
		      result="Julio";
		      break;
		    }
		  case 7:
		    {
		      result="Agosto";
		      break;
		    }
		  case 8:
		    {
		      result="Septiembre";
		      break;
		    }
		  case 9:
		    {
		      result="Octubre";
		      break;
		    }
		  case 10:
		    {
		      result="Noviembre";
		      break;
		    }
		  case 11:
		    {
		      result="Diciembre";
		      break;
		    }
		  default:
		    {
		      result="Error";
		      break;
		    }
		}
		return result;
	}
}
