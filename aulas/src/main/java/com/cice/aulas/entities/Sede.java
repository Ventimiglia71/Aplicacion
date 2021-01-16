package com.cice.aulas.entities;

/**
 * Sede es una clase que contiene toda la información relativa a cada una de las sedes de la acedemia.
 * Dicha información se guarda en la tabla llamada "sedes".
 * Los campos son:
 * 	- cod_sede:  Código identificativo de la sede. Es generado automáticamente por el sistema.
 * 	- nombre_sede:  Nombre de la sede.
 * 	- direccion:  Dirección donde se encuentra la sede.
 * 	- num_aulas:  Número de aulas que hay en la sede.
 * 	- telefono:  Teléfono de la sede.
 */

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="sedes")
public class Sede {
	@Id
	@Column
	private int cod_sede;
	
	@Column
	private String nombre_sede;
	
	@Column
	private String direccion;
	
	@Column
	private int num_aulas;
	
	@Column
	private String telefono;
	
	public Sede() {
		super();
	}

	public Sede(int cod_sede, String nombre_sede, String direccion, String telefono, int num_aulas) {
		super();
		this.cod_sede = cod_sede;
		this.nombre_sede = nombre_sede;
		this.direccion = direccion;
		this.num_aulas = num_aulas;
		this.telefono = telefono;
	}

	public int getCod_sede() {
		return cod_sede;
	}

	public void setCod_sede(int cod_sede) {
		this.cod_sede = cod_sede;
	}

	public String getNombre_sede() {
		return nombre_sede;
	}

	public void setNombre_sede(String nombre_sede) {
		this.nombre_sede = nombre_sede;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public int getNum_aulas() {
		return num_aulas;
	}

	public void setNum_aulas(int num_aulas) {
		this.num_aulas = num_aulas;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	@Override
	public String toString() {
		return "Sede [cod_sede=" + cod_sede + ", nombre_sede=" + nombre_sede + ", direccion=" + direccion
				+ ", num_aulas=" + num_aulas + ", telefono=" + telefono + "]";
	}
}
