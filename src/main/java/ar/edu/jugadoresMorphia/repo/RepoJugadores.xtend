package ar.edu.jugadoresMorphia.repo

import ar.edu.jugadoresMorphia.domain.Jugador
import java.util.List

interface RepoJugadores {
	
	def List<Jugador> getJugadores(JugadorBusqueda jugadorBusqueda)
	
}