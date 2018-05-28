package ar.edu.jugadoresMorphia.repo

import ar.edu.jugadoresMorphia.domain.Equipo
import ar.edu.jugadoresMorphia.domain.Jugador
import com.mongodb.MongoClient
import java.util.ArrayList
import java.util.List
import org.mongodb.morphia.Datastore
import org.mongodb.morphia.Morphia

class RepoJugadoresMongoDB implements RepoJugadores {

	Datastore ds
	Morphia morphia

	new() {
		val mongo = new MongoClient("localhost", 27017)
		morphia = new Morphia => [
			map(typeof(Equipo)).map(typeof(Jugador))
			ds = createDatastore(mongo, "test") // O "local", dependiendo dónde lo corras
			ds.ensureIndexes
		]
		println("Conectado a MongoDB. Bases: " + ds.getDB.collectionNames)
	}

	override getJugadores(JugadorBusqueda jugadorBusqueda) {
		var List<Jugador> jugadores = new ArrayList<Jugador>

		// 
		if (jugadorBusqueda.equipo !== null) {
			val iterator = ds.find(typeof(Equipo))
				.field("equipo").equal(jugadorBusqueda.nombreEquipo).iterator

			if (iterator.hasNext) {
				jugadores = (iterator.next as Equipo).jugadores
			}
			println("1/Resultado: " + jugadores)
			println("****************************************")
		}

		val nombreComienzaCon = jugadorBusqueda.nombreComienzaCon
		if (nombreComienzaCon !== null) {
			val query = ds.createQuery(typeof(Equipo))
				.field("jugadores.nombre")
				.containsIgnoreCase(jugadorBusqueda.nombreComienzaCon)

			val iterator = ds
				.createAggregation(typeof(Equipo))
				.unwind("jugadores")
				.match(query)
				.aggregate(typeof(Equipo))
			
			while (iterator.hasNext) {
				val equipo = iterator.next as Equipo
				println("jugadores: " + equipo.jugadores)
				jugadores.addAll(equipo.jugadores)
			}
			println("*/Resultado: " + jugadores)
			println("****************************************")
		}
		jugadores
	}

}
