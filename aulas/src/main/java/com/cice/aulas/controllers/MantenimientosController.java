package com.cice.aulas.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MantenimientosController {

	@GetMapping("/")
	public ModelAndView mantenimiento() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mantenimiento");
		return mav;
	}
}
