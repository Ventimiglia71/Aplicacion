package com.cice.aulas.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cice.aulas.entities.Equipamiento;
import com.cice.aulas.service.IEquipamientoService;

@Secured("ROLE_ADMIN")
@Controller
public class EquipoControlador {
	
	@Autowired
	IEquipamientoService equipoServicio;
	
	@GetMapping("admin/AgregarEquipamiento")
	public String iniciarAgregarEquipamiento() {
		return "AgregarEquipamiento";
		
	}
	
	@RequestMapping(value = "admin/grabarEquipamiento", method = RequestMethod.GET)
	public String grabarEquipamiento(
			@RequestParam("nombre_equipo") String nombre,
			@RequestParam("descripcion") String descripcion)
	{
		Equipamiento equipo = new Equipamiento(nombre,descripcion);
		equipoServicio.addEquipo(equipo);
		return ("AgregarEquipamiento");
	}
	
	@GetMapping("admin/ListadoEquipo")
	public ModelAndView listaEquipos() {
		List<Equipamiento> equipamiento = equipoServicio.listaEquipos();
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("equipamiento", equipamiento);
		mav.setViewName("ListadoEquipo");
		return mav;
	}
	@GetMapping("admin/preModificarEquipo")
	public ModelAndView editar(@RequestParam("id") Integer id) {
		Equipamiento equipo=equipoServicio.listarId(id);

		ModelAndView mav = new ModelAndView();
		
		mav.addObject("id", id);
		mav.addObject("nombre", equipo.getNombre_equipo());
		mav.addObject("descripcion", equipo.getDescripcion());
		mav.setViewName("ModificarEquipo");
		return mav;
	}
	
	@RequestMapping(value = "admin/modificarEquipamiento", method = RequestMethod.GET)
	public String modificarEquipamiento(
			@RequestParam("id") int id,
			@RequestParam("nombre_equipo") String nombre,
			@RequestParam("descripcion") String descripcion)
	{

		Equipamiento equipo = new Equipamiento(id, nombre, descripcion);
		equipoServicio.addEquipo(equipo);
		return "redirect:ListadoEquipo";
	}
	

	@GetMapping("admin/eliminar")
	public String delete(@RequestParam(required = true) int id) {
		
		equipoServicio.delete(id);
		return "redirect:ListadoEquipo";
	}
	
}

