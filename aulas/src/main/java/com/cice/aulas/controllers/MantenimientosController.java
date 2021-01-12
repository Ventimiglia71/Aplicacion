package com.cice.aulas.controllers;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MantenimientosController {
	
	@Secured("ROLE_USER")
	@GetMapping("/")
	public ModelAndView mantenimiento() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mantenimiento");
		return mav;
	}
	
	@Secured("ROLE_ADMIN")
	@GetMapping("/admin")
	public ModelAndView mantenimientoAdmin() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mantenimientoAdmin");
		return mav;
	}
	
}
