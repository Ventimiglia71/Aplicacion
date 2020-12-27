package com.cice.aulas.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="sedes")
public class Sede {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cod_sede;
	private String nombre_sede;
	private String direccion;
	private int num_aulas;
	private String telefono;
	public Sede(int cod_sede, String nombre_sede, String direccion, int num_aulas, String telefono) {
		super();
		this.cod_sede = cod_sede;
		this.nombre_sede = nombre_sede;
		this.direccion = direccion;
		this.num_aulas = num_aulas;
		this.telefono = telefono;
	}
	public Sede() {
		super();
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
