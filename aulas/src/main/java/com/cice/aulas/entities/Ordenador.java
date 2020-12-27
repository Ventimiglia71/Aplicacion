package com.cice.aulas.entities;




import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Entity
@Table(name="ordenadores")
@Data
@AllArgsConstructor
@NoArgsConstructor

public class Ordenador {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int cod_ordenador;
	@NonNull
	private String tipo_ordenador;
	@NonNull
	private String tamano_pant;
	@NonNull
	private String cpu;
	@NonNull
	private String ram;
	
}
