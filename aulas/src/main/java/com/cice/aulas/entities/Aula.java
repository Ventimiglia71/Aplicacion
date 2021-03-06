package com.cice.aulas.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="aulas")
public class Aula {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cod_aula;
	private String nombre_aula;
	private int num_aula;
	private int num_puestos;
	private int cod_tipord;
	@Column(nullable=true)
	private int cod_equipo;
	private int cod_sede;
	
	public Aula(int cod_aula, String nombre_aula, int num_aula, int num_puestos, int cod_tipord, int cod_equipo,
			int cod_sede) {
		super();
		this.cod_aula = cod_aula;
		this.nombre_aula = nombre_aula;
		this.num_aula = num_aula;
		this.num_puestos = num_puestos;
		this.cod_tipord = cod_tipord;
		this.cod_equipo = cod_equipo;
		this.cod_sede = cod_sede;
	}
	public Aula() {
		super();
	}
	public int getCod_aula() {
		return cod_aula;
	}
	public void setCod_aula(int cod_aula) {
		this.cod_aula = cod_aula;
	}
	public String getNombre_aula() {
		return nombre_aula;
	}
	public void setNombre_aula(String nombre_aula) {
		this.nombre_aula = nombre_aula;
	}
	public int getNum_aula() {
		return num_aula;
	}
	public void setNum_aula(int num_aula) {
		this.num_aula = num_aula;
	}
	public int getNum_puestos() {
		return num_puestos;
	}
	public void setNum_puestos(int num_puestos) {
		this.num_puestos = num_puestos;
	}
	public int getCod_tipord() {
		return cod_tipord;
	}
	public void setCod_tipord(int cod_tipord) {
		this.cod_tipord = cod_tipord;
	}
	public int getCod_equipo() {
		return cod_equipo;
	}
	public void setCod_equipo(int cod_equipo) {
		this.cod_equipo = cod_equipo;
	}
	public int getCod_sede() {
		return cod_sede;
	}
	public void setCod_sede(int cod_sede) {
		this.cod_sede = cod_sede;
	}
	@Override
	public String toString() {
		return "Aula [cod_aula=" + cod_aula + ", nombre_aula=" + nombre_aula + ", num_aula=" + num_aula
				+ ", num_puestos=" + num_puestos + ", cod_tipord=" + cod_tipord + ", cod_equipo=" + cod_equipo
				+ ", cod_sede=" + cod_sede + "]";
	}
	
	
}
