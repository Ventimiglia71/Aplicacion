package com.cice.aulas.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class reservasController {

	@GetMapping("/preConsulta")
	public ModelAndView preConsulta() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("preConsulta");
		return mav;
	}
}
