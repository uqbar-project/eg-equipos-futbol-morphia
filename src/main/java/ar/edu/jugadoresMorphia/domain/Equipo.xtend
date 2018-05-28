package ar.edu.jugadoresMorphia.domain

import java.io.Serializable
import java.util.List
import org.bson.types.ObjectId
import org.eclipse.xtend.lib.annotations.Accessors
import org.mongodb.morphia.annotations.Entity
import org.mongodb.morphia.annotations.Id
import org.mongodb.morphia.annotations.Property

@Entity("equipos")
@Accessors
class Equipo implements Serializable {
	
	@Id ObjectId id
	
	@Property("equipo")
	String nombre = ""
	
	// Se puede anotar con @Reference pero Morphia se da cuenta
	List<Jugador> jugadores = newArrayList
	
	new() {	}
	
	new(String nombre) {
		this.nombre = nombre
	}
	
}