import Jugador.*
import Casillero.*

class Propiedad inherits Casillero {
	const property precioInicial
	var property duenio = banco
	
	method valorDeRenta(unJugador){
		return 0
	}
	
	method sosEmpresa() = return false
	
	method rentaPara(unJugador){}
	
	method valorDeVenta(){
		return self.precioInicial()
	}


	
	
}