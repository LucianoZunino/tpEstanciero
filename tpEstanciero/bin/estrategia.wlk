import Jugador.*

object standar{
	 method comprarPropiedad(unaPropiedad, unJugador){
	 	unJugador.transferirPropiedad(unaPropiedad)
	}
}

object garca{
	 
	 method comprarPropiedad(unaPropiedad, unJugador){
	 	
	 	if (unaPropiedad.esPropiedadParaGarca(unJugador)){
	 		unJugador.transferirPropiedad(unaPropiedad)
	 	}
	 }
}

object imperialista{
	
	method comprarPropiedad(unaPropiedad, unJugador){
		if (unaPropiedad.esPropiedadParaImperialista(unJugador)){
	 		unJugador.transferirPropiedad(unaPropiedad)
	 	}	
	}
}
