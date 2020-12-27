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
	private int anyo;
	private int mes;
	private int dia;
	private int cod_aula;
	private String usuario;
	private int hora_ini;
	private int hora_fin;
	public Reserva(int cod_reserva, int anyo, int mes, int dia, int cod_aula, String usuario, int hora_ini,
			int hora_fin) {
		super();
		this.cod_reserva = cod_reserva;
		this.anyo = anyo;
		this.mes = mes;
		this.dia = dia;
		this.cod_aula = cod_aula;
		this.usuario = usuario;
		this.hora_ini = hora_ini;
		this.hora_fin = hora_fin;
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
	public int getHora_ini() {
		return hora_ini;
	}
	public void setHora_ini(int hora_ini) {
		this.hora_ini = hora_ini;
	}
	public int getHora_fin() {
		return hora_fin;
	}
	public void setHora_fin(int hora_fin) {
		this.hora_fin = hora_fin;
	}
	@Override
	public String toString() {
		return "Reserva [cod_reserva=" + cod_reserva + ", anyo=" + anyo + ", mes=" + mes + ", dia=" + dia
				+ ", cod_aula=" + cod_aula + ", usuario=" + usuario + ", hora_ini=" + hora_ini + ", hora_fin="
				+ hora_fin + "]";
	}
}
