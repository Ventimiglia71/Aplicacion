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

/**
 * Controlador que gestiona el mantenimiento de sedes.
 */

@Secured("ROLE_ADMIN")
@Controller
public class SedeController {
	private static final int ID_NULO = 0;
	private static final String OPERACION_OK = "Operación realizada correctamente.";
	
	@Autowired
	private ISedesService servicio;
	
	/**
	 * Muestra la pantalla de captura de datos para una nueva sede.
	 * @return La pantalla de captura de datos de la nueva sede.
	 */
	@GetMapping("/admin/prepararAddSede")
	public String prepararAddSede() {
		return "agregarSede";
	}
	
	/**
	 * Graba una nueva sede con los datos recogidos desde la pantalla de captura de datos y con el 
	 * código generado por el sistema.
	 * @param nombre_sede Nombre de la sede.
	 * @param direccion Dirección donde se encuentra la sede.
	 * @param telefono Teléfono de la sede.
	 * @param num_aulas Número de aulas existentes en la sede.
	 * @return La vista preparada con los datos de la nueva sede así como con un mensaje 
	 * informando que la operación se realizó con correctamente.
	 */
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
	
	/**
	 * Muestra los datos de una sede y un mensaje informando sobre la ejecución satisfactoria 
	 * de una operación.
	 * @param mensaje Mensaje informativo que la operación se realizó satisfactoriamente.
	 * @return La pantalla con la información de la sede y el mensaje.
	 */
	@GetMapping("/admin/mostrarDatosSede")
	public String mostrarDatosSede(@RequestParam String mensaje) {
		return "mostrarDatosSede";
	}	
	
	/**
	 * Muestra la pantalla de captura de código de una sede para buscarla en la base de datos.
	 * @return La pantalla para capturar el código.
	 */
	@GetMapping("/admin/prepararFindSede")
	public String prepararFindSede() {
		return "buscarSede";
	}
	
	/**
	 * Busca una sede a partir de su código.
	 * @param cod_sede Código de la sede a modificar.
	 * @return O bien la pantalla de petición de código de nuevo si el código no existe
	 * o bien la pantalla en la que se mostrarán los datos actuales de la sede susceptibles
	 * de ser modificados.
	 */
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
	
	/**
	 * Modifica los datos de una sede previamente buscada.
	 * @param cod_sede código de la sede (inaccesible).
	 * @param nombre_sede Nombre de la sede.
	 * @param direccion Dirección donde se encuentra la sede.
	 * @param telefono Teléfono de la sede.
	 * @param num_aulas Número de aulas existentes en la sede.
	 * @return El redireccionamiento al listado de sedes.
	 */
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
	
	/**
	 * Muestra un listado con todas la sedes dadas de alta en el sistema.
	 * @return La pantalla con el listado de sedes.
	 */
	@GetMapping("/admin/findAllSedes")
	public ModelAndView findAllSedes(){
		ModelAndView mav = new ModelAndView();
		List<Sede> sedes = servicio.allSedes();
		mav.setViewName("mostrarSedes");
		mav.addObject("sedes", sedes);
		return mav;
	}
	
	/**
	 * Borra una sede del sistema desde el listado de sedes.
	 * @param idSede Código de la sede.
	 * @return El redireccionamiento al listado de sedes actualizado.
	 */
	@GetMapping("/admin/deleteSede")
	public String deleteSede(@RequestParam(required = true) int idSede){
		servicio.borrarSede(idSede);
		return "redirect:/admin/findAllSedes";
	}
}
