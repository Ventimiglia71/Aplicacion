package com.cice.aulas.entities;

public class Mes {
	private int codMes;
	private String nombreMes;
	public Mes(int codMes, String nombreMes) {
		super();
		this.codMes = codMes;
		this.nombreMes = nombreMes;
	}
	public Mes() {
		super();
	}
	public int getCodMes() {
		return codMes;
	}
	public void setCodMes(int codMes) {
		this.codMes = codMes;
	}
	public String getNombreMes() {
		return nombreMes;
	}
	public void setNombreMes(String nombreMes) {
		this.nombreMes = nombreMes;
	}
	@Override
	public String toString() {
		return "Mes [codMes=" + codMes + ", nombreMes=" + nombreMes + "]";
	}
	
	
}
