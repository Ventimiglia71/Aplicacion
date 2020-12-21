package com.cice.aulas.entities;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="reservas")
public class Reserva {
	@Id
	private int cod_reserva;
	private int anyo;
	private int mes;
	private int dia;
	private int cod_aula;
	private String usuario;
	private int horaIni;
	private int horaFin;
	public Reserva(int cod_reserva, int anyo, int mes, int dia, int cod_aula, String usuario, int horaIni,
			int horaFin) {
		super();
		this.cod_reserva = cod_reserva;
		this.anyo = anyo;
		this.mes = mes;
		this.dia = dia;
		this.cod_aula = cod_aula;
		this.usuario = usuario;
		this.horaIni = horaIni;
		this.horaFin = horaFin;
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
	public int getCod_aula() {
		return cod_aula;
	}
	public void setCod_aula(int cod_aula) {
		this.cod_aula = cod_aula;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public int getHoraIni() {
		return horaIni;
	}
	public void setHoraIni(int horaIni) {
		this.horaIni = horaIni;
	}
	public int getHoraFin() {
		return horaFin;
	}
	public void setHoraFin(int horaFin) {
		this.horaFin = horaFin;
	}
	@Override
	public String toString() {
		return "Reserva [cod_reserva=" + cod_reserva + ", anyo=" + anyo + ", mes=" + mes + ", dia=" + dia
				+ ", cod_aula=" + cod_aula + ", usuario=" + usuario + ", horaIni=" + horaIni + ", horaFin=" + horaFin
				+ "]";
	}
	
	
}