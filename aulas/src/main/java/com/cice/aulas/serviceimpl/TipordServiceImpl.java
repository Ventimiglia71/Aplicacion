package com.cice.aulas.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cice.aulas.entities.TipOrd;
import com.cice.aulas.repositories.ITipordRepository;
import com.cice.aulas.service.ITipordService;

@Service
public class TipordServiceImpl implements ITipordService{
	@Autowired
	ITipordRepository tipordRepo;
	
	@Override
	public List<TipOrd> allTiposOrdenador() {
		return tipordRepo.findAll();
	}

	@Override
	public List<TipOrd> findAll() {
		return (List<TipOrd>) tipordRepo.findAll();
	}
	
}
