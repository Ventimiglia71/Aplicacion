package com.cice.aulas.service;

import java.util.List;

import com.cice.aulas.entities.Aula;

public interface IAulasService {
	public List<Aula> aulasPorSede(Integer codSede);
}