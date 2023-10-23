class Casillero {
	
	method paso(unJugador){
		
	}
	method cayo(unJugador){
		
	}

}

object salida inherits Casillero{
	
	override method paso(unJugador){
		unJugador.cobrar(5000)
	}

}

