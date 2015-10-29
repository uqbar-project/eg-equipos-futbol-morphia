package ar.edu.jugadoresMorphia.domain

import java.io.Serializable
import java.util.ArrayList
import java.util.List
import org.bson.types.ObjectId
import org.eclipse.xtend.lib.annotations.Accessors
import org.mongodb.morphia.annotations.Entity
import org.mongodb.morphia.annotations.Id
import org.mongodb.morphia.annotations.Property

@Entity("jugadores")
@Accessors
class Equipo implements Serializable {
	
	@Id ObjectId id
	
	@Property("equipo")
	String nombre
	
	List<Jugador> jugadores
	
	new() {
		this("")
	}
	
	new(String nombre) {
		this.nombre = nombre
		this.jugadores = new ArrayList<Jugador>
	}
	
}