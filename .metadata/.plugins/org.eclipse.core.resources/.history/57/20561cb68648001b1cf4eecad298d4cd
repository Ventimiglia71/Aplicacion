package com.cice.aulas.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cice.aulas.entities.Ordenador;
import com.cice.aulas.service.IOrdenadorService;

@Controller
public class OrdenadorController {
	@Autowired
	IOrdenadorService ordenadorservice;

	/*
	 * @GetMapping("/altaordenador") public ModelAndView OrdenadorController() {
	 * ModelAndView mav = new ModelAndView(); mav.setViewName("prueba"); return mav;
	 */

	@GetMapping("/altaordenador")
	public String inicioCrear() {
		return "crearOrdenador";
	}

	@RequestMapping(value = "/altaordenador", method = RequestMethod.POST)
	public String crearOrdenador(@RequestParam("tipo_ordenador") String tipo_ordenador,
			@RequestParam("tamano_pant") String tamano_pant, @RequestParam("cpu") String cpu,
			@RequestParam("ram") String ram) {
		Ordenador o = new Ordenador(0, tipo_ordenador, tamano_pant, cpu, ram);
		ordenadorservice.createOrdenador(o);
		return ("crearOrdenador");
	}

	@GetMapping("/findAllOrdenador")
	public ModelAndView findAllOrdenadores() {
		ModelAndView mav = new ModelAndView();
		List<Ordenador> ordenadores = ordenadorservice.findAll();
		mav.setViewName("mostrarOrdenador");
		mav.addObject("ordenadores", ordenadores);
		return mav;
	}

	@RequestMapping(value = "/preModificar", method = RequestMethod.GET)
	public ModelAndView preModificar(
			@RequestParam("cod_ordenador") int cod_ordenador,
			@RequestParam("tipo_ordenador") String tipo_ordenador,
			@RequestParam("tamano_pant") String tamano_pant, 
			@RequestParam("cpu") String cpu,
			@RequestParam("ram") String ram) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("cod_ordenador", cod_ordenador);
		mav.addObject("tipo_ordenador", tipo_ordenador);
		mav.addObject("tamano_pant", tamano_pant);
		mav.addObject("cpu", cpu);
		mav.addObject("ram", ram);
		
		mav.setViewName("preModificar");
		
		return mav;
		
	}

	@GetMapping("/modificarOrdenador")
	public String modificarOrdenador(
			@RequestParam("cod_ordenador") int cod_ordenador,
			@RequestParam("tipo_ordenador") String tipo_ordenador,
			@RequestParam("tamano_pant") String tamano_pant, 
			@RequestParam("cpu") String cpu,
			@RequestParam("ram") String ram) {

		Ordenador o = new Ordenador(cod_ordenador, tipo_ordenador, tamano_pant, cpu, ram);
		System.out.println("Hola");
		ordenadorservice.createOrdenador(o);
		return "redirect:/findAllOrdenador";
	}

	@GetMapping("/borrarordenador")
	public String borrarOrdenador(@RequestParam(required = true) int cod_ordenador) {
		ordenadorservice.deleteOrdenador(cod_ordenador);
		return "redirect:/findAllOrdenador";
	}

}
