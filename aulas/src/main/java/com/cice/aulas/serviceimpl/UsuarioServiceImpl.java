package com.cice.aulas.serviceimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cice.aulas.entities.Usuario;
import com.cice.aulas.repositories.IUsuarioRepository;
import com.cice.aulas.service.IUsuarioService;

@Service
public class UsuarioServiceImpl implements IUsuarioService {
	
	@Autowired
	IUsuarioRepository usuarioRepository;

	@Override
	public void addUsuario(Usuario u) {
		usuarioRepository.save(u);		
	}

	@Override
	public List<Usuario> findAll() {	
		List<Usuario> usuarios = new ArrayList<Usuario>();
		usuarios = (List<Usuario>) usuarioRepository.findAll();		
		return usuarios;
	}

	@Override
	public void deleteUsuario(long numero) {
		usuarioRepository.deleteById(numero);		
	}
}
