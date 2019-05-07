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

	new() {
		val mongo = new MongoClient("localhost", 27017)
		new Morphia => [
			map(Equipo).map(Jugador)
			ds = createDatastore(mongo, "test") // O "local", dependiendo dónde lo corras
			ds.ensureIndexes
		]
		println("Conectado a MongoDB. Bases: " + ds.getDB.collectionNames)
	}

	override getJugadores(JugadorBusqueda jugadorBusqueda) {
		// 
		if (jugadorBusqueda.equipo !== null) {
			val iterator = ds.find(Equipo)
				.field("equipo").equal(jugadorBusqueda.nombreEquipo)
				.iterator

			if (iterator.hasNext) {
				val jugadores = (iterator.next as Equipo).jugadores
				println("*/Búsqueda x Equipo: " + jugadorBusqueda.nombreEquipo)
				println("*/Resultado: " + jugadores)
				println("****************************************")
				return jugadores
			}
		}

		val nombreComienzaCon = jugadorBusqueda.nombreComienzaCon
		if (nombreComienzaCon !== null) {
			val List<Jugador> jugadores = new ArrayList<Jugador>
			val query = ds.createQuery(typeof(Equipo))
				.field("jugadores.nombre")
				.containsIgnoreCase(nombreComienzaCon)

			val iterator = ds
				.createAggregation(typeof(Equipo))
				.unwind("jugadores")
				.match(query)
				.aggregate(typeof(Equipo))

			iterator.forEach [
				val equipo = it as Equipo
				jugadores.addAll(equipo.jugadores)
			]			
			
			println("*/Búsqueda x Nombre: " + jugadorBusqueda.nombreComienzaCon)
			println("*/Resultado: " + jugadores)
			println("****************************************")
			return jugadores
		}
	}

}
