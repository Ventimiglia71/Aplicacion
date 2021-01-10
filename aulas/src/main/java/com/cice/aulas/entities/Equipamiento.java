package com.cice.aulas.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="equipamientos")
public class Equipamiento {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cod_equipo;
	private String nombre_equipo;
	private String descripcion;
	
	public Equipamiento() {		
	}

	public Equipamiento(int cod_equipo, String nombre_equipo, String descripcion) {		
		this.cod_equipo = cod_equipo;
		this.nombre_equipo = nombre_equipo;
		this.descripcion = descripcion;
	}

	public int getCod_equipo() {
		return cod_equipo;
	}

	public void setCod_equipo(int cod_equipo) {
		this.cod_equipo = cod_equipo;
	}

	public String getNombre_equipo() {
		return nombre_equipo;
	}

	public void setNombre_equipo(String nombre_equipo) {
		this.nombre_equipo = nombre_equipo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

}
