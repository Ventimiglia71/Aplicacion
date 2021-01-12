package com.cice.aulas.repositories;

import org.springframework.data.repository.CrudRepository;

import com.cice.aulas.entities.Usuario;

public interface IUsuarioRepository extends CrudRepository<Usuario, Long> {
	
	public Usuario findByUsername(String username);

}
