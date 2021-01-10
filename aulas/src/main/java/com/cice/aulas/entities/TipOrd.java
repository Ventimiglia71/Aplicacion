package com.cice.aulas.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tiposordenador")
public class TipOrd {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int cod_tipord;
	private String tipo;
	public TipOrd(int cod_tipord, String tipo) {
		super();
		this.cod_tipord = cod_tipord;
		this.tipo = tipo;
	}
	public TipOrd() {
		super();
	}
	public int getCod_tipord() {
		return cod_tipord;
	}
	public void setCod_tipord(int cod_tipord) {
		this.cod_tipord = cod_tipord;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	@Override
	public String toString() {
		return "TipOrd [cod_tipord=" + cod_tipord + ", tipo=" + tipo + "]";
	}
}
