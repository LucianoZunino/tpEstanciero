

object libre {
	
	method tirarDados(unJugador){
		const dado1 = 1.randomUpTo(7)
 		const dado2 = 1.randomUpTo(7)
 		if (dado1 === dado2){
 			unJugador.cambiarEstado(estadoCarcelario1)
 			unJugador.irALaCarcel()
 			return 0
 		}
 		return dado1 + dado2
 		
	}
}
object estadoCarcelario3 {
	
	method tirarDados(unJugador){
		unJugador.cambiarEstado(libre)
 		return 0
	}
}
object estadoCarcelario2{
	
	method tirarDados(unJugador){
		 unJugador.cambiarEstado(estadoCarcelario3)
 		return 0
 		}
 }
object estadoCarcelario1{
	
	method tirarDados(unJugador){
		
 		const dado1 = 1.randomUpTo(7)
 		const dado2 = 1.randomUpTo(7)
 		
 		if (dado1 === dado2 ) {
 			unJugador.cambiarEstado(libre)
 			return 0
 		}else{
 			unJugador.cambiarEstado(estadoCarcelario2)
 			return 0
 		}
 	}
}


	
