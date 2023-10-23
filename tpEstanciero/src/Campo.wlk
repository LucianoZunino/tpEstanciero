import Propiedad.*
import Jugador.*
class Campo inherits Propiedad {
	const property provinciaPerteneciente
	const property valorDeRenta
	const property costoDeConstruccion
	var property cantidadDeEstancias
	
	override method valorDeRenta(_unJugador){
		return (2**cantidadDeEstancias) * valorDeRenta
	}

	method esPropiedadParaGarca(_unJugador){
		return !provinciaPerteneciente.unicoDuenio()
	}
	
	method esPropiedadParaImperialista(unJugador){
		return (provinciaPerteneciente.yaTieneCampo(unJugador) or (provinciaPerteneciente.unicoDuenio() and self.duenio() == banco))
			
		}
	method puedeConstruir(){
		return provinciaPerteneciente.cumpleParaConstruir(self)
	}
	method construirEstancia(){
		if (self.puedeConstruir()){
			self.duenio().pagarA(banco, costoDeConstruccion)
			cantidadDeEstancias ++
		}
	}
	override method rentaPara(unJugador){
		unJugador.pagarA(self.duenio(), self.valorDeRenta())
		
	}
	
	override method cayo(unJugador){
		duenio.jugadorEnPropiedad(unJugador, self.valorDeRenta())
	}
}