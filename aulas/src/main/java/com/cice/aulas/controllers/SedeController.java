package com.cice.aulas.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cice.aulas.entities.Sede;
import com.cice.aulas.service.ISedesService;

@Secured("ROLE_ADMIN")
@Controller
public class SedeController {
	private static final int ID_NULO = 0;
	private static final String OPERACION_OK = "Operación realizada correctamente.";
	
	@Autowired
	private ISedesService servicio;
	
	// Captura los datos de la sede para el alta.
	@GetMapping("/admin/prepararAddSede")
	public String prepararAddSede() {
		return "agregarSede";
	}
	
	// Realiza el alta y muestra los datos junto con el código generado.
	@GetMapping("/admin/addSede")
	public ModelAndView addSede(@RequestParam(name="nombre", required = true) String nombre_sede,
						  		@RequestParam(required = true) String direccion,
						  		@RequestParam(required = true) String telefono,
						  		@RequestParam(name="numaulas", required = true) int num_aulas) {
		Sede sede = new Sede(ID_NULO, nombre_sede, direccion, telefono, num_aulas);
		servicio.agregarSede(sede);
		
		// Recupera el último registro que corresponde al alta realizada.
		Sede ultSede = servicio.obtenerUltSede();
		ModelAndView mav = new ModelAndView();
		String mensaje = OPERACION_OK;
		mav.addObject("mensaje", mensaje);
		mav.addObject("sede", ultSede);
		mav.setViewName("mostrarDatosSede");
		return mav;
	}
	
	// Muestra los datos de una Sede.
	@GetMapping("/admin/mostrarDatosSede")
	public String mostrarDatosSede(@RequestParam String mensaje) {
		return "mostrarDatosSede";
	}	
	
	// Captura el código de la sede a buscar.
	@GetMapping("/admin/prepararFindSede")
	public String prepararFindSede() {
		return "buscarSede";
	}
	
	// Muestra los datos de la sede a modificar.
	@GetMapping("/admin/findSede")
	public ModelAndView findSede(@RequestParam(name="codigo", required = true) int cod_sede){
		ModelAndView mav = new ModelAndView();
		Sede sede = servicio.consultarSede(cod_sede);
		
		// Si no existe el código muestra un mensaje de error; si no, muestra los datos de la sede.
		if(sede == null) {
			boolean existeSede = false;
			boolean primeraVez = true;
			mav.addObject("existesede", existeSede);
			mav.addObject("primeravez", primeraVez);
			mav.addObject("codigo", cod_sede);
			mav.setViewName("buscarSede");
		} else {
			mav.addObject("sede", sede);
			mav.setViewName("modificarSede");
		}
		return mav;
	}
	
	// Modifica los datos de una sede y retorna al listado de sedes.
	@GetMapping("/admin/modifSede")
	public String modifSede(@RequestParam(name="codigo", required = true) int cod_sede,		
					        @RequestParam(name="nombre", required = true) String nombre_sede,
 			        	    @RequestParam(required = true) String direccion,
					        @RequestParam(required = true) String telefono,
					        @RequestParam(name="numaulas", required = true) int num_aulas){
		Sede sede = new Sede(cod_sede, nombre_sede, direccion, telefono, num_aulas);
		servicio.agregarSede(sede);		
		return "redirect:/admin/findAllSedes";
	}
	
	// Muestra un listado con todas las sedes.
	@GetMapping("/admin/findAllSedes")
	public ModelAndView findAllSedes(){
		ModelAndView mav = new ModelAndView();
		List<Sede> sedes = servicio.allSedes();
		mav.setViewName("mostrarSedes");
		mav.addObject("sedes", sedes);
		return mav;
	}
	
	// Borra una sede desde el listado y retorna a éste de nuevo.
	@GetMapping("/admin/deleteSede")
	public String deleteSede(@RequestParam(required = true) int idSede){
		servicio.borrarSede(idSede);
		return "redirect:/admin/findAllSedes";
	}
}
