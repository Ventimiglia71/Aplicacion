package com.cice.aulas.service;

import java.util.List;

import com.cice.aulas.entities.Usuario;

public interface IUsuarioService {
	
	public void addUsuario(Usuario u);
	public List<Usuario> findAll();
	public void deleteUsuario(long numero);
}
