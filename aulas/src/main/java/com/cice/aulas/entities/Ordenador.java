package com.cice.aulas.entities;




import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ordenadores")
public class Ordenador {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int cod_ordenador;
	private int cod_tipord;
	private String tamano_pant;
	private String cpu;
	private String ram;
	public Ordenador(int cod_ordenador, int cod_tipord, String tamano_pant, String cpu, String ram) {
		super();
		this.cod_ordenador = cod_ordenador;
		this.cod_tipord = cod_tipord;
		this.tamano_pant = tamano_pant;
		this.cpu = cpu;
		this.ram = ram;
	}
	public Ordenador() {
		super();
	}
	public int getCod_ordenador() {
		return cod_ordenador;
	}
	public void setCod_ordenador(int cod_ordenador) {
		this.cod_ordenador = cod_ordenador;
	}
	public int getCod_tipord() {
		return cod_tipord;
	}
	public void setCod_tipord(int cod_tipord) {
		this.cod_tipord = cod_tipord;
	}
	public String getTamano_pant() {
		return tamano_pant;
	}
	public void setTamano_pant(String tamano_pant) {
		this.tamano_pant = tamano_pant;
	}
	public String getCpu() {
		return cpu;
	}
	public void setCpu(String cpu) {
		this.cpu = cpu;
	}
	public String getRam() {
		return ram;
	}
	public void setRam(String ram) {
		this.ram = ram;
	}
	@Override
	public String toString() {
		return "Ordenador [cod_ordenador=" + cod_ordenador + ", cod_tipord=" + cod_tipord + ", tamano_pant="
				+ tamano_pant + ", cpu=" + cpu + ", ram=" + ram + "]";
	}
	
}
