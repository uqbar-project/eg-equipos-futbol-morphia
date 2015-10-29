package ar.edu.jugadoresMorphia.domain

import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors
import org.mongodb.morphia.annotations.Embedded

@Accessors
@Embedded
class Jugador implements Serializable {
	
	String nombre
	String posicion
	
	// Constructor vacío, lo necesita Morphia
	new() {
		
	}
	
	new(String nombre, String posicion) {
		this.nombre = nombre
		this.posicion = posicion
	}

	override toString() {
		nombre
	}	
	
	override equals(Object otro) {
		nombre.equals((otro as Jugador).nombre)
	}
	
	override hashCode() {
		nombre.hashCode
	}
	
}