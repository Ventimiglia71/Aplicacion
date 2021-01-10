package com.cice.aulas.serviceimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cice.aulas.entities.Aula;
import com.cice.aulas.repositories.IAulasRepository;
import com.cice.aulas.service.IAulasService;

@Service
public class AulasServiceImpl implements IAulasService {
	@Autowired
	IAulasRepository aulasRepo;
	
	@Override
	public List<Aula> aulasPorSede(Integer codSede) {
		return aulasRepo.aulasPorSede(codSede);
	}

	@Override
	public String nombreAulaPorCodAula(Integer aulaSelec) {
		return aulasRepo.nombreAulaPorCodAula(aulaSelec);
	}

	@Override
	public List<Aula> AllAulas() {
		return aulasRepo.findAll();
	}

	@Override
	public List<Aula> seleccionAulas(int sedeSelec, int tipoElegido, int numPuestos) {
		return aulasRepo.seleccionAulas(sedeSelec, tipoElegido, numPuestos);
	}

	@Override
	public void addAula(Aula a) {
		aulasRepo.save(a);
		
	}

	@Override
	public List<Aula> findAll() {
		List<Aula> aulas = new ArrayList<Aula>();
		aulas = (List<Aula>) aulasRepo.findAll();		
		return aulas;
	}

	@Override
	public void deleteAula(int cod_aula) {
		aulasRepo.deleteById(cod_aula);
		
	}

}
