package com.cice.aulas.service;

import java.util.List;

import com.cice.aulas.entities.Aula;

public interface IAulasService {
	public List<Aula> AllAulas();
	public List<Aula> aulasPorSede(Integer codSede);
	public String nombreAulaPorCodAula(Integer aulaSelec);
	public List<Aula> seleccionAulas(int sedeSelec, int tipoElegido, int numPuestos);
}
