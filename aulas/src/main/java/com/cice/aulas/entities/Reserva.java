package com.cice.aulas.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="reservas")
public class Reserva {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cod_reserva;
	private String usuario;
	private int cod_aula;
	private int anyo;
	private int mes;
	private int dia;
	private int hora;
	public Reserva(int cod_reserva, String usuario, int cod_aula, int anyo, int mes, int dia, int hora) {
		super();
		this.cod_reserva = cod_reserva;
		this.usuario = usuario;
		this.cod_aula = cod_aula;
		this.anyo = anyo;
		this.mes = mes;
		this.dia = dia;
		this.hora = hora;
	}
	public Reserva() {
		super();
	}
	public int getCod_reserva() {
		return cod_reserva;
	}
	public void setCod_reserva(int cod_reserva) {
		this.cod_reserva = cod_reserva;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public int getCod_aula() {
		return cod_aula;
	}
	public void setCod_aula(int cod_aula) {
		this.cod_aula = cod_aula;
	}
	public int getAnyo() {
		return anyo;
	}
	public void setAnyo(int anyo) {
		this.anyo = anyo;
	}
	public int getMes() {
		return mes;
	}
	public void setMes(int mes) {
		this.mes = mes;
	}
	public int getDia() {
		return dia;
	}
	public void setDia(int dia) {
		this.dia = dia;
	}
	public int getHora() {
		return hora;
	}
	public void setHora(int hora) {
		this.hora = hora;
	}
	@Override
	public String toString() {
		return "Reserva [cod_reserva=" + cod_reserva + ", usuario=" + usuario + ", cod_aula=" + cod_aula + ", anyo="
				+ anyo + ", mes=" + mes + ", dia=" + dia + ", hora=" + hora + "]";
	}
	
}
