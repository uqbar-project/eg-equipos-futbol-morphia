package ar.edu.jugadoresMorphia.repo

import ar.edu.jugadoresMorphia.domain.Equipo
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class JugadorBusqueda {
	
	Equipo equipo
	String nombreComienzaCon
	String posicion
	
	new() {
		this(null)	
	}
	
	new(Equipo equipo) {
		this.equipo = equipo
	}
	
	override toString() {
		var result = "Busqueda de jugadores " 
		if (posicion !== null) {
			result += " - posicion " + posicion
		}
		if (equipo !== null) {
			result += " - equipo " + nombreEquipo
		}
		if (nombreComienzaCon !== null) {
			result += " - nombre comienza con " + nombreComienzaCon
		}
		result		
	}
	
	def getNombreEquipo() {
		this.equipo.nombre
	}
	
}