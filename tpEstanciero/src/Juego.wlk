import Tablero.*
class Juego {
  const property jugadores = []
  var property estaTerminado = false
  const property tablero 
  
  method empezar() {
    if (not self.estaTerminado()) {
      jugadores.forEach { jugador => self.queJuegue(jugador) }
    }
  }
  
  method queJuegue(unJugador) {
  	// TODO: Hacer
  	const unNumero = unJugador.tirarDados()
  	const unosCasilleros = tablero.casillerosDesdeHasta(unJugador.casilleroActual(), unNumero)
  	unJugador.moverseDeCasillero(unosCasilleros)
  }
  
}
