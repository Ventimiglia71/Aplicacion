package com.cice.aulas.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cice.aulas.entities.Ordenador;

public interface IOrdenadorRepository extends JpaRepository<Ordenador, Integer> {

}
